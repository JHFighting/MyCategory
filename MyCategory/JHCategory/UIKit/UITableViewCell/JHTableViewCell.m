//
//  JHTableViewCell.m
//  Category
//
//  Created by e1858 on 15/5/8.
//  Copyright (c) 2015年 JH. All rights reserved.
//

#import "JHTableViewCell.h"
#import "UIView+JH.h"

@implementation JHTableViewCell

+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    
    static NSString *rid = @"cellID";
    
    //从缓存池中取出cell
    JHTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:rid];
    
    //缓存池中无数据
    if(cell == nil) {
        
        cell = [self createViewFromXIB];
    }
    
    return cell;
}

@end
