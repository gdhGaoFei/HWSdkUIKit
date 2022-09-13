//
//  HWSdkKit.h
//  HWSdkKit
//
//  Created by 华&梅 on 2022/9/9.
//

#import <Foundation/Foundation.h>

//! Project version number for HWSdkKit.
FOUNDATION_EXPORT double HWSdkKitVersionNumber;

//! Project version string for HWSdkKit.
FOUNDATION_EXPORT const unsigned char HWSdkKitVersionString[];

// In this header, you should import all the public headers of your framework using statements like #import <HWSdkKit/PublicHeader.h>

// YYCategories-umbrella
#if __has_include(<HWSdkKit/HWSdkKit.h>)
#import <HWSdkKit/HWSdkKitHeader.h>
#import <HWSdkKit/MBProgressHUD+HWSdkKit.h>// 弹窗相关
#import <HWSdkKit/NSObject+HWSdkKit.h>// 查找视图控制器
#import <HWSdkKit/HMBaseViewController.h>
#import <HWSdkKit/HMBaseScrollViewController.h>
#import <HWSdkKit/HMBaseTableViewController.h>
#import <HWSdkKit/HMBaseTableViewCell.h>
#import <HWSdkKit/HMRefreshGifHeader.h>
#import <HWSdkKit/HMRefreshGifFooter.h>
#else
#import "HWSdkKitHeader.h"
#import "MBProgressHUD+HWSdkKit.h"// 弹窗相关
#import "NSObject+HWSdkKit.h"// 查找视图控制器
#import "HMBaseViewController.h"
#import "HMBaseScrollViewController.h"
#import "HMBaseTableViewController.h"
#import "HMBaseTableViewCell.h"
#import "HMRefreshGifHeader.h"
#import "HMRefreshGifFooter.h"
#endif



