//
//  JHPageControl.m
//  hospital
//
//  Created by e1858 on 15/6/9.
//  Copyright (c) 2015年 e1858. All rights reserved.
//

#import "JHPageControl.h"

@implementation JHPageControl

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

/**
 *  更改图片
 */
-(void)updateImage
{
    for (int i = 0; i < [self.subviews count]; i++) {
        
        UIImageView *imageView = [self imageViewForSubview:[self.subviews objectAtIndex:i]];
        
        if (i == self.currentPage) {
            imageView.image = _currentImage;
        } else {
            imageView.image = _normalImage;
        }
        
        //  图片显示正常
        CGPoint center = imageView.center;
        imageView.size = imageView.image.size;
        imageView.center = center;
    }
}

- (UIImageView *)imageViewForSubview:(UIView *)view
{
    UIImageView *pageView = nil;
    
    if ([view isKindOfClass: [UIView class]]) {
    
        for (UIView *subview in view.subviews) {
            
            if ([subview isKindOfClass:[UIImageView class]]) {
                pageView = (UIImageView *)subview;
                break;
            }
        }
        if (pageView == nil) {
            pageView = [[UIImageView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, view.frame.size.width, view.frame.size.height)];
            [view addSubview:pageView];
        }
    } else {
        pageView = (UIImageView *)view;
    }
    
    return pageView;
}

-(void)setCurrentPage:(NSInteger)page
{
    [super setCurrentPage:page];
    [self updateImage];
}

@end
