//
//  NSObject+HWSdkKit.h
//  HWSdkKitDemo
//
//  Created by 华&梅 on 2022/9/9.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (HWSdkKit)

//MARK: - ==== 获取视图控制器
- (UIViewController *)findTopPresentViewController;
- (UIViewController *)findCurrentViewController;
- (UINavigationController *)findCurrentNavigationController;

@end

NS_ASSUME_NONNULL_END
