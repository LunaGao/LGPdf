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
    
    LGPdfText* text1 = [[LGPdfText alloc] init];
    [text1 setText:@"hello world 你好世界"];
    
    LGPdfText* text = [[LGPdfText alloc] init];
    [text setText:@"hello world 你好世界111"];
    [text setAlign:NSTextAlignmentCenter];
    
    
    [pdf addText:text];
    [text setFont:[UIFont boldSystemFontOfSize:12]];
//    [pdf addText:text];
//    [text setLength:200];
//    [pdf addText:text];
    [text setForegroundColor:[UIColor redColor]];
//    [pdf addText:text];
    
//    struct CGPoint point = {100, 100};
//    [text setLocation:point];
//    [pdf addText:text];
    
    LGPdfTable *table = [[LGPdfTable alloc] init];
    [table setBorderWidth:0.1];
    NSArray *cWidth = [NSArray arrayWithObjects:@0.3f, @0.2f, @0.2f, @0.3f, nil];
    [table setColumnsWidthByPercent:cWidth];
    
    LGPdfCell *cell1 = [[LGPdfCell alloc] init];
    [cell1 setElement:text];
    [table add:cell1];
    LGPdfCell *cell2 = [[LGPdfCell alloc] init];
    [text1 setText:@"我不开心了"];
    [text1 setFont:[UIFont boldSystemFontOfSize:9]];
    [cell2 setElement:text1];
    [table add:cell2];
    [table add:cell2];
    [table add:cell2];
    [table add:cell2];
    [table add:cell2];
    [table add:cell2];
    [table add:cell2];
    [table add:cell2];
    [table add:cell2];
    [table add:cell2];
    [table add:cell2];
    
    [pdf addTable:table];
    
    [pdf closeToWrite];
//    [pdf testPDF];
}

@end
