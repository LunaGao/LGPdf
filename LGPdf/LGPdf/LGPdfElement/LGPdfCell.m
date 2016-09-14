//
//  LGPdfCell.m
//  LGPdf
//
//  Created by Luna Gao on 16/9/8.
//  Copyright © 2016年 luna.gao. All rights reserved.
//

#import "LGPdfCell.h"

@implementation LGPdfCell

- (instancetype)init {
    self = [super init];
    if (self) {
        self.element = nil;
        self.length = -1;
        self.rowspan = 1;
        self.colspan = 1;
        return self;
    }
    return nil;
}

@end
