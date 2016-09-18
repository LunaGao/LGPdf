# LGPdf
[![Bless](https://cdn.rawgit.com/LunaGao/BlessYourCodeTag/master/tags/god.svg)](http://lunagao.github.io/BlessYourCodeTag/)

#Create pdf file in iOS

Easy way to create Pdf file in iOS.

#Demo

This project is the Demo project

#Pdf screenshot
![Screenshot](https://cdn.rawgit.com/LunaGao/LGPdf/master/Image/screenshot.png)

#How to Use

##Pod

```
    pod ???
```

#Gudie

##Init Pdf
```
    LGPdf *pdf = [LGPdf createPDF];
    struct LGPageInfo size = {A4_L,A4_S};
    [pdf setFileName:@"demo.pdf" pageSize:size];
    [pdf readyToWrite];
    [pdf newPage];
```

##Text

```
    LGPdfText* text = [[LGPdfText alloc] init];
    [text setText:@"hello pdf"];
    [pdf addText:text];
```

##Table
Please see the demo code

##Image
```
    LGPdfImage *image = [[LGPdfImage alloc] init];
    UIImage *uiImage = [UIImage imageNamed:@"pdf_png"];
    [image setImage:uiImage];
    struct CGSize imageSize = {100, 100};
    [image setSize:imageSize];

    [pdf addImage:image];
```

##Close Pdf
```
    [pdf closeToWrite];
    NSLog(@"%@", [pdf getPdfFile]);
```
