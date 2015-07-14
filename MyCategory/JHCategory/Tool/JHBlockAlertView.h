//
//  JHBlockAlertView.h
//  JHBlockAlertView
//
//  Created by e1858 on 15/5/27.
//  Copyright (c) 2015年 JH. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JHBlockAlertViewItem : NSObject

- (instancetype)initItemWithTitle:(NSString *)title andBlock:(dispatch_block_t)block;

+ (instancetype)itemWithTitle:(NSString *)title andBlock:(dispatch_block_t)block;

@end

@interface JHBlockAlertView : UIAlertView

- (instancetype)initAlertViewWithTitle:(NSString *)title
                               message:(NSString *)message
                      cancelButtonItem:(JHBlockAlertViewItem *)cancelItem
                      otherButtonItems:(JHBlockAlertViewItem *)otherItems,...NS_REQUIRES_NIL_TERMINATION;

+ (instancetype)alertViewWithTitle:(NSString *)title
                           message:(NSString *)message
                  cancelButtonItem:(JHBlockAlertViewItem *)cancelItem
                  otherButtonItems:(JHBlockAlertViewItem *)otherItems,...NS_REQUIRES_NIL_TERMINATION;

@end


