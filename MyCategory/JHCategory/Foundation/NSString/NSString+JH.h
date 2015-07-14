//
//  NSString+JH.h
//  JIANCAI
//
//  Created by e1858 on 15/3/9.
//  Copyright (c) 2015年 E1858. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (JH)

/**
 *  计算文字size
 *
 *  @param font    字体大小
 *  @param maxSize 最大size
 *
 *  @return 文字size
 */
- (CGSize)sizeWithFont:(int)font maxSize:(CGSize)maxSize;

/**
 *  计算年龄
 *
 *  @param year 当前年 字符串
 *
 *  @return 年龄
 */
+ (instancetype)ageStringWithBirthYear:(NSString *)year;

/**
 *  去除空格
 *
 *  @param string 原字符串
 *
 *  @return 返回无空格的字符串
 */
+ (instancetype)stringByRemoveWhitespaceWithString:(NSString *)string;


@end
