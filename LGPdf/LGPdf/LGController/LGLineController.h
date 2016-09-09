//
//  LGLineController.h
//  LGPdf
//
//  Created by Luna Gao on 16/9/9.
//  Copyright © 2016年 luna.gao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LGPdfLine.h"

@interface LGLineController : NSObject

- (void)add:(LGPdfLine *)element withContext:(CGContextRef)pdfContext;

@end
