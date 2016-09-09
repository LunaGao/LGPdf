//
//  LGPdfText.m
//  LGPdf
//
//  Created by Luna Gao on 16/9/6.
//  Copyright © 2016年 luna.gao. All rights reserved.
//

#import "LGPdfText.h"

@implementation LGPdfText

- (instancetype)init {
    self = [super init];
    if (self) {
        self.text = @"";
        self.font = [UIFont systemFontOfSize:11];
        self.align = NSTextAlignmentCenter;
        self.fullLine = YES;
        self.fullHeight = NO;
        self.length = -1;
        return self;
    }
    return nil;
}

@end
