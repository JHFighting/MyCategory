//
//  JHCountdownButton.m
//  hospital
//
//  Created by e1858 on 15/5/11.
//  Copyright (c) 2015年 e1858. All rights reserved.
//

#import "JHCountdownButton.h"
#import "NSTimer+BlocksKit.h"
#import <objc/runtime.h>

@interface JHCountdownButton ()

{
    NSTimer *_timer;
    
    int _allTime_privite;
    NSString *_endTitle_privite;
}

@end

@implementation JHCountdownButton

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        [self defaultData];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self defaultData];
    }
    return self;
}

/**
 *  默认值
 */
- (void)defaultData
{
    _allTime_privite = 90;
    _endTitle_privite = @"获取验证码";
}

- (void)updateVerifyCodeButton
{
    static char StoreKey = 0;
    int Seconds = _allTime_privite;
    
    __weak __typeof(&*self)weakSelf = self;

    _timer = [NSTimer bk_scheduledTimerWithTimeInterval:1.f block:^(NSTimer *timer) {
        if (weakSelf == nil) {
            [timer invalidate];
            return;
        }
        UIButton *button = weakSelf;
        NSNumber *second = objc_getAssociatedObject(button, &StoreKey);
        if (second == nil || second.intValue <= 0) {
            second = @(Seconds);
        } else {
            second = @(second.intValue-1);
        }
        
        [button setEnabled:NO];
        [button setTitle:[NSString stringWithFormat:@"%@秒", second] forState:UIControlStateDisabled];
        button.adjustsImageWhenHighlighted = NO;
        
        if (second.intValue == 0) {
            [button setEnabled:YES];
            [button setTitle:_endTitle_privite forState:UIControlStateNormal];
        }
        objc_setAssociatedObject(button, &StoreKey, second, OBJC_ASSOCIATION_COPY);
        if (second.intValue <= 0 || weakSelf == nil) {
            [timer invalidate];
        }
    } repeats:YES];
    
    [[NSRunLoop currentRunLoop] addTimer:_timer forMode:NSRunLoopCommonModes];
}

#pragma mark - setter & getter
- (void)setAllTime:(int)allTime
{
    _allTime_privite = allTime;
}

- (void)setEndTitle:(NSString *)endTitle
{
    _endTitle_privite = endTitle;
}

@end
