//
//  MBProgressHUD+Add.h
//  视频客户端
//
//  Created by mj on 13-4-18.
//  Copyright (c) 2013年 itcast. All rights reserved.
//

#if __has_include(<MBProgressHUD/MBProgressHUD-umbrella.h>)
#import <MBProgressHUD/MBProgressHUD-umbrella.h>
#else
#import "MBProgressHUD.h"
#endif

@interface MBProgressHUD (HWSdkUIKit)

+ (void)showMessage:(NSString *)message toView:(UIView *)view;
+ (void)showMessage:(NSString *)message toView:(UIView *)view afterDelay:(NSTimeInterval)delay;

//+ (void)showError:(NSString *)error toView:(UIView *)view;
//+ (void)showSuccess:(NSString *)success toView:(UIView *)view;

//MARK: - ==== 返回HUD
+ (MBProgressHUD *)showHUDMessage:(NSString *)message toView:(UIView *)view;
+ (MBProgressHUD *)showHUDMessageWindows:(NSString *)message;

@end
