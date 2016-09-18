//
//  LGImageController.m
//  LGPdf
//
//  Created by Luna Gao on 16/9/18.
//  Copyright © 2016年 luna.gao. All rights reserved.
//

#import "LGImageController.h"

@implementation LGImageController

- (void) add:(LGPdfImage *)element withContext:(CGContextRef)pdfContext withNowHeight:(int)LGPdf_write_height{
//    CFDataRef imgData = (__bridge CFDataRef)element.data;
//    CGDataProviderRef dataProvider = CGDataProviderCreateWithCFData(imgData);
//    CGImageRef image = CGImageCreateWithJPEGDataProvider(dataProvider,
//                                                         NULL,
//                                                         NO,
//                                                         kCGRenderingIntentDefault);
//    float y = element.location.y;
//    if (element.singleLine) {
//        y = y + LGPdf_write_height;
//    }
//    CGContextDrawImage(pdfContext, CGRectMake(element.location.x, y, element.size.width, element.size.height), image);
//    
//    CGDataProviderRelease(dataProvider);
//    CGImageRelease(image);
    float y = element.location.y;
    if (element.singleLine) {
        y = y + LGPdf_write_height;
    }
    [element.image drawInRect:CGRectMake(element.location.x, y, element.size.width, element.size.height)];
}

- (int) getImageHeight:(LGPdfImage *)element {
    int y = 0;
    if (element.singleLine) {
        y = element.location.y;
    }
    return y;
}

@end
