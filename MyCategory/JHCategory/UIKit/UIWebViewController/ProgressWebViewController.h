//
//  ProgressWebViewController.h
//  Category
//
//  Created by e1858 on 15/5/7.
//  Copyright (c) 2015年 JH. All rights reserved.
//  

#import <UIKit/UIKit.h>

@interface ProgressWebViewController : UIViewController

@property (nonatomic, copy) NSString *urlStr;
/**
 *  创建控制器
 *
 *  @param title     标题
 *  @param urlString 加载的url字符串
 *
 *  @return 控制器
 */
+ (instancetype)progressWithTitle:(NSString *)title andUrlString:(NSString *)urlString;


@end
