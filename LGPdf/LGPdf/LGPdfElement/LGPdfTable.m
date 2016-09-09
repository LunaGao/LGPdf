//
//  LGPdfTable.m
//  LGPdf
//
//  Created by Luna Gao on 16/9/8.
//  Copyright © 2016年 luna.gao. All rights reserved.
//

#import "LGPdfTable.h"

@implementation LGPdfTable {
    NSArray* LGPdf_Table_widths;
    NSArray* LGPdf_Table_perWidths;
}



- (instancetype)init {
    self = [super init];
    if (self) {
        self.columns = 1;
        self.tableWidth = -1;
        self.fullLine = YES;
        self.paddingLeft = 10;
        self.paddignRight = 10;
        self.borderWidth = 1;
        self.cells = [[NSMutableArray alloc] init];
        return self;
    }
    return nil;
}

- (void)add:(LGPdfCell *)element {
    [self.cells addObject:element];
}

- (void)setColumnsWidth:(NSArray*) widths {
    LGPdf_Table_widths = widths;
}

- (void)setColumnsWidthByPercent:(NSArray*) widths {
    LGPdf_Table_perWidths = widths;
}

- (void)DOMORETHINGS {
    self.tableWidth = self.tableWidth - self.paddignRight - self.paddingLeft;
    if (!LGPdf_Table_widths) {
        self.columns = LGPdf_Table_perWidths.count;
        NSMutableArray *perWidth = [[NSMutableArray alloc] init];
        for (int i = 0; i < LGPdf_Table_perWidths.count; i++) {
            [perWidth addObject:[NSNumber numberWithFloat:(self.tableWidth*[LGPdf_Table_perWidths[i] floatValue])]];
        }
        LGPdf_Table_widths = [[NSArray alloc] initWithArray:perWidth copyItems:YES];
    } else {
        self.columns = LGPdf_Table_widths.count;
    }
}

- (int)getCellWidth:(int)column WithRow:(int)row WithColumnCount:(int)columnCount WithRowCount:(int)rowCount {
#warning need to more things
    return [LGPdf_Table_widths[column] intValue];
}

- (int)getCellX:(int)column {
    int length = 0;
    for (int i = 0; i < column; i++) {
        length = length + [LGPdf_Table_widths[i] intValue];
    }
    return length;
}

@end
