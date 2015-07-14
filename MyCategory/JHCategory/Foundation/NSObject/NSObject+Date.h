//
//  NSObject+Date.h
//  hospital
//
//  Created by e1858 on 15/5/28.
//  Copyright (c) 2015年 e1858. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Date)

@property (nonatomic, assign, readonly) NSInteger year;
@property (nonatomic, assign, readonly) NSInteger month;
@property (nonatomic, assign, readonly) NSInteger day;
@property (nonatomic, assign, readonly) NSInteger weekday;
@property (nonatomic, assign, readonly) NSInteger hour;

@end
