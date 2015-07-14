//
//  UINavigationController+JH.m
//
//  Created by e1858 on 15/5/4.
//  Copyright (c) 2015年 JH. All rights reserved.
//

#import "UINavigationController+JH.h"

@implementation UINavigationController (JH)

- (id)findViewController:(NSString *)className
{
    for (UIViewController *viewController in self.viewControllers) {
        if ([viewController isKindOfClass:NSClassFromString(className)]) {
            return viewController;
        }
    }
    return nil;
}

@end
