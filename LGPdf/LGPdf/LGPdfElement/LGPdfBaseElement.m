//
//  LGPdfBaseElement.m
//  LGPdf
//
//  Created by Luna Gao on 16/9/6.
//  Copyright © 2016年 luna.gao. All rights reserved.
//

#import "LGPdfBaseElement.h"

@implementation LGPdfBaseElement

- (instancetype)init {
    if (self) {
        struct CGPoint point = {0, 0};
        self.foregroundColor = [UIColor blackColor];
        self.location = point;
        self.singleLine = YES;
        return self;
    }
    return nil;
}

@end
