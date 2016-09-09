//
//  LGTableController.m
//  LGPdf
//
//  Created by Luna Gao on 16/9/8.
//  Copyright © 2016年 luna.gao. All rights reserved.
//

#import "LGTableController.h"

@implementation LGTableController {
    CGContextRef LGPdf_table_pdfContext;
    LGPdfTable * LGPdf_table_pdfElement;
    LGPageInfo LGPdf_table_pageInfo;
    int LGPdf_table_now_Height;
}



- (void) addTable :(LGPdfTable *) element withContext:(CGContextRef) pdfContext withPageInfo:(LGPageInfo)pageInfo {
    LGPdf_table_pdfElement = element;
    LGPdf_table_pdfContext = pdfContext;
    LGPdf_table_pageInfo = pageInfo;
    [self drawLineForHorizontalFirst];
    [self drawCells];
}

#pragma mark - draw line

- (void) drawLineForHorizontalFirst {
    LGPdf_table_now_Height = LGPdf_table_pdfElement.location.y;
    
    LGPdfLine *line = [[LGPdfLine alloc] init];
    struct CGPoint start = {LGPdf_table_pdfElement.location.x, LGPdf_table_now_Height};
    struct CGPoint end = {LGPdf_table_pdfElement.location.x + LGPdf_table_pdfElement.tableWidth, LGPdf_table_now_Height};
    line.location = start;
    line.endLocation = end;
    line.foregroundColor = LGPdf_table_pdfElement.foregroundColor;
    line.borderWidth = LGPdf_table_pdfElement.borderWidth;
    
    LGLineController *controller = [[LGLineController alloc] init];
    [controller add:line withContext:LGPdf_table_pdfContext];
}

- (void) drawLineForHorizontalCell:(float)height {
    LGPdf_table_now_Height = LGPdf_table_now_Height + height;
    
    LGPdfLine *line = [[LGPdfLine alloc] init];
    struct CGPoint start = {LGPdf_table_pdfElement.location.x, LGPdf_table_now_Height};
    struct CGPoint end = {LGPdf_table_pdfElement.location.x + LGPdf_table_pdfElement.tableWidth, LGPdf_table_now_Height};
    line.location = start;
    line.endLocation = end;
    line.foregroundColor = LGPdf_table_pdfElement.foregroundColor;
    line.borderWidth = LGPdf_table_pdfElement.borderWidth;
    
    LGLineController *controller = [[LGLineController alloc] init];
    [controller add:line withContext:LGPdf_table_pdfContext];
}

- (void) drawLineForCell:(float)height {
    LGLineController *controller = [[LGLineController alloc] init];
    for (int i = 1; i < LGPdf_table_pdfElement.columns; i ++) {
        struct CGPoint start = {[LGPdf_table_pdfElement getCellX:i], LGPdf_table_now_Height};
        struct CGPoint end = {[LGPdf_table_pdfElement getCellX:i], LGPdf_table_now_Height + height};
        LGPdfLine *line = [[LGPdfLine alloc] init];
        line.location = start;
        line.endLocation = end;
        line.foregroundColor = LGPdf_table_pdfElement.foregroundColor;
        line.borderWidth = LGPdf_table_pdfElement.borderWidth;
        [controller add:line withContext:LGPdf_table_pdfContext];
    }
}

- (void) drawLineForTableVertical {
    LGPdfLine *line = [[LGPdfLine alloc] init];
    struct CGPoint start1 = {LGPdf_table_pdfElement.location.x, LGPdf_table_pdfElement.location.y};
    struct CGPoint end1 = {LGPdf_table_pdfElement.location.x, LGPdf_table_now_Height};
    line.location = start1;
    line.endLocation = end1;
    line.foregroundColor = LGPdf_table_pdfElement.foregroundColor;
    line.borderWidth = LGPdf_table_pdfElement.borderWidth;
    
    LGLineController *controller = [[LGLineController alloc] init];
    [controller add:line withContext:LGPdf_table_pdfContext];
    
    struct CGPoint start2 = {LGPdf_table_pdfElement.location.x + LGPdf_table_pdfElement.tableWidth, LGPdf_table_pdfElement.location.y};
    struct CGPoint end2 = {LGPdf_table_pdfElement.location.x + LGPdf_table_pdfElement.tableWidth, LGPdf_table_now_Height};
    line.location = start2;
    line.endLocation = end2;
    [controller add:line withContext:LGPdf_table_pdfContext];
}

#pragma mark - draw cell

- (void) drawCells {
    int rows = LGPdf_table_pdfElement.cells.count / LGPdf_table_pdfElement.columns;
    for (int i = 0; i < rows; i++) {
        float height = 0;
        for(int j = 0 ; j < LGPdf_table_pdfElement.columns; j++) {
            int cellIndex = i*LGPdf_table_pdfElement.columns+j;
            float tempHeight = [self drawOneCell:LGPdf_table_pdfElement.cells[cellIndex] withColumn:j withRow:i];
            height = height > tempHeight ? height : tempHeight;
        }
        [self drawLineForCell:height];
        [self drawLineForHorizontalCell:height];
    }
    [self drawLineForTableVertical];
}

- (float) drawOneCell:(LGPdfCell *) cell withColumn:(int)column withRow:(int)row {
    if (cell) {
        if ([cell.element isKindOfClass:[LGPdfText class]]) {
            LGPdfText *text = (LGPdfText *)cell.element;
            int lenght = [LGPdf_table_pdfElement getCellWidth:column WithRow:row WithColumnCount:1 WithRowCount:1];
            text.length = lenght;
            struct CGPoint point = {[LGPdf_table_pdfElement getCellX:column], 0};
            text.location = point;
            
            LGTextController *controller = [[LGTextController alloc] init];
            return [controller add:text withPageInfo:LGPdf_table_pageInfo withNowHeight:LGPdf_table_now_Height];
        }
    } else {
#warning cell is nil
    }
    return 0.0f;
}

@end
