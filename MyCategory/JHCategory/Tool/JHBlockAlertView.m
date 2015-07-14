//
//  JHBlockAlertView.m
//  JHBlockAlertView
//
//  Created by e1858 on 15/5/27.
//  Copyright (c) 2015年 JH. All rights reserved.
//

#import "JHBlockAlertView.h"

@interface JHBlockAlertViewItem ()

@property (nonatomic, copy  ) NSString         *title;
@property (nonatomic, assign) NSInteger        itemIndex;
@property (nonatomic, copy  ) dispatch_block_t block;

@end

@implementation JHBlockAlertViewItem

+ (instancetype)itemWithTitle:(NSString *)title andBlock:(dispatch_block_t)block
{
    JHBlockAlertViewItem *item = [[JHBlockAlertViewItem alloc] initItemWithTitle:title andBlock:block];
    return item;
}

- (instancetype)initItemWithTitle:(NSString *)title andBlock:(dispatch_block_t)block
{
    self = [super init];
    if (self) {
        self.title = title;
        self.block = block;
    }
    return self;
}

@end

@interface JHBlockAlertView () <UIAlertViewDelegate>

{
    JHBlockAlertViewItem    *_cancelItem;
    NSMutableArray          *_otherItems;
}

@end

@implementation JHBlockAlertView

+ (instancetype)alertViewWithTitle:(NSString *)title
                           message:(NSString *)message
                  cancelButtonItem:(JHBlockAlertViewItem *)cancelItem
                  otherButtonItems:(JHBlockAlertViewItem *)otherItems, ...
{
    JHBlockAlertView *alertView = [[JHBlockAlertView alloc] initAlertViewWithTitle:title
                                                                           message:message
                                                                  cancelButtonItem:cancelItem
                                                                  otherButtonItems: nil];
    
    JHBlockAlertViewItem *item;
    va_list itemList;
    
    if (otherItems) {
        
        [alertView addButtonWithItem:otherItems];
        
        va_start(itemList, otherItems);
        
        while ((item = va_arg(itemList, JHBlockAlertViewItem *))) {
            
            [alertView addButtonWithItem:item];
            
        }
        va_end(itemList);
    }
    
    return alertView;
}

- (instancetype)initAlertViewWithTitle:(NSString *)title
                               message:(NSString *)message
                      cancelButtonItem:(JHBlockAlertViewItem *)cancelItem
                      otherButtonItems:(JHBlockAlertViewItem *)otherItems, ...
{
    self = [super initWithTitle:title
                        message:message
                       delegate:self
              cancelButtonTitle:cancelItem.title
              otherButtonTitles:nil];
    if (self) {
        
        _cancelItem = cancelItem;
        
        JHBlockAlertViewItem *item;
        va_list itemList;
        
        if (otherItems) {
            
            [self addButtonWithItem:otherItems];
            
            va_start(itemList, otherItems);
            
            while ((item = va_arg(itemList, JHBlockAlertViewItem *))) {
                
                [self addButtonWithItem:item];
                
            }
            va_end(itemList);
        }
    }
    
    return self;
}

- (void)addButtonWithItem:(JHBlockAlertViewItem *)item
{
    if (_otherItems == nil) {
        _otherItems = [NSMutableArray array];
    }
    [_otherItems addObject:item];
    
    item.itemIndex = [self addButtonWithTitle:item.title];
}

#pragma mark - alertView delegate
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == alertView.cancelButtonIndex) {
        
        if (_cancelItem && _cancelItem.block) {
            
            _cancelItem.block();
            
        }
        
    } else {
    
        [_otherItems enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            
            JHBlockAlertViewItem *item = obj;
           
            if ((item.itemIndex == buttonIndex) && item.block) {
                
                item.block();
                
            }
        }];
    }
}

@end











