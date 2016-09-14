//
//  LGPdfCellConfig.h
//  LGPdf
//
//  Created by Luna Gao on 16/9/12.
//  Copyright © 2016年 luna.gao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LGPdfCell.h"

@interface LGPdfCellConfig : NSObject

@property LGPdfCell *cell; //default nil

@property Boolean *isTopInCell;
@property Boolean *isLeftInCell;
@property Boolean *isBottomInCell;
@property Boolean *isRightInCell;

@property int row;
@property int column;

@property Boolean *isEmpty; // default YES
@property Boolean *isDraw; // default NO
@property Boolean *isBooked; // default NO

@end
