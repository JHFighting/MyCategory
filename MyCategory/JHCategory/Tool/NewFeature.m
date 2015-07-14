//
//  NewFeature.m
//  Baidagua
//
//  Created by e1858 on 15/5/7.
//  Copyright (c) 2015年 JH. All rights reserved.
//

#import "NewFeature.h"
#import "UIApplication+Version.h"

NSString *const NewFeatureVersionKey = @"NewFeatureVersionKey";

@implementation NewFeature

/*
 *  是否应该显示版本新特性页面
 */
+ (BOOL)canShowNewFeature
{
    //系统直接读取版本号
    NSString *versionValueStringForSystemNow = [UIApplication sharedApplication].version;
    
    //读取本地版本号
    NSString *versionLocal = [[NSUserDefaults standardUserDefaults] objectForKey:NewFeatureVersionKey];
    
    if(versionLocal != nil && [versionValueStringForSystemNow isEqualToString:versionLocal]){//说明有本地版本记录，且和当前系统版本一致
        
        return NO;
        
    }else{//无本地版本记录或本地版本记录与当前系统版本不一致
        
        //保存
        [[NSUserDefaults standardUserDefaults] setObject:versionValueStringForSystemNow forKey:NewFeatureVersionKey];
        
        [[NSUserDefaults standardUserDefaults] synchronize];
        
        return YES;
    }
}

@end
