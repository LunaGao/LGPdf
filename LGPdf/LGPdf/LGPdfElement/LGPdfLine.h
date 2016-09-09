//
//  LGPdfLine.h
//  LGPdf
//
//  Created by Luna Gao on 16/9/9.
//  Copyright © 2016年 luna.gao. All rights reserved.
//

#import "LGPdfBaseElement.h"

@interface LGPdfLine : LGPdfBaseElement

@property(atomic) CGPoint endLocation; // default 0,0
@property(atomic) float borderWidth; // default 1

@end
