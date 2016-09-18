//
//  LGImageController.h
//  LGPdf
//
//  Created by Luna Gao on 16/9/18.
//  Copyright © 2016年 luna.gao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LGPdfImage.h"

@interface LGImageController : NSObject

- (int) getImageHeight:(LGPdfImage *)element;
- (void) add:(LGPdfImage *)element withContext:(CGContextRef)pdfContext withNowHeight:(int)LGPdf_write_height;

@end
