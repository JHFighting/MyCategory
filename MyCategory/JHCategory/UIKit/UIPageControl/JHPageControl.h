//
//  JHPageControl.h
//  hospital
//
//  Created by e1858 on 15/6/9.
//  Copyright (c) 2015年 e1858. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JHPageControl : UIPageControl

/**
 *  选中图片
 */
@property (nonatomic, strong) UIImage *currentImage;
/**
 *  正常图片
 */
@property (nonatomic, strong) UIImage *normalImage;

@end
