//
//  UIViewController+JH.h
//  Category
//
//  Created by e1858 on 15/5/11.
//  Copyright (c) 2015年 JH. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (JH)

/**
 *  显示等待信息
 */
- (void)showProgressTextHUD:(NSString *)text;
/**
 *  隐藏
 */
- (void)hideProgressTextHUD;

@end
