//
//  DJScrollView.m
//  DJScrollIViewDemo
//
//  Created by 杨峰 on 15/5/16.
//  Copyright (c) 2015年 DJ. All rights reserved.
//

#import "DJScrollView.h"

@implementation DJScrollView

- (id)initWithFrame:(CGRect)frame animationDuration:(NSTimeInterval)animationDuration{
    self = [self initWithFrame:frame];
    self.animationTimer = [NSTimer scheduledTimerWithTimeInterval:animationDuration
                                                           target:self
                                                         selector:@selector(animationTimerDidFired:)
                                                         userInfo:nil
                                                          repeats:YES];
    [self.animationTimer pauseTimer];
    [[NSRunLoop mainRunLoop] addTimer:self.animationTimer forMode:NSRunLoopCommonModes];
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.delegate = self;
        self.showsHorizontalScrollIndicator = NO;
        self.showsVerticalScrollIndicator = NO;
        self.pagingEnabled = YES;
    }
    return self;
}

- (void)setUrlsArray:(NSArray *)urlsArray
{
    _urlsArray = urlsArray;
    [self setAdsArray:urlsArray isUrl:YES];
}

- (void)setImageArray:(NSArray *)imageArray
{
    _imageArray = imageArray;
    [self setAdsArray:imageArray isUrl:NO];
}

- (void)setAdsArray:(NSArray *)adsArray isUrl:(BOOL)isUrl
{
    CGSize contentSize;
    CGPoint startPoint;
    
    [self.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    _imageCount = adsArray.count;
    if (adsArray.count > 1) {
        [self.animationTimer resumeTimerAfterTimeInterval:3.0];
        contentSize = CGSizeMake(self.frame.size.width * (adsArray.count + 2), 0);
        for (int i = 0; i < adsArray.count + 2; i ++) {
            UIImageView * imageView = [[UIImageView alloc] initWithFrame:CGRectMake(i * self.frame.size.width, 0, self.frame.size.width, self.frame.size.height)];
            if (i == 0) {
                if (isUrl) {
                    [imageView sd_setImageWithURL:[NSURL URLWithString:adsArray[adsArray.count - 1]]];
                } else {
                    imageView.image = adsArray[adsArray.count - 1];
                }
            }else if (i == adsArray.count + 1) {
                if (isUrl) {
                    [imageView sd_setImageWithURL:[NSURL URLWithString:adsArray[0]]];
                } else {
                    imageView.image = adsArray[0];
                }
            }else{
                if (isUrl) {
                    [imageView sd_setImageWithURL:[NSURL URLWithString:adsArray[i - 1]]];
                } else {
                    imageView.image = adsArray[i - 1];
                }
            }
            UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(contentViewTapAction:)];
            [self addGestureRecognizer:tapGesture];
            [self addSubview:imageView];
        }
        startPoint = CGPointMake(self.frame.size.width, 0);
    } else {
        for (int i = 0; i < adsArray.count; i ++) {
            UIImageView * imageView = [[UIImageView alloc] initWithFrame:CGRectMake(i * self.frame.size.width, 0, self.frame.size.width, self.frame.size.height)];
            [imageView sd_setImageWithURL:[NSURL URLWithString:adsArray[i]]];
            [self addSubview:imageView];
        }
        contentSize = CGSizeMake(self.frame.size.width, 0);
        startPoint = CGPointZero;
    }
    self.contentSize = contentSize;
    [self setContentOffset:startPoint animated:YES];
    
    self.pageControl = [[UIPageControl alloc] init];
    self.pageControl.numberOfPages = adsArray.count;
    self.pageControl.frame = CGRectMake(0, self.frame.size.height - 15, self.frame.size.width, 10);
    self.pageControl.currentPage = 0;
    self.pageControl.userInteractionEnabled = NO;
    [self.pageControl setPageIndicatorTintColor:[UIColor whiteColor]];
    [self.pageControl setCurrentPageIndicatorTintColor:[UIColor blackColor]];
    [self.superview addSubview:self.pageControl];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if (scrollView.contentOffset.x < self.frame.size.width) {
        [self setContentOffset:CGPointMake(self.frame.size.width * (_imageCount + 1), 0) animated:NO];
    }
    if (scrollView.contentOffset.x > self.frame.size.width * (_imageCount + 1)) {
        [self setContentOffset:CGPointMake(self.frame.size.width, 0) animated:NO];
    }
    int pageCount = scrollView.contentOffset.x / self.frame.size.width;
    if (pageCount > _imageCount) {
        pageCount = 0;
    }else if (pageCount == 0){
        pageCount = (int)_imageCount - 1;
    }else{
        pageCount --;
    }
    self.pageControl.currentPage = pageCount;
}

- (void)animationTimerDidFired:(NSTimer *)timer{
    CGPoint newOffset = CGPointMake(self.contentOffset.x  + CGRectGetWidth(self.frame), self.contentOffset.y);
    [self setContentOffset:newOffset animated:YES];
}


- (void)contentViewTapAction:(UITapGestureRecognizer *)tap
{
    [self.djDelegate didSelectScrollViewWithSelectNumber:(int)self.pageControl.currentPage];
}

@end
