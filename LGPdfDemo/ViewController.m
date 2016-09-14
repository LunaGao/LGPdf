//
//  ViewController.m
//  LGPdfDemo
//
//  Created by Luna Gao on 16/9/6.
//  Copyright © 2016年 luna.gao. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)CreatePdf:(id)sender {
    LGPdf *pdf = [LGPdf createPDF];
    struct LGPageInfo size = {A4_L,A4_S};
    [pdf setFileName:@"demo.pdf" pageSize:size];
    [pdf readyToWrite];
    [pdf newPage];
    
    // text
    
    LGPdfText* text = [[LGPdfText alloc] init];
    [text setText:@"hello world 你好世界"];
    [text setAlign:NSTextAlignmentCenter];
    [text setFont:[UIFont boldSystemFontOfSize:12]];
    [text setForegroundColor:[UIColor redColor]];
//    [text setLength:200];
//    struct CGPoint point = {100, 100};
//    [text setLocation:point];
    [pdf addText:text];
    
    
    // table
    
    LGPdfTable *table = [[LGPdfTable alloc] init];
    [table setBorderWidth:0.1];
    NSArray *cWidth = [NSArray arrayWithObjects:@0.1f, @0.1f, @0.2f, @0.2f, @0.2f, @0.1f, @0.1f, nil];
    [table setColumnsWidthByPercent:cWidth];
    
    [self addCell:table WithValue:@"1" WithColSpan:3 WithRowSpan:3];
    [self addCell:table WithValue:@"2" WithColSpan:2 WithRowSpan:1];
    [self addCell:table WithValue:@"3" WithColSpan:1 WithRowSpan:2];
    [self addCell:table WithValue:@"4" WithColSpan:1 WithRowSpan:2];
    [self addCell:table WithValue:@"5" WithColSpan:2 WithRowSpan:1];
    [self addCell:table WithValue:@"6" WithColSpan:2 WithRowSpan:1];
    [self addCell:table WithValue:@"7" WithColSpan:2 WithRowSpan:1];
    [self addCell:table WithValue:@"8" WithColSpan:4 WithRowSpan:1];
    [self addCell:table WithValue:@"9" WithColSpan:1 WithRowSpan:1];
    [self addCell:table WithValue:@"10" WithColSpan:1 WithRowSpan:1];
    [self addCell:table WithValue:@"11" WithColSpan:1 WithRowSpan:1];
    [self addCell:table WithValue:@"12" WithColSpan:1 WithRowSpan:3];
    [self addCell:table WithValue:@"13" WithColSpan:5 WithRowSpan:3];
    [self addCell:table WithValue:@"14" WithColSpan:1 WithRowSpan:1];
    [self addCell:table WithValue:@"15" WithColSpan:1 WithRowSpan:1];
    [self addCell:table WithValue:@"16" WithColSpan:1 WithRowSpan:1];
    [self addCell:table WithValue:@"17" WithColSpan:2 WithRowSpan:1];
    [self addCell:table WithValue:@"18" WithColSpan:1 WithRowSpan:1];
    [self addCell:table WithValue:@"19" WithColSpan:4 WithRowSpan:1];
    
    [pdf addTable:table];
    
    [pdf closeToWrite];
}

- (void) addCell:(LGPdfTable*) table WithValue:(NSString *)value WithColSpan:(int) colspan WithRowSpan:(int) rowSpan {
    LGPdfCell *cell = [[LGPdfCell alloc] init];
    LGPdfText* text = [[LGPdfText alloc] init];
    [text setText:value];
    [text setFont:[UIFont boldSystemFontOfSize:9]];
    [cell setElement:text];
    [cell setColspan:colspan];
    [cell setRowspan:rowSpan];
    [table add:cell];
}

@end
