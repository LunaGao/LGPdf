//
//  LGLineController.m
//  LGPdf
//
//  Created by Luna Gao on 16/9/9.
//  Copyright © 2016年 luna.gao. All rights reserved.
//

#import "LGLineController.h"

@implementation LGLineController

- (void)add:(LGPdfLine *)element withContext:(CGContextRef)pdfContext{
    CGContextSetStrokeColorWithColor(pdfContext, element.foregroundColor.CGColor);
    CGContextSetLineWidth(pdfContext, element.borderWidth);
    CGContextMoveToPoint(pdfContext, element.location.x, element.location.y);
    CGContextAddLineToPoint(pdfContext, element.endLocation.x, element.endLocation.y);
    CGContextStrokePath(pdfContext);
}

@end
