//
//  UITableViewCell+JH.m
//  Category
//
//  Created by e1858 on 15/5/7.
//  Copyright (c) 2015年 JH. All rights reserved.
//

#import "UITableViewCell+JH.h"
#import "UIView+JH.h"

@implementation UITableViewCell (JH)

+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    
    static NSString *rid = @"cellID";
    
    //从缓存池中取出cell
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:rid];
    
    //缓存池中无数据
    if(cell == nil) {
        
        cell = [self createViewFromXIB];
    }
    
    return cell;
}

@end
