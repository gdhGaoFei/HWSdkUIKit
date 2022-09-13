//
//  HMBaseViewController.h
//  HWork
//
//  Created by 华&梅 on 2022/5/7.
//  Copyright © 2022 Alibaba. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface HMBaseViewController : UIViewController

@property (nonatomic, strong) UIActivityIndicatorView * activityIndicator;
//@property (nonatomic, strong) UIButton *backBtn;

- (void)setupViews;

/// 显示loading
- (void)showLoading;

/// 隐藏loading
- (void)hideLoading;

/// 跳转控制器
/// @param vcString 控制器字符串
- (void)pushViewControllerWithVcString:(NSString *)vcString;

@end

NS_ASSUME_NONNULL_END
