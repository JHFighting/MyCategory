//
//  UIApplication+Version.h
//
//  Created by e1858 on 15/5/6.
//  Copyright (c) 2015年 JH. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIApplication (Version)

/**
 *  当前程序的版本号
 */
@property (nonatomic, copy, readonly) NSString *version;

@end
