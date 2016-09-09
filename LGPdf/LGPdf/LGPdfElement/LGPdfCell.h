//
//  LGPdfCell.h
//  LGPdf
//
//  Created by Luna Gao on 16/9/8.
//  Copyright © 2016年 luna.gao. All rights reserved.
//

#import "LGPdfBaseElement.h"

@interface LGPdfCell : LGPdfBaseElement

@property(atomic) LGPdfBaseElement* element; // default nil
@property(atomic) int length; // default 0

@end
