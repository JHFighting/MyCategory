//
//  NSObject+JH.h
//  Category
//
//  Created by e1858 on 15/5/11.
//  Copyright (c) 2015年 JH. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (JH)

/**
 *  提示信息
 */
- (void)toast:(NSString*)text;

- (void)toast:(NSString*)text duration:(NSTimeInterval)duration;

/**
 *  计算缓存文件的大小  
 */
- (NSString *)fileSizeAtPath:(NSString *)filePath;

@end
