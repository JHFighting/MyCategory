//
//  NSString+JH.m
//  JIANCAI
//
//  Created by e1858 on 15/3/9.
//  Copyright (c) 2015年 E1858. All rights reserved.
//

#import "NSString+JH.h"

@implementation NSString (JH)

- (CGSize)sizeWithFont:(int)font maxSize:(CGSize)maxSize
{
    NSDictionary *attrs = @{NSFontAttributeName : [UIFont systemFontOfSize:font]};
    return [self boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
}

+ (instancetype)ageStringWithBirthYear:(NSString *)year
{
    NSDate *now = [NSDate date];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSUInteger unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit;
    NSDateComponents *dateComponent = [calendar components:unitFlags fromDate:now];
    
    NSInteger nowYear = [dateComponent year];
    NSInteger birthYear = [year intValue];
    NSString *ageStr = [NSString stringWithFormat:@"%ld岁", nowYear - birthYear];
    
    return ageStr;
}

+ (instancetype)stringByRemoveWhitespaceWithString:(NSString *)string
{
    NSString *newStr =  [string stringByReplacingOccurrencesOfString:@" " withString:@""];

    return newStr;
}

@end
