//
//  HWSdkMacro.h
//  Pods
//
//  Created by 华&梅 on 2022/9/20.
//

#ifndef HWSdkMacro_h
#define HWSdkMacro_h

#ifdef __OBJC__

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "objc/runtime.h"

/// 字符串 是否 为空
static inline BOOL kHWSdkNullString(NSString * _Nullable string) {
    return ((![string isKindOfClass:[NSString class]]) ||
            [string isEqualToString:@""] ||
            (string == nil) ||
            [string isEqualToString:@""] ||
            [string isEqualToString:@"null"] ||
            [string isKindOfClass:[NSNull class]] ||
            [[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] length] == 0);
}

//MARK: - ===== 字体
///苹方-简 常规体 PingFangTC-Regular
static inline UIFont * _Nonnull kHWSdkFont_PingFangSCRegular(CGFloat size) {
    CGFloat scale = 1.f;//*kHWSdkScreen_WIDTH()/375.f
    return [UIFont fontWithName:@"PingFangSC-Regular" size:size*scale];
}

///苹方-简 中黑体 粗体 PingFangSC-Medium
static inline UIFont * _Nonnull kHWSdkFont_PingFangSCMedium(CGFloat size) {
    CGFloat scale = 1.f;//*kHWSdkScreen_WIDTH()/375.f
    return [UIFont fontWithName:@"PingFangSC-Medium" size:size*scale];
}

///苹方-简 中粗体 PingFangSC-Semibold
static inline UIFont * _Nonnull kHWSdkFont_PingFangSCSemibold(CGFloat size) {
    CGFloat scale = 1.f;//*kHWSdkScreen_WIDTH()/375.f
    return [UIFont fontWithName:@"PingFangSC-Semibold" size:size*scale];
}

/// systemFontOfSize
static inline UIFont * _Nonnull kHWSdkFont_SystemFontOfSize(CGFloat size) {
    CGFloat scale = 1.f;//*kHWSdkScreen_WIDTH()/375.f
    return [UIFont systemFontOfSize:size*scale];
}

/// boldSystemFontOfSize
static inline UIFont * _Nonnull kHWSdkFont_BoldSystemFontOfSize(CGFloat size) {
    CGFloat scale = 1.f;//*kHWSdkScreen_WIDTH()/375.f
    return [UIFont boldSystemFontOfSize:size*scale];
}

/// 消息中的文本输入框的字体大小
static inline UIFont * _Nonnull kHWSdkFont_MessageTextViewFont16() {
    return [UIFont systemFontOfSize:16.f];
}

//MARK: - ===== 屏幕尺寸相关
///屏幕宽度
static inline CGFloat kHWSdkScreen_WIDTH() {
    return [[UIScreen mainScreen] bounds].size.width;
}
///屏幕高度
static inline CGFloat kHWSdkScreen_HEIGHT() {
    return [[UIScreen mainScreen] bounds].size.height;
}

/// 传入视图宽度
static inline CGFloat kHWSdkView_WIDTH(UIView * _Nullable view) {
    return view.frame.size.width;
}

///传入视图高度
static inline CGFloat kHWSdkView_HEIGHT(UIView * _Nullable view) {
    return view.frame.size.height;
}

///屏幕适配尺寸 适配
static inline CGFloat kHWSdkAutoScale() {
    return kHWSdkScreen_WIDTH()/375.f;
}
static inline CGFloat kHWSdkPxConvertToPt(CGFloat px){
    return ceil(px * kHWSdkAutoScale());
}

/// StatusBar 状态栏的高度
static inline CGFloat kHWSdkStatusBar_HEIGHT() {
    return [[UIApplication sharedApplication] statusBarFrame].size.height;
}

/// x系列的底部安全的距离
static inline CGFloat kHWSdkBottomSafe_HEIGHT() {
    if (@available(iOS 11.0, *)) {
        return [[UIApplication sharedApplication] keyWindow].safeAreaInsets.bottom;
    } else {
        // Fallback on earlier versions
        return 0.f;
    }
}

/// 导航栏的 navBar的高度 NavBar_Height
static inline CGFloat kHWSdkNavBar_HEIGHT() {
    return 44.f;
}

/// 导航栏navBar 和状态栏 的高度
static inline CGFloat kHWSdkNavStatusBar_HEIGHT() {
    return kHWSdkNavBar_HEIGHT() + kHWSdkStatusBar_HEIGHT();
}

/// 根据tabber背景图高度调整tabBar高度
static inline CGFloat kHWSdkTabBar_HEIGHT() {
    CGFloat h = kHWSdkBottomSafe_HEIGHT();
    return h > 0 ? 88.f:56.f;
}


//MARK: - ====== 方法
/// 给方法交换方法
static inline void kHMDynamicMethodIMPChanges(id _Nullable self, SEL _Nullable oldMethod, SEL _Nullable newMethod) {
    Method methodA = class_getInstanceMethod(self, oldMethod);
    Method methodB = class_getInstanceMethod(self, newMethod);
    //添加自定义方法
    BOOL isAdd = class_addMethod(self, oldMethod, method_getImplementation(methodB), method_getTypeEncoding(methodB));
    if (isAdd) {//添加成功->替换
        class_replaceMethod(self, newMethod, method_getImplementation(methodA), method_getTypeEncoding(methodA));
    } else {//添加不成功->交换
        //添加失败了 说明本类中有methodB的实现，此时只需要将methodA和methodB的IMP互换一下即可。
        method_exchangeImplementations(methodA, methodB);
    }
};

#endif

#endif /* HWSdkMacro_h */
