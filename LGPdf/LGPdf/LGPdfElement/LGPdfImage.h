//
//  LGPdfImage.h
//  LGPdf
//
//  Created by Luna Gao on 16/9/18.
//  Copyright © 2016年 luna.gao. All rights reserved.
//

#import "LGPdfBaseElement.h"

@interface LGPdfImage : LGPdfBaseElement

@property UIImage *image;
@property NSData * data;
@property CGSize size;

@end
