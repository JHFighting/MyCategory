//
//  NSDate+JH.m
//  hospital
//
//  Created by e1858 on 15/6/11.
//  Copyright (c) 2015年 e1858. All rights reserved.
//

#import "NSDate+JH.h"

@implementation NSDate (JH)

+ (instancetype)dateWithStringTime:(NSString *)string
{
    NSDateFormatter *inputFormatter = [[NSDateFormatter alloc] init];
//    NSTimeZone* timeZone = [NSTimeZone timeZoneWithName:@"Asia/beijing"];
//    [inputFormatter setTimeZone:timeZone];
    [inputFormatter setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"UTC"]];
    [inputFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate* inputDate = [inputFormatter dateFromString:string];
    return inputDate;
}

@end
