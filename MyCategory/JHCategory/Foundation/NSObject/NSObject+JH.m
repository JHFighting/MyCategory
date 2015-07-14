//
//  NSObject+JH.m
//  Category
//
//  Created by e1858 on 15/5/11.
//  Copyright (c) 2015年 JH. All rights reserved.
//

#import "NSObject+JH.h"
#import <objc/runtime.h>
#import "MBProgressHUD.h"

@implementation NSObject (JH)

- (void)toast:(NSString*)text
{
    [self toast:text duration:1.3];
    
}

- (void)toast:(NSString*)text duration:(NSTimeInterval)duration
{
    __weak UIView *view = [[[UIApplication sharedApplication] windows] lastObject];
    dispatch_block_t block = ^{
        if (view) {
            
            MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
            hud.mode = MBProgressHUDModeCustomView;
            
            UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
            hud.customView = label;
            label.text = text;
            CGSize tempSize = [text boundingRectWithSize:CGSizeMake(200, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:13]} context:nil].size;
            label.bounds = CGRectMake(0, 0, tempSize.width, tempSize.height);
            label.center = CGPointMake([[UIApplication sharedApplication].delegate window].frame.size.width / 2, [[UIApplication sharedApplication].delegate window].frame.size.height / 2 + 20);
            label.textColor = [UIColor whiteColor];
            label.font = [UIFont systemFontOfSize: 13];
            label.lineBreakMode = NSLineBreakByCharWrapping;
            label.numberOfLines = 0;
            
            hud.margin = 10.f;
            hud.yOffset = 120.f;
            hud.userInteractionEnabled = NO;
            hud.removeFromSuperViewOnHide = YES;
            [hud hide:YES afterDelay:duration];
        }
    };
    if ([NSThread isMainThread]) {
        block();
    } else {
        dispatch_async(dispatch_get_main_queue(), block);
    }
}

- (NSString *)fileSizeAtPath:(NSString *)filePath
{
    NSFileManager* manager = [NSFileManager defaultManager];
    if ([manager fileExistsAtPath:filePath]){
        
        NSString *sizeStr;
        
        long long tempSize = [[manager attributesOfItemAtPath:filePath error:nil] fileSize] / 1024;
        
        sizeStr = [NSString stringWithFormat:@"%.2lldKB", tempSize];
        
        if (tempSize / 1024 > 1) {
            sizeStr = [NSString stringWithFormat:@"%.2lldM", tempSize / 1024];
            if (tempSize / 1024 / 1024 > 1) {
                sizeStr = [NSString stringWithFormat:@"%.2lldG", tempSize / 1024 / 1024];
            }
        }
        return sizeStr;
    }
    return @"0";
}

@end
