//
//  NSObject+MobClick.h
//  Category
//
//  Created by e1858 on 15/5/11.
//  Copyright (c) 2015年 JH. All rights reserved.
//  友盟统计

#import <Foundation/Foundation.h>

@interface NSObject (MobClick)

+ (void)beginLogPageView:(__unsafe_unretained Class)pageView;
+ (void)endLogPageView:(__unsafe_unretained Class)pageView;

@end
