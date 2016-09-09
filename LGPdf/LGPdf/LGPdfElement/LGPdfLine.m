//
//  LGPdfLine.m
//  LGPdf
//
//  Created by Luna Gao on 16/9/9.
//  Copyright © 2016年 luna.gao. All rights reserved.
//

#import "LGPdfLine.h"

@implementation LGPdfLine

- (instancetype)init {
    self = [super init];
    if (self) {
        struct CGPoint point = {0, 0};
        self.endLocation = point;
        self.borderWidth = 1.0f;
        return self;
    }
    return nil;
}

@end
