//
//  UINavigationController+JH.h
//
//  Created by e1858 on 15/5/4.
//  Copyright (c) 2015年 JH. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationController (JH)

/**
 *  遍历找出className对应的控制器
 *
 *  @param className 控制器名字
 *
 *  @return 控制器对象
 */
- (id)findViewController:(NSString *)className;

@end
