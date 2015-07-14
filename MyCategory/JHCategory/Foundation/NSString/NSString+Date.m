//
//  NSString+Date.m
//  hospital
//
//  Created by e1858 on 15/5/28.
//  Copyright (c) 2015年 e1858. All rights reserved.
//

#import "NSString+Date.h"

@implementation NSString (Date)

+ (instancetype)stringWithCurrentDate
{
    NSDate *currentDate = [NSDate date];
    
    NSDateFormatter *dateformatter = [[NSDateFormatter alloc] init];
    
    [dateformatter setDateFormat:@"YYYY-MM-dd HH:mm"];
    
    NSString *timeString=[dateformatter stringFromDate:currentDate];
    
    return timeString;
}

+ (NSString *)stringGetDate:(int)year month:(int)month day:(int)day
{
    return [NSString stringGetDate:year month:month day:day withDate:[NSDate date]];
}

+ (NSString *)stringGetDate:(int)year month:(int)month day:(int)day withDate:(NSDate *)date
{
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *comps = nil;
    comps = [calendar components:NSYearCalendarUnit|NSMonthCalendarUnit|NSDayCalendarUnit fromDate:[NSDate date]];
    NSDateComponents *adcomps = [[NSDateComponents alloc] init];
    [adcomps setYear:year];
    [adcomps setMonth:month];
    [adcomps setDay:day];
    
    NSDate *newdate = [calendar dateByAddingComponents:adcomps toDate:date options:0];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    NSTimeZone* timeZone = [NSTimeZone timeZoneWithName:@"Asia/beijing"];
    [formatter setTimeZone:timeZone];
    
    NSString *dateFromData = [formatter stringFromDate:newdate];
    return dateFromData;
}

@end
