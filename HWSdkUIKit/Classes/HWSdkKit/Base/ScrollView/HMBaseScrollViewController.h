//
//  HMBaseScrollViewController.h
//  HWork
//
//  Created by 华&梅 on 2022/5/7.
//  Copyright © 2022 Alibaba. All rights reserved.
//

#import "HMBaseViewController.h"
#import "HWSdkUIKitHeader.h"

NS_ASSUME_NONNULL_BEGIN

@interface HMBaseScrollViewController : HMBaseViewController

/// 基础的视图 UIScrollView
@property (nonatomic, weak) UIScrollView * scrollView;
/// 数据源数组
@property (nonatomic, copy  ) NSArray * _Nullable dataSource;
/// 第一页
@property (nonatomic, assign) NSInteger page;

/// 添加 Header 刷新控件
- (void)addRefreshTableView:(UIScrollView *)tv header:(MJRefreshComponentAction)block;
/// 添加 Header 刷新控件
- (void)addRefreshHeader:(MJRefreshComponentAction)block;
/// 添加 footer 刷新控件
- (void)addRefreshTableView:(UIScrollView *)tv footer:(MJRefreshComponentAction)block;
/// 添加 footer 刷新控件
- (void)addRefreshFooter:(MJRefreshComponentAction)block;


//MARK: - ===== EmptyDataSet
///标题
@property (nonatomic, copy) NSAttributedString * emptyTitle;
///详情
@property (nonatomic, copy) NSAttributedString * emptyDescription;
///图片的名称
@property (nonatomic, copy) NSString * emptyImageName;
///图片
@property (nonatomic, strong) UIImage * emptyImage;
///Button的背景图片
@property (nonatomic, strong) UIImage * emptyBtnBackImage;
///Button的文本
@property (nonatomic, copy) NSAttributedString * emptyBtnTitle;
///内容的偏移量
@property (nonatomic, assign) CGFloat emptyVerticalOffset;
///点击空白页 的回调 0点击Button 1点击整个背景视图
@property (nonatomic, copy) void(^emptyDidTapView)(NSInteger);
///是否需要展示 无数据的视图
@property (nonatomic, assign) BOOL showEmptyView;

@end

NS_ASSUME_NONNULL_END
