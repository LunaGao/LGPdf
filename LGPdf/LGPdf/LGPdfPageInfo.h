//
//  LGPdfPageInfo.h
//  LGPdf
//
//  Created by Luna Gao on 16/9/6.
//  Copyright © 2016年 luna.gao. All rights reserved.
//

#ifndef LGPdfPageInfo_h
#define LGPdfPageInfo_h

struct LGPageInfo {
    int width;
    int height;
};
typedef struct LGPageInfo LGPageInfo;

#define ANSI_A CGRectMake(0,0,612,792)
#define ANSI_B CGRectMake(0,0,792,1224)
#define ANSI_C CGRectMake(0,0,1584,1224)
#define ANSI_D CGRectMake(0,0,2448,1584)
#define ANSI_E CGRectMake(0,0,3168,2448)

#define ISO216_A0 CGRectMake(0,0,A0_S,A0_L)
#define ISO216_A1 CGRectMake(0,0,A1_S,A1_L)
#define ISO216_A2 CGRectMake(0,0,A2_S,A2_L)
#define ISO216_A3 CGRectMake(0,0,A3_S,A3_L)
#define ISO216_A4 CGRectMake(0,0,A4_S,A4_L)
#define ISO216_A5 CGRectMake(0,0,A5_S,A5_L)
#define ISO216_A6 CGRectMake(0,0,A6_S,A6_L)
#define ISO216_A7 CGRectMake(0,0,A7_S,A7_L)
#define ISO216_A8 CGRectMake(0,0,A8_S,A8_L)

#define ANSI_A_HORIZONTAL CGRectMake(0,0,792,612)
#define ANSI_B_HORIZONTAL CGRectMake(0,0,1224,792)
#define ANSI_C_HORIZONTAL CGRectMake(0,0,1224,1584)
#define ANSI_D_HORIZONTAL CGRectMake(0,0,1584,2448)
#define ANSI_E_HORIZONTAL CGRectMake(0,0,2448,3168)

#define ISO216_A0_HORIZONTAL CGRectMake(0,0,A0_L,A0_S)
#define ISO216_A1_HORIZONTAL CGRectMake(0,0,A1_L,A1_S)
#define ISO216_A2_HORIZONTAL CGRectMake(0,0,A2_L,A2_S)
#define ISO216_A3_HORIZONTAL CGRectMake(0,0,A3_L,A3_S)
#define ISO216_A4_HORIZONTAL CGRectMake(0,0,A4_L,A4_S)
#define ISO216_A5_HORIZONTAL CGRectMake(0,0,A5_L,A5_S)
#define ISO216_A6_HORIZONTAL CGRectMake(0,0,A6_L,A6_S)
#define ISO216_A7_HORIZONTAL CGRectMake(0,0,A7_L,A7_S)
#define ISO216_A8_HORIZONTAL CGRectMake(0,0,A8_L,A8_S)

#define A0_L 3370
#define A0_S 2384
#define A1_L A0_S
#define A1_S 1684
#define A2_L A1_S
#define A2_S 1190
#define A3_L A2_S
#define A3_S 842
#define A4_L A3_S
#define A4_S 595
#define A5_L A4_S
#define A5_S 420
#define A6_L A5_S
#define A6_S 298
#define A7_L A6_S
#define A7_S 210
#define A8_L A7_S
#define A8_S 148

#endif /* LGPdfPageInfo_h */
