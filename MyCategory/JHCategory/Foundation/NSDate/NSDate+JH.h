//
//  NSDate+JH.h
//  hospital
//
//  Created by e1858 on 15/6/11.
//  Copyright (c) 2015年 e1858. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (JH)

/**
 *  通过字符串返回NSDate
 *
 *  @param string 时间字符串 字符串格式 YYYY-MM-dd HH:mm:ss
 *
 *  @return NSDate
 */
+ (instancetype)dateWithStringTime:(NSString *)string;

@end
