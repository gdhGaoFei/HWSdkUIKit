//
//  MBProgressHUD+Add.m
//  视频客户端
//
//  Created by mj on 13-4-18.
//  Copyright (c) 2013年 itcast. All rights reserved.
//

#import "MBProgressHUD+HWSdkUIKit.h"

@implementation MBProgressHUD (HWSdkUIKit)

#pragma mark 显示信息
+ (MBProgressHUD *)show:(NSString *)text icon:(NSString *)icon view:(UIView *)view afterDelay:(NSTimeInterval)delay {
    if (view == nil) view = [UIApplication sharedApplication].keyWindow;
    [MBProgressHUD hideHUDForView:view animated:true];
    // 快速显示一个提示信息
    MBProgressHUD * hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    ///设置文本
    if (text) {
        hud.detailsLabel.text = text;
        hud.detailsLabel.font = [UIFont systemFontOfSize:14];
    }
    /*// 设置图片
    if (icon) {
        hud.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"MBProgressHUD.bundle/%@", icon]]];
    }*/
    // 再设置模式
    hud.mode = MBProgressHUDModeCustomView;
    
    // 隐藏时候从父控件中移除
    hud.removeFromSuperViewOnHide = YES;

    if (delay > 0) {
        // 1秒之后再消失
        [hud hideAnimated:YES afterDelay:delay];
    }
    return hud;
}

#pragma mark 显示错误信息
+ (void)showError:(NSString *)error toView:(UIView *)view{
    [self show:error icon:@"error.png" view:view afterDelay:2];
}

+ (void)showSuccess:(NSString *)success toView:(UIView *)view {
    [self show:success icon:@"success.png" view:view afterDelay:2];
}

+ (void)showMessage:(NSString *)message toView:(UIView *)view {
    [self show:message icon:@"" view:view afterDelay:2];
}

+ (void)showMessage:(NSString *)message toView:(UIView *)view afterDelay:(NSTimeInterval)delay {
    [self show:message icon:@"" view:view afterDelay:delay];
}

#pragma mark 显示一些信息
+ (MBProgressHUD *)showHUDMessage:(NSString *)message toView:(UIView *)view {
    return [self show:message icon:@"" view:view afterDelay:-1];
}

+ (MBProgressHUD *)showHUDMessageWindows:(NSString *)message {
    // 快速显示一个提示信息
    return [MBProgressHUD showHUDMessage:message toView:[UIApplication sharedApplication].keyWindow];
}
@end
