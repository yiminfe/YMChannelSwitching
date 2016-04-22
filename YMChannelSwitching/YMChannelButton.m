//代码地址：https://github.com/iosdeveloperSVIP/YMChannelSwitching
//原创：iosdeveloper赵依民
//邮箱：iosdeveloper@vip.163.com
//
//  YMChannelButton.m
//  YMChannelSwitching
//
//  Created by mac on 16/4/20.
//  Copyright © 2016年 YiMin. All rights reserved.
//

#import "YMChannelButton.h"

@implementation YMChannelButton

-(void)ym_setScale:(CGFloat)scale red:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue{
    CGFloat ym_maxScale = 0.2;
    [self setTitleColor:[UIColor colorWithRed:red green:green blue:blue alpha:0.8 + ym_maxScale*scale] forState:UIControlStateNormal];
    [UIView animateWithDuration:0.25 animations:^{
        self.transform = CGAffineTransformMakeScale(1+ym_maxScale*scale, 1+ym_maxScale*scale);
    }];
}

@end
