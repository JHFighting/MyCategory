//
//  UIImage+JH.h
//  JIANCAI
//
//  Created by e1858 on 15/3/17.
//  Copyright (c) 2015年 JH. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (JH)

/**
 *  图片压缩
 *
 *  @param image 原图片
 *  @param size  压缩尺寸
 *
 *  @return 返回压缩后的图片
 */
+ (UIImage *)originImage:(UIImage *)image scaleToSize:(CGSize)size;

+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size;

+ (UIImage *)imageWithColor:(UIColor *)color;

/**
 *  合并两张图片
 */
+ (UIImage *)mergeImage:(UIImage*)firstImage withImage:(UIImage*)secondImage;

/**
 *  通过 UIImageOrientation 重新绘制出新的相应方向的图片
 */
+ (UIImage *)image:(UIImage *)image rotation:(UIImageOrientation)orientation;

@end
