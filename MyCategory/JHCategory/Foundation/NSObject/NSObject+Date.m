//
//  NSObject+Date.m
//  hospital
//
//  Created by e1858 on 15/5/28.
//  Copyright (c) 2015年 e1858. All rights reserved.
//

#import "NSObject+Date.h"

@implementation NSObject (Date)

- (NSDateComponents *)getDateComponent
{
    NSDate *now = [NSDate date];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSUInteger unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSWeekdayCalendarUnit | NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit;
    NSDateComponents *dateComponent = [calendar components:unitFlags fromDate:now];
    return dateComponent;
}

- (NSInteger)year
{
    return [[self getDateComponent] year];
}

- (NSInteger)month
{
    return [[self getDateComponent] month];
}

- (NSInteger)day
{
    return [[self getDateComponent] day];
}

- (NSInteger)hour
{
    return [[self getDateComponent] hour];
}

- (NSInteger)weekday
{
    return [[self getDateComponent] weekday];
}

@end
