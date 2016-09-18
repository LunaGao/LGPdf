//
//  LGPdf.h
//  LGPdf
//
//  Created by Luna Gao on 16/9/6.
//  Copyright © 2016年 luna.gao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "LGPdfPageInfo.h"
#import "LGPdfText.h"
#import "LGPdfCell.h"
#import "LGPdfImage.h"
#import "LGPdfTable.h"
#import "LGTableController.h"
#import "LGTextController.h"
#import "LGImageController.h"

//! Project version number for LGPdf.
FOUNDATION_EXPORT double LGPdfVersionNumber;

//! Project version string for LGPdf.
FOUNDATION_EXPORT const unsigned char LGPdfVersionString[];

// In this header, you should import all the public headers of your framework using statements like #import <LGPdf/PublicHeader.h>

@import UIKit;

@interface LGPdf : NSObject

@property NSString* pdfFileFullPath;

+ (LGPdf*) createPDF;

- (void)setFileName:(NSString *)fileName pageSize:(LGPageInfo)pageInfo;
- (void)readyToWrite;
- (void)newPage;
- (void)closeToWrite;

- (void)addText:(LGPdfText *)element;
- (void)addTable:(LGPdfTable *)element;
- (void)addImage:(LGPdfImage *)element;

@end
