//
//  NewFeature.h
//  Baidagua
//
//  Created by e1858 on 15/5/7.
//  Copyright (c) 2015年 JH. All rights reserved.
//  

#import <Foundation/Foundation.h>

@interface NewFeature : NSObject

/*
 *  是否应该显示版本新特性界面
 */
+ (BOOL)canShowNewFeature;

extern NSString *const NewFeatureVersionKey;

@end
