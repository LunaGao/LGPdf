//
//  LGTextController.h
//  LGPdf
//
//  Created by Luna Gao on 16/9/8.
//  Copyright © 2016年 luna.gao. All rights reserved.
//

#ifndef __LGTextController

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "LGPdfText.h"
#import "LGPdfPageInfo.h"

@interface LGTextController : NSObject

@property(nonatomic) LGPdfText *LGPdfTextElement;
@property CGSize LGPdfTextFontSize;

- (float)add:(LGPdfText*)element withPageInfo:(LGPageInfo)pageInfo withNowHeight:(int)LGPdf_write_height;
- (float)getTextHeight:(LGPdfText*)element withPageInfo:(LGPageInfo)pageInfo withNowHeight:(int)LGPdf_write_height;
- (void)add:(LGPdfText*)element withPoint:(CGPoint)point withSize:(CGSize)size;

- (int)getTextHeight;

@end

#endif
