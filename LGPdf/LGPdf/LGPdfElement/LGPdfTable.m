//
//  LGPdfTable.m
//  LGPdf
//
//  Created by Luna Gao on 16/9/8.
//  Copyright © 2016年 luna.gao. All rights reserved.
//

#import "LGPdfTable.h"

@implementation LGPdfTable {
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
        self.tableCellConfig = [[NSMutableArray alloc] init];
        return self;
    }
    return nil;
}

- (void)add:(LGPdfCell *)element {
    LGPdfCellConfig *cellConfig = [self isHasEmptyCell];
    if (!cellConfig) {
        [self addInRowArrayWithCellConfig:1 WithLastRowIndex:self.tableCellConfig.count-1];
        cellConfig = self.tableCellConfig[self.tableCellConfig.count - 1][0];
    }
    if (cellConfig.row + element.rowspan > self.tableCellConfig.count) {
        int addRowsCount = cellConfig.row + element.rowspan - self.tableCellConfig.count;
        [self addInRowArrayWithCellConfig:addRowsCount WithLastRowIndex:self.tableCellConfig.count-1];
    }
    cellConfig.cell = element;
    int firstColumnIndex = cellConfig.column;
    int firstRowIndex = cellConfig.row;
    for (int rowIndex = 0; rowIndex < element.rowspan ; rowIndex ++) {
        for (int columnIndex = 0; columnIndex < element.colspan; columnIndex ++) {
            LGPdfCellConfig *config = self.tableCellConfig[firstRowIndex + rowIndex][firstColumnIndex + columnIndex];
            config.isEmpty = NO;
            if (columnIndex < element.colspan - 1 && element.colspan != 1) {
                config.isRightInCell = YES;
            }
            if (columnIndex > 0 && element.colspan != 1) {
                config.isLeftInCell = YES;
            }
            if (rowIndex > 0 && element.rowspan != 1) {
                config.isTopInCell = YES;
            }
            if (rowIndex < element.rowspan - 1 && element.rowspan != 1) {
                config.isBottomInCell = YES;
            }
            self.tableCellConfig[firstRowIndex + rowIndex][firstColumnIndex + columnIndex] = config;
        }
    }
    //TODO: maybe not need this code anymore
    [self.cells addObject:element];
}

- (LGPdfCellConfig *) isHasEmptyCell {
    LGPdfCellConfig *cellConfig;
    for (int rowIndex = 0; rowIndex < self.tableCellConfig.count; rowIndex ++) {
        for (int columnIndex = 0; columnIndex < self.tableCellConfig[rowIndex].count ; columnIndex ++) {
            LGPdfCellConfig *config = self.tableCellConfig[rowIndex][columnIndex];
            if (config.isEmpty) {
                cellConfig = config;
                break;
            }
        }
        if (cellConfig) {
            break;
        }
    }
    return cellConfig;
}

- (void) addInRowArrayWithCellConfig:(int) rows WithLastRowIndex:(int) rowIndex {
    for (int i = 0 ; i < rows; i ++) {
        NSMutableArray *rowArray = [[NSMutableArray alloc] init];
        for (int j = 0; j < self.columns; j ++) {
            LGPdfCellConfig *config = [[LGPdfCellConfig alloc] init];
            [config setRow:rowIndex + i + 1];
            [config setColumn:j];
            [rowArray addObject:config];
        }
        [self.tableCellConfig addObject:rowArray];
    }
}

- (void) addFirstRowCells {
    NSMutableArray *rowArray = [[NSMutableArray alloc] init];
    for (int j = 0; j < self.columns; j ++) {
        LGPdfCellConfig *config = [[LGPdfCellConfig alloc] init];
        [config setRow:0];
        [config setColumn:j];
        [rowArray addObject:config];
    }
    [self.tableCellConfig addObject:rowArray];
}

- (void)setColumnsWidth:(NSArray*) widths {
    self.LGPdf_Table_widths = widths;
    self.columns = self.LGPdf_Table_widths.count;
    [self addFirstRowCells];
}

- (void)setColumnsWidthByPercent:(NSArray*) widths {
    LGPdf_Table_perWidths = widths;
    self.columns = LGPdf_Table_perWidths.count;
    [self addFirstRowCells];
}

- (void)DOMORETHINGS {
    self.tableWidth = self.tableWidth - self.paddignRight - self.paddingLeft;
    if (!self.LGPdf_Table_widths) {
        self.columns = LGPdf_Table_perWidths.count;
        NSMutableArray *perWidth = [[NSMutableArray alloc] init];
        for (int i = 0; i < LGPdf_Table_perWidths.count; i++) {
            [perWidth addObject:[NSNumber numberWithFloat:(self.tableWidth*[LGPdf_Table_perWidths[i] floatValue])]];
        }
        self.LGPdf_Table_widths = [[NSArray alloc] initWithArray:perWidth copyItems:YES];
    } else {
        self.columns = self.LGPdf_Table_widths.count;
    }
}

- (int)getCellWidth:(int)column WithRow:(int)row WithColumnCount:(int)columnCount WithRowCount:(int)rowCount {
#warning need to more things
    return [self.LGPdf_Table_widths[column] intValue];
}

- (int)getCellX:(int)column {
    int length = 0;
    for (int i = 0; i < column; i++) {
        length = length + [self.LGPdf_Table_widths[i] intValue];
    }
    return length;
}

@end
