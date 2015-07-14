//
//  UIView+JH.m
//  JIANCAI
//
//  Created by e1858 on 15/1/27.
//  Copyright (c) 2015年 E1858. All rights reserved.
//

#import "UIView+JH.h"

@implementation UIView (JH)

- (void)setX:(CGFloat)x
{
    CGRect frame   = self.frame;
    frame.origin.x = x;
    self.frame     = frame;
}

- (CGFloat)x
{
    return self.frame.origin.x;
}

- (void)setY:(CGFloat)y
{
    CGRect frame   = self.frame;
    frame.origin.y = y;
    self.frame     = frame;
}

- (CGFloat)y
{
    return self.frame.origin.y;
}

- (void)setWidth:(CGFloat)width
{
    CGRect frame     = self.frame;
    frame.size.width = width;
    self.frame       = frame;
}

- (CGFloat)width
{
    return self.frame.size.width;
}

- (void)setHeight:(CGFloat)height
{
    CGRect frame      = self.frame;
    frame.size.height = height;
    self.frame        = frame;
}

- (CGFloat)height
{
    return self.frame.size.height;
}

- (void)setSize:(CGSize)size
{
    CGRect frame = self.frame;
    frame.size   = size;
    self.frame   = frame;
}

- (CGSize)size
{
    return self.frame.size;
}

- (void)setOrigin:(CGPoint)origin
{
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame   = frame;
}

- (CGPoint)origin
{
    return self.frame.origin;
}

- (void)setBottom:(CGFloat)bottom
{
    CGRect frame = self.frame;
    frame.origin.y = bottom - frame.size.height;
    self.frame = frame;
}

- (CGFloat)bottom
{
    return self.frame.origin.y + self.frame.size.height;
}

- (void)setRadius:(CGFloat)radius
{
    if (radius <= 0) {
        radius = self.frame.size.width / 2;
    }
    
    self.layer.cornerRadius = radius;
    self.clipsToBounds = YES;
}

- (CGFloat)radius
{
    return 0;
}

+ (instancetype)createViewFromXIB
{
    NSString *name  = NSStringFromClass(self);
    UIView *xibView = [[[NSBundle mainBundle] loadNibNamed:name owner:self options:nil] lastObject];
    NSAssert(xibView != nil, @"创建失败");
    return xibView;
}

- (void)setBorderWithColor:(UIColor *)borderColor andWidth:(CGFloat)borderWidth
{
    self.layer.borderColor = borderColor.CGColor;
    self.layer.borderWidth = borderWidth;
}

@end
