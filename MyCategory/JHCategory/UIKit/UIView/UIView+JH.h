//
//  UIView+JH.h
//  JIANCAI
//
//  Created by e1858 on 15/1/27.
//  Copyright (c) 2015年 E1858. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (JH)

@property (assign, nonatomic) CGFloat x;
@property (assign, nonatomic) CGFloat y;
@property (assign, nonatomic) CGFloat width;
@property (assign, nonatomic) CGFloat height;
@property (assign, nonatomic) CGSize  size;
@property (assign, nonatomic) CGPoint origin;
@property (assign, nonatomic) CGFloat bottom;
/**
 *  圆角
 */
@property (assign, nonatomic) CGFloat radius;

/**
 *  通过xib创建视图
 */
+ (instancetype)createViewFromXIB;

/**
 *  添加边框
 */
- (void)setBorderWithColor:(UIColor *)borderColor andWidth:(CGFloat)borderWidth;

@end
