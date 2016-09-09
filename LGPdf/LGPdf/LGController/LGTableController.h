//
//  LGTableController.h
//  LGPdf
//
//  Created by Luna Gao on 16/9/8.
//  Copyright © 2016年 luna.gao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LGPdfTable.h"
#import "LGPdfPageInfo.h"
#import "LGPdfText.h"

#import "LGTextController.h"
#import "LGLineController.h"

@interface LGTableController : NSObject

- (void) addTable :(LGPdfTable *) element withContext:(CGContextRef)pdfContext withPageInfo:(LGPageInfo)pageInfo ;

@end
