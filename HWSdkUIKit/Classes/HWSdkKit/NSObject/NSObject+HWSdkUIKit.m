//
//  NSObject+HWSdkUIKit.m
//  HWSdkUIKitDemo
//
//  Created by 华&梅 on 2022/9/9.
//

#import "NSObject+HWSdkUIKit.h"

@implementation NSObject (HWSdkUIKit)

//MARK: - ==== 查找Window/Nav/ViewController
- (UINavigationController *)findCurrentNavigationController{
    UIViewController *currentVC = [self findCurrentViewController];
    if (currentVC) {
        return currentVC.navigationController;
    }
    return nil;
}

- (UIViewController *)findCurrentViewController {
    UIWindow *mainWindow = [NSObject findMainWindow];
    if (!mainWindow) {
        NSLog(@"not found main window");
        return nil;
    }
    return [NSObject findVCInWindow:mainWindow];
}

- (UIViewController *)findTopPresentViewController {
    UIViewController * vc = nil;
    if ([self isKindOfClass:UIViewController.class]) {
        vc = (UIViewController *)self;
    } else {
        vc = [self findCurrentViewController];
    }
    if (vc == nil) {
        return nil;
    }
    UIViewController *presentedCtrl = vc.presentedViewController;
    if ([presentedCtrl isKindOfClass:[UIAlertController class]]) {
        return nil;
    }
    while (true){
        if (presentedCtrl.presentedViewController){
            presentedCtrl = presentedCtrl.presentedViewController;
        }else{
            break;
        }
    }
    return presentedCtrl;
}

+ (UIWindow *)findTopWindow {
    NSArray *windows = [UIApplication sharedApplication].windows;
     for (UIWindow * window in [windows reverseObjectEnumerator]) {
         if ([window isMemberOfClass:[UIWindow class]] && CGRectEqualToRect(window.bounds, [UIScreen mainScreen].bounds)) {
             return window;
         }
     }
     return [UIApplication sharedApplication].keyWindow;
}

+ (UIViewController *)findTopViewController {
    
    UIViewController *topViewController = [[self findTopWindow] rootViewController];
    while (true)
    {
        if (topViewController.presentedViewController)
        {
            topViewController = topViewController.presentedViewController;
        }
        else if ([topViewController isKindOfClass:[UINavigationController class]] && [(UINavigationController*)topViewController topViewController])
        {
            topViewController = [(UINavigationController *)topViewController topViewController];
        }
        else if ([topViewController isKindOfClass:[UITabBarController class]])
        {
            UITabBarController *tab = (UITabBarController *)topViewController;
            topViewController = tab.selectedViewController;
        }
        else
        {
            break;
        }
    }
    return topViewController;
}

+ (UIWindow *)findMainWindow {
    UIWindow  *delegateWindow = [[UIApplication sharedApplication].delegate window];
    if (delegateWindow) {
        return delegateWindow;
    }else{
        NSArray *windows = [UIApplication sharedApplication].windows;
        if ([windows count] == 1) {
            return [windows firstObject];
        } else {
            for (UIWindow *window in windows) {
                if (window.windowLevel == UIWindowLevelNormal) {
                return window;
                }
            }
        }
        return nil;
    }

}

+ (UIViewController *)findVCInWindow:(UIWindow *)mainWindow {
    UIViewController *topViewController = [mainWindow rootViewController];
    while (true)
    {
        if (topViewController.presentedViewController)
        {
            topViewController = topViewController.presentedViewController;
        }
        else if ([topViewController isKindOfClass:[UINavigationController class]] && [(UINavigationController*)topViewController topViewController])
        {
            topViewController = [(UINavigationController *)topViewController topViewController];
        }
        else if ([topViewController isKindOfClass:[UITabBarController class]])
        {
            UITabBarController *tab = (UITabBarController *)topViewController;
            topViewController = tab.selectedViewController;
        }
        else
        {
            break;
        }
    }
    NSLog(@"find current VC:%@", NSStringFromClass([topViewController class]));
    return topViewController;
}


@end
