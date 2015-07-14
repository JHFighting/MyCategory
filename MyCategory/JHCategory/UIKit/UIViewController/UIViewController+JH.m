//
//  UIViewController+JH.m
//  Category
//
//  Created by e1858 on 15/5/11.
//  Copyright (c) 2015年 JH. All rights reserved.
//

#import "UIViewController+JH.h"
#import "MBProgressHUD.h"

@implementation UIViewController (JH)

- (void)showProgressTextHUD:(NSString *)text
{
    UIView *containView = self.view;
    MBProgressHUD *hud = nil;
    NSArray *huds = [MBProgressHUD allHUDsForView:containView];
    for (id h in huds) {
        if ([h isKindOfClass:[MBProgressHUD class]]) {
            hud = h;
            break;
        }
    }
    if (hud == nil) {
        hud = [MBProgressHUD showHUDAddedTo:containView animated:YES];
        hud.removeFromSuperViewOnHide = YES;
    }
    else if ([hud isHidden]) {
        [hud show:YES];
    }
    [hud setLabelText:text];
}

- (void)hideProgressTextHUD
{
    UIView *containView = self.view;
    MBProgressHUD *hud = nil;
    NSArray *huds = [MBProgressHUD allHUDsForView:containView];
    for (id h in huds) {
        if ([h isKindOfClass:[MBProgressHUD class]]) {
            hud = h;
            break;
        }
    }
    [hud hide:YES];
}


@end
