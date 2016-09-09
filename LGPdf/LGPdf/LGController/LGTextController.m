//
//  LGTextController.m
//  LGPdf
//
//  Created by Luna Gao on 16/9/8.
//  Copyright © 2016年 luna.gao. All rights reserved.
//

#import "LGTextController.h"

@implementation LGTextController

- (float)add:(LGPdfText*)element withPageInfo:(LGPageInfo)pageInfo withNowHeight:(int)LGPdf_write_height {
    self.LGPdfTextElement = element;
    NSMutableParagraphStyle *paragraph = [[NSMutableParagraphStyle alloc] init];
    paragraph.alignment = self.LGPdfTextElement.align;
    NSDictionary *dict = @{NSFontAttributeName: self.LGPdfTextElement.font,
                           NSParagraphStyleAttributeName: paragraph,
                           NSForegroundColorAttributeName: self.LGPdfTextElement.foregroundColor};
    
    CGSize fontSize = [self.LGPdfTextElement.text sizeWithFont:self.LGPdfTextElement.font constrainedToSize:CGSizeZero lineBreakMode:NSLineBreakByWordWrapping];
    
    if (self.LGPdfTextElement.fullLine) {
        if (self.LGPdfTextElement.length == -1) {
            fontSize.width = pageInfo.width;
        } else {
            fontSize.width = self.LGPdfTextElement.length;
        }
        
    }
    if (self.LGPdfTextElement.fullHeight) {
        fontSize.height = pageInfo.height;
    }
    
    float y = self.LGPdfTextElement.location.y;
    if (self.LGPdfTextElement.singleLine) {
        y = y + LGPdf_write_height;
    }
    [self.LGPdfTextElement.text drawInRect:CGRectMake(self.LGPdfTextElement.location.x, y, fontSize.width, fontSize.height) withAttributes:dict];
    self.LGPdfTextFontSize = fontSize;
    return fontSize.height;
}

- (int)getTextHeight {
    return self.LGPdfTextFontSize.height;
}

@end
