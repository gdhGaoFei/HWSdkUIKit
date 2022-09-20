//
//  HWSdkUIKitHeader.h
//  HWSdkUIKit
//
//  Created by 华&梅 on 2022/9/9.
//

#ifndef HWSdkUIKitHeader_h
#define HWSdkUIKitHeader_h

#ifdef __OBJC__

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

// YYCategories-umbrella
#if __has_include(<YYCategories/YYCategories-umbrella.h>)
#import <YYCategories/YYCategories-umbrella.h>
#else
#import "YYCategories.h"
#endif

// MJRefresh-umbrella
#if __has_include(<MJRefresh/MJRefresh-umbrella.h>)
#import <MJRefresh/MJRefresh-umbrella.h>
#else
#import "MJRefresh.h"
#endif

// ReactiveObjC-umbrella
#if __has_include(<ReactiveObjC/ReactiveObjC-umbrella.h>)
#import <ReactiveObjC/ReactiveObjC-umbrella.h>
#else
#import "ReactiveObjC.h"
#endif

// Masonry-umbrella
#if __has_include(<Masonry/Masonry-umbrella.h>)
#import <Masonry/Masonry-umbrella.h>
#else
#import "Masonry.h"
#endif

#import "HWSdkMacro.h"

/*//MARK: - ===== UIImage
/// nav 导航栏 返回按钮 back_img
static inline UIImage * _Nullable kHWSdkImage_NavBack() {
    return [UIUtilManager imageNamed:@"back_img"];
}

/// 用户头像的 方形 logo icon
static inline UIImage * _Nullable kHWSdkImage_HeaderLogoIcon() {
    return [UIUtilManager imageNamed:@"im_Avatar"];
}*/

//MARK: - ==== 颜色相关
/// r/g/b设置颜色
static inline UIColor * _Nonnull kHWSdkColor_RGBA(CGFloat r, CGFloat g, CGFloat b, CGFloat a) {
    return [UIColor colorWithRed:(r / 255.0) green:(g / 255.0) blue:(b / 255.0) alpha:a];
}

/// r/g/b设置颜色
static inline UIColor * _Nonnull kHWSdkColor_RGB(CGFloat r, CGFloat g, CGFloat b) {
    return kHWSdkColor_RGBA(r, g, b, 1.0);
}

///Hex初始化 颜色 alpha 透明度
static inline UIColor * _Nonnull kHWSdkColor_HexA(NSString * _Nonnull name, CGFloat alpha) {//4876FF 1E90FF
    return [[UIColor colorWithHexString:name] colorWithAlphaComponent:alpha];
}

///Hex初始化 颜色
static inline UIColor * _Nonnull kHWSdkColor_Hex(NSString * _Nonnull name) {//4876FF 1E90FF
    return [UIColor colorWithHexString:name];
}

/// 随机色
static inline UIColor * _Nonnull kHWSdkColor_RandomColor() {
    return kHWSdkColor_RGB(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256));
}

///透明色
static inline UIColor * _Nonnull kHWSdkColor_Alpha0() {
    return [[UIColor whiteColor] colorWithAlphaComponent:0.0001];
}

///#FFFFFF 白色
static inline UIColor * _Nonnull kHWSdkColor_FFFFFF() {
    return kHWSdkColor_Hex(@"#FFFFFF");
}

///#000000 黑色
static inline UIColor * _Nonnull kHWSdkColor_000000() {
    return kHWSdkColor_Hex(@"#000000");
}

///#333333
static inline UIColor * _Nonnull kHWSdkColor_333333() {
    return kHWSdkColor_Hex(@"#333333");
}

///#666666
static inline UIColor * _Nonnull kHWSdkColor_666666() {
    return kHWSdkColor_Hex(@"#666666");
}

///#999999
static inline UIColor * _Nonnull kHWSdkColor_999999() {
    return kHWSdkColor_Hex(@"#999999");
}

///#E2E2E2 分界线
static inline UIColor * _Nonnull kHWSdkColor_E2E2E2() {
    return kHWSdkColor_Hex(@"#E2E2E2");
}

/// #0878FB 主题色?
static inline UIColor * _Nonnull kHWSdkColor_0878FB() {
    return kHWSdkColor_Hex(@"#0878FB");
}


///适配暗黑模式
static inline UIColor * _Nonnull kHWSdkColor_DarkMode(UIColor * _Nullable light, UIColor * _Nullable dark) {
    if (@available(iOS 13.0, *)) {
        return [UIColor colorWithDynamicProvider:^UIColor * _Nonnull(UITraitCollection * _Nonnull trainCollection) {
            if ([trainCollection userInterfaceStyle] == UIUserInterfaceStyleLight) {
                return light;
            } else {
                return dark;
            }
        }];
    } else {
        return light ? light : (dark ? dark : [kHWSdkColor_FFFFFF() colorWithAlphaComponent:0.00001]);
    }
}

/// 适配暗黑模式 传入字符串 传入 透明度
static inline UIColor * _Nonnull kHWSdkColor_DarkModeAlpha(NSString * _Nullable lightStr, CGFloat li_al, NSString * _Nullable darkStr, CGFloat dr_al) {
    return kHWSdkColor_DarkMode(kHWSdkColor_HexA(lightStr, li_al), kHWSdkColor_HexA(darkStr, dr_al));
}

/// 适配暗黑模式 传入字符串
static inline UIColor * _Nonnull kHWSdkColor_DarkModeStr(NSString * _Nullable lightStr, NSString * _Nullable darkStr) {
    return kHWSdkColor_DarkModeAlpha(lightStr, 1.0, darkStr, 1.0);
}

#endif

#endif /* HWSdkUIKitHeader_h */
