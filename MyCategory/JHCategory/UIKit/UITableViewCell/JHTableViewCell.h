//
//  JHTableViewCell.h
//  Category
//
//  Created by e1858 on 15/5/8.
//  Copyright (c) 2015年 JH. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JHTableViewCell : UITableViewCell

/**
 *  创建cell
 *
 *  @param tableView 所属tableView
 *
 *  @return cell实例
 */
+ (instancetype)cellWithTableView:(UITableView *)tableView;

@end
