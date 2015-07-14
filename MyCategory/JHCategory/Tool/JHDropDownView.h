//
//  JHDropDownView.h
//  hospital
//
//  Created by e1858 on 15/5/19.
//  Copyright (c) 2015年 e1858. All rights reserved.
//  菜单

#import <UIKit/UIKit.h>

@protocol JHDropDownViewDelegate;

@interface JHDropDownView : UIView

@property (nonatomic, weak) id<JHDropDownViewDelegate> delegate;

/**
 *  初始化
 *
 *  @param souceButton 需要弹出菜单的button
 *  @param array       展示数据数组
 *
 *  @return 菜单对象
 */
- (instancetype)initDropDownWithButton:(UIButton *)souceButton withDataArray:(NSArray *)array;
/**
 *  展示
 */
- (void)showView;
/**
 *  隐藏
 */
- (void)hideView;

@end


@class JHDropDownView;

@protocol JHDropDownViewDelegate <NSObject>

/**
 *  @param chooseTag 选中第几个cell
 */
- (void)getDownViewChooseTag:(int)chooseTag;

@end

