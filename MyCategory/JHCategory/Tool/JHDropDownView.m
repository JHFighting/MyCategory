//
//  JHDropDownView.m
//  hospital
//
//  Created by e1858 on 15/5/19.
//  Copyright (c) 2015年 e1858. All rights reserved.
//

#import "JHDropDownView.h"

#define kKeyWindowH     [UIScreen mainScreen].bounds.size.height
#define kKeyWindowW     [UIScreen mainScreen].bounds.size.width
/**
 *  cell的高度
 */
const CGFloat JHDropDownViewCellHeight = 44.0;
/**
 *  字体大小
 */
const CGFloat JHDropDownViewTitleFont  = 15.0;
/**
 *  背景透明度
 */
const CGFloat JHDropDownViewAlpha      = .4;

@interface JHDropDownView () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, weak  ) NSArray     *dataArr;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, weak  ) UIButton    *souceBtn;
@property (nonatomic, weak  ) UIView      *underView;

/**
 *  传入button所在的控制器
 */
@property (nonatomic, weak  ) UIViewController *viewController;

@property (nonatomic, strong) UIView           *tabBarView;

@end


@implementation JHDropDownView

- (instancetype)initDropDownWithButton:(UIButton *)souceButton withDataArray:(NSArray *)array;
{
    if (self = [super init]) {
        
        self.dataArr = array;
        self.souceBtn = souceButton;
        self.viewController = [self getViewController];
        
        self.frame = CGRectMake(0, CGRectGetMaxY(souceButton.frame), kKeyWindowW, self.viewController.view.height);
        
        self.backgroundColor = [UIColor clearColor];
        
        UIView *underView = [[UIView alloc] initWithFrame:self.frame];
        underView.backgroundColor = [UIColor blackColor];
        underView.alpha = JHDropDownViewAlpha;
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideView)];
        [underView addGestureRecognizer:tapGesture];
        
        _underView = underView;

        self.tableView = [[UITableView alloc] init];
        self.tableView.frame = CGRectMake(0, 0, kKeyWindowW, 0);
        
        [UIView animateWithDuration:0.2 animations:^{
            CGFloat viewHeight = self.dataArr.count * JHDropDownViewCellHeight;
            if (self.dataArr.count * JHDropDownViewCellHeight > self.viewController.view.height - CGRectGetMaxY(souceButton.frame) - 40) {
                viewHeight = self.viewController.view.height - CGRectGetMaxY(souceButton.frame) - 40;
            }
            self.tableView.frame = CGRectMake(0, 0, kKeyWindowW, viewHeight);
        }];

        self.tableView.delegate = self;
        self.tableView.dataSource = self;
        self.tableView.bounces = NO;
        self.tableView.backgroundColor = [UIColor whiteColor];
        self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        self.tableView.separatorColor = [UIColor lightGrayColor];
        
        [self addSubview:underView];
        [self addSubview:self.tableView];
    }
    return self;
}

- (void)showView
{
    [self.viewController.view addSubview:self];
    [self.viewController.tabBarController.tabBar addSubview:self.tabBarView];
    self.souceBtn.selected = YES;
}

- (void)hideView
{
    self.souceBtn.selected = NO;

    [UIView animateWithDuration:0.2 animations:^{
        
        self.tableView.frame = CGRectMake(0, 0, kKeyWindowW, 0);
        _underView.alpha = 0;
        _tabBarView.alpha = 0;
        
    } completion:^(BOOL finished) {
        
        [self removeFromSuperview];
        [_tabBarView removeFromSuperview];
        
    }];
}

- (UIView *)tabBarView
{
    if (_tabBarView == nil) {
        
        _tabBarView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.height, self.viewController.tabBarController.tabBar.height)];
        _tabBarView.backgroundColor = [UIColor blackColor];
        _tabBarView.alpha = JHDropDownViewAlpha;
        
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideView)];
        [_tabBarView addGestureRecognizer:tapGesture];
        
    }
    return _tabBarView;
}

#pragma mark - tableView delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"CellIdentifier";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.textLabel.font = [UIFont systemFontOfSize:JHDropDownViewTitleFont];
    }
    cell.textLabel.text =[self.dataArr objectAtIndex:indexPath.row];
    cell.textLabel.textColor = [UIColor blackColor];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return JHDropDownViewCellHeight;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self hideView];
    
    [self.souceBtn setTitle:self.dataArr[indexPath.row] forState:UIControlStateNormal];
    [self chooseViewWithTag:indexPath.row];
}

- (void)chooseViewWithTag:(CGFloat)tag
{
    if ([self.delegate respondsToSelector:@selector(getDownViewChooseTag:)]) {
        self.souceBtn.selected = NO;
        [self.delegate getDownViewChooseTag:tag];
    }
}

/**
 *  获取button所在的控制器
 */
- (UIViewController*)getViewController
{
    for (UIView *next = [self.souceBtn superview]; next; next = next.superview) {
        
        UIResponder *nextResponder = [next nextResponder];
        
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            
            return (UIViewController *)nextResponder;
        }
    }
    return nil;
}

- (void)dealloc
{
    NSLog(@"Dealloc---------");
}


@end
