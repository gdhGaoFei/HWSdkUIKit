//
//  HWSdkUIKitUtil.m
//  HWSdkUIKit
//
//  Created by 华&梅 on 2022/9/13.
//

#import "HWSdkUIKitUtil.h"
#import "HWSdkUIKitHeader.h"

@implementation HWSdkUIKitUtil

+ (NSString *)filePathForResource:(NSString * _Nullable)name ofType:(NSString * _Nullable)ext fwName:(NSString * _Nullable)fwName {
    if (kHWSdkNullString(name)) {
        return @"";
    }
    NSBundle * cbundle = [NSBundle bundleForClass:[self class]];
    NSString * path = [cbundle pathForResource:fwName ofType:@"bundle"];
    if (kHWSdkNullString(path)) {
        if (kHWSdkNullString(ext)) {
            return name;
        }
        return [name stringByAppendingFormat:@".%@",ext];
    }
    NSBundle * bundle = [NSBundle bundleWithPath:path];
    /// 使用系统的倍图 @2x/@3x 如果没有直接取
    NSString * dataPath = [bundle pathForResource:[name stringByAppendingFormat:@"@%0.fx",[UIScreen mainScreen].scale] ofType:ext];
    if (kHWSdkNullString(dataPath)) {
        dataPath = [bundle pathForResource:name ofType:ext];
    }
    return dataPath;
}

/// 获取文件的路径
+ (NSString *)filePathForResource:(NSString * _Nullable)name ofType:(NSString * _Nullable)ext {
    return [HWSdkUIKitUtil filePathForResource:name ofType:ext fwName:@"HWSdkUIKit"];
}
/// 获取文件的路径
+ (NSString *)filePNGPathForResource:(NSString * _Nullable)name fwName:(NSString * _Nullable)fwName {
    return [HWSdkUIKitUtil filePathForResource:name ofType:@"png" fwName:fwName];
}

/// [UIUtilManager imageNamed: 创建图片
+ (UIImage *)imageNamed:(NSString * _Nullable)name {
    /*if (kHWSDKNullString(name)) {
        return nil;
    }
    NSBundle * bundle = [NSBundle bundleWithPath:[[NSBundle bundleForClass:[self class]] pathForResource:@"HWSDK" ofType:@"bundle"]];
    /// 使用系统的倍图 @2x/@3x 如果没有直接取
    NSString * namePath = [bundle pathForResource:[name stringByAppendingFormat:@"@%0.fx",[UIScreen mainScreen].scale] ofType:@"png" inDirectory:@"image"];
    if (kHWSDKNullString(namePath)) {
        namePath = [bundle pathForResource:name ofType:@"png" inDirectory:@"image"];
    }
    name = namePath;*/
    /*NSError * error = nil;
    name = [NSString stringWithContentsOfFile:name encoding:NSUTF8StringEncoding error:&error];*/
    name = [HWSdkUIKitUtil filePNGPathForResource:name fwName:@"HWSdkUIKit"];
    UIImage * image = [UIImage imageWithContentsOfFile:name];
    return [image imageWithRenderingMode:(UIImageRenderingModeAlwaysOriginal)];
}

@end
