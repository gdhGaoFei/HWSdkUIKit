//
//  HWSdkUIKitUtil.h
//  HWSdkUIKit
//
//  Created by 华&梅 on 2022/9/13.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface HWSdkUIKitUtil : NSObject

/// 获取文件的路径
+ (NSString *)filePathForResource:(NSString * _Nullable)name ofType:(NSString * _Nullable)ext;
/// 获取文件的路径
+ (NSString *)filePathForResource:(NSString * _Nullable)name ofType:(NSString * _Nullable)ext fwName:(NSString * _Nullable)fwName;
/// 获取文件的路径
+ (NSString *)filePNGPathForResource:(NSString * _Nullable)name fwName:(NSString * _Nullable)fwName;
/// 获取文件的路径
+ (NSString *)filePNGPathForResource:(NSString * _Nullable)name fwName:(NSString * _Nullable)fwName resourceClass:(Class _Nullable)resourceClass;
/// 获取文件的路径
+ (NSString *)filePathForResource:(NSString * _Nullable)name ofType:(NSString * _Nullable)ext fwName:(NSString * _Nullable)fwName resourceClass:(Class _Nullable)resourceClass;

/// [UIUtilManager imageNamed: 创建图片
+ (UIImage *)imageNamed:(NSString * _Nullable)name;

@end

NS_ASSUME_NONNULL_END
