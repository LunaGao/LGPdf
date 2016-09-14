//
//  LGPdfTable.h
//  LGPdf
//
//  Created by Luna Gao on 16/9/8.
//  Copyright © 2016年 luna.gao. All rights reserved.
//

#import "LGPdfBaseElement.h"
#import "LGPdfCell.h"
#import "LGPdfCellConfig.h"

@interface LGPdfTable : LGPdfBaseElement

@property(atomic) int columns; // default 1
@property(atomic) int rows; // default 0;
@property(atomic) int tableWidth; // default -1
@property(atomic) int paddingLeft; // default 10
@property(atomic) int paddignRight; // default 10
@property(atomic) float borderWidth; // default 1
@property(atomic) Boolean fullLine; // default YES
@property(atomic) NSArray* LGPdf_Table_widths;

@property(atomic) NSMutableArray* cells;

@property NSMutableArray<NSMutableArray<LGPdfCellConfig *> *> *tableCellConfig;

- (void)setColumnsWidth:(NSArray *) widths;
- (void)setColumnsWidthByPercent:(NSArray*) widths;
- (void)DOMORETHINGS;

- (void)add:(LGPdfCell*)element;

- (int)getCellWidth:(int)column WithRow:(int)row WithColumnCount:(int)columnCount WithRowCount:(int)rowCount;
- (int)getCellX:(int)column;

@end
