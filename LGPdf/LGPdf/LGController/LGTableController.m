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
    NSMutableArray<NSMutableArray<LGPdfPoint *> *> *LGPdf_tablePoint;
    NSMutableArray<NSNumber*> *LGPdf_tableRowHeights;
    LGTextController *textController;
    LGLineController *lineController;
}

#pragma mark - add table

- (void) addTable :(LGPdfTable *) element withContext:(CGContextRef) pdfContext withPageInfo:(LGPageInfo)pageInfo {
    LGPdf_table_pdfElement = element;
    LGPdf_table_pdfContext = pdfContext;
    LGPdf_table_pageInfo = pageInfo;
    textController = [[LGTextController alloc] init];
    lineController = [[LGLineController alloc] init];
    [self configTable];
    [self drawCells];
}

#pragma mark - init

- (void) configTable {
    [self initTablePointX];
    [self initTableRowHeight];
    [self initTablePointY];
}

- (void) initTablePointX {
    LGPdf_tablePoint = [[NSMutableArray alloc] init];
    for (int i = 0; i <= LGPdf_table_pdfElement.tableCellConfig.count; i ++) {
        NSMutableArray *rowArray = [[NSMutableArray alloc] init];
        for (int j = 0; j <= LGPdf_table_pdfElement.columns; j ++) {
            LGPdfPoint *point = [[LGPdfPoint alloc] init];
            point.x = [LGPdf_table_pdfElement getCellX:j] + LGPdf_table_pdfElement.location.x;
            point.y = LGPdf_table_pdfElement.location.y + LGPdf_table_now_Height;
            NSLog(@"x => %d", point.x);
            [rowArray addObject:point];
        }
        [LGPdf_tablePoint addObject:rowArray];
    }
}

- (void) initTablePointY {
    for (int i = 1; i <= LGPdf_table_pdfElement.tableCellConfig.count; i ++) {
        for (int j = 0; j <= LGPdf_table_pdfElement.columns; j ++) {
            LGPdf_tablePoint[i][j].y = LGPdf_tablePoint[i-1][j].y + [LGPdf_tableRowHeights[i - 1] intValue] + LGPdf_table_now_Height;
            NSLog(@"y => %d", LGPdf_tablePoint[i][j].y);
        }
    }
}

- (void) initTableRowHeight {
    LGPdf_tableRowHeights = [[NSMutableArray alloc] init];
    for (int i = 0; i < LGPdf_table_pdfElement.tableCellConfig.count; i++) {
        int maxHeight = 0;
        for (int j = 0; j < LGPdf_table_pdfElement.columns; j ++) {
            if (!LGPdf_table_pdfElement.tableCellConfig[i][j].isTopInCell && !LGPdf_table_pdfElement.tableCellConfig[i][j].isBottomInCell) {
                int tempMax = [self getOneCellHeight:LGPdf_table_pdfElement.tableCellConfig[i][j].cell withColumn:j withRow:i];
                maxHeight = maxHeight > tempMax ? maxHeight : tempMax;
            }
        }
        [LGPdf_tableRowHeights addObject:[[NSNumber alloc] initWithInt:maxHeight]];
    }
}

#pragma mark - draw cell

- (void) drawCells {
    for (int i = 0; i < LGPdf_table_pdfElement.tableCellConfig.count; i++) {
        float height = 0;
        for(int j = 0 ; j < LGPdf_table_pdfElement.columns; j++) {
            [self drawCellLines:LGPdf_table_pdfElement.tableCellConfig[i][j]];
        }
    }
}

- (void) drawCellLines:(LGPdfCellConfig *)cellConfig {
    LGPdfLine *line = [[LGPdfLine alloc] init];
    line.foregroundColor = LGPdf_table_pdfElement.foregroundColor;
    line.borderWidth = LGPdf_table_pdfElement.borderWidth;
    
    if (!cellConfig.isTopInCell) {
        struct CGPoint start = {LGPdf_tablePoint[cellConfig.row][cellConfig.column].x, LGPdf_tablePoint[cellConfig.row][cellConfig.column].y};
        struct CGPoint end = {LGPdf_tablePoint[cellConfig.row][cellConfig.column + 1].x, LGPdf_tablePoint[cellConfig.row][cellConfig.column + 1].y};
        line.location = start;
        line.endLocation = end;
        [lineController add:line withContext:LGPdf_table_pdfContext];
    }
    if (!cellConfig.isBottomInCell) {
        struct CGPoint start = {LGPdf_tablePoint[cellConfig.row + 1][cellConfig.column].x, LGPdf_tablePoint[cellConfig.row + 1][cellConfig.column].y};
        struct CGPoint end = {LGPdf_tablePoint[cellConfig.row + 1][cellConfig.column + 1].x, LGPdf_tablePoint[cellConfig.row + 1][cellConfig.column + 1].y};
        line.location = start;
        line.endLocation = end;
        [lineController add:line withContext:LGPdf_table_pdfContext];
    }
    if (!cellConfig.isRightInCell) {
        struct CGPoint start = {LGPdf_tablePoint[cellConfig.row][cellConfig.column + 1].x, LGPdf_tablePoint[cellConfig.row][cellConfig.column + 1].y};
        struct CGPoint end = {LGPdf_tablePoint[cellConfig.row + 1][cellConfig.column + 1].x, LGPdf_tablePoint[cellConfig.row + 1][cellConfig.column + 1].y};
        line.location = start;
        line.endLocation = end;
        [lineController add:line withContext:LGPdf_table_pdfContext];
    }
    if (!cellConfig.isLeftInCell) {
        struct CGPoint start = {LGPdf_tablePoint[cellConfig.row][cellConfig.column].x, LGPdf_tablePoint[cellConfig.row][cellConfig.column].y};
        struct CGPoint end = {LGPdf_tablePoint[cellConfig.row][cellConfig.column].x, LGPdf_tablePoint[cellConfig.row + 1][cellConfig.column].y};
        line.location = start;
        line.endLocation = end;
        [lineController add:line withContext:LGPdf_table_pdfContext];
    }
}

- (float) drawOneCell:(LGPdfCell *) cell withColumn:(int)column withRow:(int)row {
    if (cell) {
        if ([cell.element isKindOfClass:[LGPdfText class]]) {
            LGPdfText *text = (LGPdfText *)cell.element;
            int lenght = [LGPdf_table_pdfElement getCellWidth:column WithRow:row WithColumnCount:1 WithRowCount:1];
            text.length = lenght;
            struct CGPoint point = {[LGPdf_table_pdfElement getCellX:column], 0};
            text.location = point;
            return [textController add:text withPageInfo:LGPdf_table_pageInfo withNowHeight:LGPdf_table_now_Height];
        }
    } else {
#warning cell is nil
    }
    return 0.0f;
}

#pragma mark - get cell height

- (float) getOneCellHeight:(LGPdfCell *) cell withColumn:(int)column withRow:(int)row {
    if (cell) {
        if ([cell.element isKindOfClass:[LGPdfText class]]) {
            LGPdfText *text = (LGPdfText *)cell.element;
            int lenght = [LGPdf_table_pdfElement getCellWidth:column WithRow:row WithColumnCount:1 WithRowCount:1];
            text.length = lenght;
            struct CGPoint point = {[LGPdf_table_pdfElement getCellX:column], 0};
            text.location = point;
            return [textController getTextHeight:text withPageInfo:LGPdf_table_pageInfo withNowHeight:LGPdf_table_now_Height];
        }
    } else {
#warning cell is nil
    }
    return 0.0f;
}

@end
