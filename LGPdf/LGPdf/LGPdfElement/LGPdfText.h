//
//  LGPdfText.h
//  LGPdf
//
//  Created by Luna Gao on 16/9/6.
//  Copyright © 2016年 luna.gao. All rights reserved.
//

#import "LGPdfBaseElement.h"

@interface LGPdfText : LGPdfBaseElement

@property(atomic) NSString* text; // default @""
@property(atomic) UIFont* font; // default [UIFont systemFontOfSize:11]
@property(atomic) NSTextAlignment align; // default NSTextAlignmentCenter
@property(atomic) Boolean fullLine; // default YES
@property(atomic) Boolean fullHeight; // default NO
@property(atomic) int length; // default -1

@end
