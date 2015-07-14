//
//  UIColor+JH.h
//
//  Created by e1858 on 15/5/4.
//  Copyright (c) 2015年 JH. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (JH)


// 颜色渐变
+ (UIColor *)gradientFromColor:(UIColor *)firstColor toColor:(UIColor *)secondColor withHeight:(int)height;

@end
