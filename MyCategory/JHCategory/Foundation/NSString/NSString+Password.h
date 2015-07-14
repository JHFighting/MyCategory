//
//  NSString+Password.h
//  Category
//
//  Created by e1858 on 15/5/7.
//  Copyright (c) 2015年 JH. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Password)

/**
 *  32位MD5加密
 */
@property (nonatomic, copy, readonly) NSString *md5;

/**
 *  SHA1加密
 */
@property (nonatomic, copy, readonly) NSString *sha1;

@end
