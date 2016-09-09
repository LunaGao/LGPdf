//
//  LGPdfBaseElement.h
//  LGPdf
//
//  Created by Luna Gao on 16/9/6.
//  Copyright © 2016年 luna.gao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface LGPdfBaseElement : NSObject

@property(atomic) CGPoint location; // default 0,0
@property(atomic) UIColor* foregroundColor; // default black
@property(atomic) Boolean singleLine; // default YES

@end
