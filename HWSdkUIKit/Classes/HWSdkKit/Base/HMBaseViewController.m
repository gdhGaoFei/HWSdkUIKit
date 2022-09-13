//
//  HMBaseViewController.m
//  HWork
//
//  Created by 华&梅 on 2022/5/7.
//  Copyright © 2022 Alibaba. All rights reserved.
//

#import "HMBaseViewController.h"
#import "NSObject+HWSdkKit.h"

@interface HMBaseViewController ()

@end

@implementation HMBaseViewController

//MARK: - ==== 懒加载
/// activityIndicator
- (UIActivityIndicatorView *)activityIndicator {
    if (!_activityIndicator) {
        UIActivityIndicatorView *activityIndicator = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:(UIActivityIndicatorViewStyleGray)];
        _activityIndicator = activityIndicator;
        [[UIApplication sharedApplication].keyWindow addSubview:activityIndicator];
        activityIndicator.frame= self.view.bounds;
        activityIndicator.color = [UIColor blackColor];
        activityIndicator.backgroundColor = [UIColor colorWithWhite:0 alpha:0.3];
    }
    return _activityIndicator;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupViews];
}

- (void)setupViews {
//    if ([UIUtilManager getLaunchType] == HWMUISDKLaunchTypePresent) {
//        self.backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
//        self.backBtn.frame = CGRectMake(0, 40, 80, 30);
//        [self.view addSubview:self.backBtn];
//        [self.backBtn setTitleColor:HexColor(0x333333) forState:UIControlStateNormal];
//        [self.backBtn setTitle:@"返回" forState:UIControlStateNormal];
//        [self.backBtn addTarget:self action:@selector(backDismiss) forControlEvents:UIControlEventTouchUpInside];
//    }
}

- (void)backDismiss {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)showLoading {
    [self.activityIndicator startAnimating];
}

- (void)hideLoading {
    [self.activityIndicator stopAnimating];
}

-(void)dealloc {
#if DEBUG
    NSLog(@"dealloc ====>:%@", [self class]);
#endif
}

- (void)pushViewControllerWithVcString:(NSString *)vcString {
    UIViewController * vc = [[NSClassFromString(vcString) alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation {
    UIViewController *topPresentCtrl = [self findTopPresentViewController];
    if (topPresentCtrl) {
        return topPresentCtrl.preferredInterfaceOrientationForPresentation;
    }
    return  UIInterfaceOrientationPortrait;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    UIViewController *topPresentCtrl = [self findTopPresentViewController];
    if (topPresentCtrl) {
        return topPresentCtrl.supportedInterfaceOrientations;
    }
    return UIInterfaceOrientationMaskPortrait;
}

- (BOOL)shouldAutorotate {
    UIViewController *topPresentCtrl = [self findTopPresentViewController];
    if (topPresentCtrl) {
        return topPresentCtrl.shouldAutorotate;
    }
    return NO;
}

@end
