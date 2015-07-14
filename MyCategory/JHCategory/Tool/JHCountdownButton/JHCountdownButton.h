//
//  JHCountdownButton.h
//  hospital
//
//  Created by e1858 on 15/5/11.
//  Copyright (c) 2015年 JH. All rights reserved.
//  倒计时

#import <UIKit/UIKit.h>

@interface JHCountdownButton : UIButton

/**
 *  倒计时结束显示文字
 */
@property (nonatomic, copy) NSString *endTitle;
/**
 *  总时间
 */
@property (nonatomic, assign) int allTime;

/**
 *  开始倒计时
 */
- (void)updateVerifyCodeButton;

@end
