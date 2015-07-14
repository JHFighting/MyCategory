//
//  UIApplication+JH.m
//
//  Created by e1858 on 15/5/6.
//  Copyright (c) 2015年 JH. All rights reserved.
//

#import "UIApplication+Version.h"

@implementation UIApplication (Version)

/*
 *  当前程序的版本号
 */
- (NSString *)version
{
    //系统直接读取的版本号
    NSString *versionValueStringForSystemNow = [[NSBundle mainBundle].infoDictionary valueForKey:(NSString *)kCFBundleVersionKey];
    
    return versionValueStringForSystemNow;
}

@end
