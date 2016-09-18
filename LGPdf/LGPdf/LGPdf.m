//
//  LGPdf.m
//  LGPdf
//
//  Created by Luna Gao on 16/9/5.
//  Copyright © 2016年 luna.gao. All rights reserved.
//

#import "LGPdf.h"

@implementation LGPdf {
    int LGPdf_write_height;
    LGPageInfo LGPdf_pageInfo;
    CGContextRef LGPdf_pdfContext;
    LGTableController *tableController;
    LGTextController *textController;
    LGImageController *imageController;
    NSString* pdfFileFullPath;
}

#pragma mark - pdf create

+ (LGPdf *) createPDF {
    static LGPdf *pdfInstance = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        pdfInstance = [[self alloc] init];
    });
    return pdfInstance;
}

#pragma mark - pdf config

- (void) setFileName:(NSString *) fileName pageSize:(LGPageInfo) pageInfo {
    NSString *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
    pdfFileFullPath = [path stringByAppendingPathComponent:fileName];
    LGPdf_pageInfo = pageInfo;
    
    tableController = [[LGTableController alloc] init];
    textController = [[LGTextController alloc] init];
    imageController = [[LGImageController alloc] init];
}

- (NSString *)getPdfFile {
    return pdfFileFullPath;
}

#pragma mark - pdf page

- (void)newPage {
    UIGraphicsBeginPDFPage();
    LGPdf_write_height = 0;
}

- (void)readyToWrite {
    CGRect bounds = CGRectMake(0,0,LGPdf_pageInfo.width,LGPdf_pageInfo.height);
    UIGraphicsBeginPDFContextToFile(pdfFileFullPath, bounds, nil);
    LGPdf_pdfContext = UIGraphicsGetCurrentContext();
}

- (void)closeToWrite {
    UIGraphicsEndPDFContext();
}

#pragma mark - add text

- (void)addText:(LGPdfText*)element {
    [textController add:element withPageInfo:LGPdf_pageInfo withNowHeight:LGPdf_write_height];
    LGPdf_write_height = LGPdf_write_height + [textController getTextHeight];
}

#pragma mark - add table

- (void)addTable:(LGPdfTable *)element {
    if ([element fullLine]) {
        struct CGPoint point = {element.paddingLeft, LGPdf_write_height};
        element.location = point;
    }
    if (element.tableWidth == -1) {
        element.tableWidth = LGPdf_pageInfo.width;
    }
    
    [element DOMORETHINGS];
    [tableController addTable:element withContext:LGPdf_pdfContext withPageInfo:LGPdf_pageInfo];
    LGPdf_write_height = LGPdf_write_height + [tableController getTableHeight];
}


#pragma mark - add image

- (void)addImage:(LGPdfImage *)element {
    [imageController add:element withContext:LGPdf_pdfContext withNowHeight:LGPdf_write_height];
    LGPdf_write_height = LGPdf_write_height + [imageController getImageHeight:element];
}

@end
