//
//  LGPdfCellConfig.m
//  LGPdf
//
//  Created by Luna Gao on 16/9/12.
//  Copyright © 2016年 luna.gao. All rights reserved.
//

#import "LGPdfCellConfig.h"

@implementation LGPdfCellConfig

- (instancetype)init {
    self = [super init];
    if (self) {
        self.isEmpty = YES;
        self.isDraw = NO;
        self.isBooked = NO;
        self.cell = nil;
        self.isTopInCell = NO;
        self.isLeftInCell = NO;
        self.isBottomInCell = NO;
        self.isRightInCell = NO;
        return self;
    }
    return nil;
}

@end
