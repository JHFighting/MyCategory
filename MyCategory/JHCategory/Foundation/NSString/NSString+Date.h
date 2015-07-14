//
//  NSString+Date.h
//  hospital
//
//  Created by e1858 on 15/5/28.
//  Copyright (c) 2015年 e1858. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Date)



/**
 *  获取当前时间字符串 格式为  yyyy-MM-dd HH:mm
 */
+ (instancetype)stringWithCurrentDate;

/**
 *  获取日期
 *
 *  @param year  传入1为1年以后的日期 -1为年之前的日期 0为今年
 *  @param month 1为1个月以后的日期 -1为一个月之前的日期 0为本月
 *  @param day   1为1天以后的日期 -1为一天之前的日期 0为今天
 *
 *  @return 返回日期字符串
 */
+ (NSString *)stringGetDate:(int)year month:(int)month day:(int)day;

+ (NSString *)stringGetDate:(int)year month:(int)month day:(int)day withDate:(NSDate *)date;

@end
