//
//  HMBaseScrollViewController.m
//  HWork
//
//  Created by 华&梅 on 2022/5/7.
//  Copyright © 2022 Alibaba. All rights reserved.
//

#import "HMBaseScrollViewController.h"
#import "HMRefreshGifHeader.h"
#import "HMRefreshGifFooter.h"

@interface HMBaseScrollViewController ()

/// 空白页
@property (nonatomic, strong) UIView * viewEmpty;

@end

@implementation HMBaseScrollViewController

- (void)dealloc {
    if (self.scrollView) {
        [self.scrollView removeFromSuperview];
        self.scrollView = nil;
        self.dataSource = nil;
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // 初始化数据源
    self.page = 1;
    
    /// 监听数据变化
    /// 设置
    if (self.scrollView) {
        [self.view addSubview:self.scrollView];
        if (@available(iOS 11.0, *)) {
            self.scrollView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        } else {
            // Fallback on earlier versions
        }
        self.edgesForExtendedLayout = UIRectEdgeNone;
        
        /// 监听数据变化
        @weakify(self);
        [RACObserve(self, dataSource) subscribeNext:^(NSArray *  _Nullable x) {
            @strongify(self);
            if (self.showEmptyView) {
                self.viewEmpty.hidden = false;
                if (x && x.count > 0) {
                    self.viewEmpty.hidden = true;
                }
            }
            
            if ([self.scrollView isKindOfClass:UITableView.class]) {
                UITableView * tv = (UITableView *)self.scrollView;
                [tv reloadData];
            } else if ([self.scrollView isKindOfClass:UICollectionView.class]) {
                UICollectionView * cv = (UICollectionView *)self.scrollView;
                [cv reloadData];
            }
            
            MJRefreshComponent * header = self.scrollView.mj_header;
            if (header != nil && header.state == MJRefreshStateRefreshing) {
                [header endRefreshing];
            }
            
            MJRefreshComponent * footer = self.scrollView.mj_footer;
            if (footer != nil && footer.state == MJRefreshStateRefreshing) {
                [footer endRefreshing];
            }
        }];
    }
}

/// 添加 Header 刷新控件
- (void)addRefreshTableView:(UIScrollView *)tv header:(MJRefreshComponentAction)block {
    tv.mj_header = [HMRefreshGifHeader headerWithRefreshingBlock:block];
}

/// 添加 Header 刷新控件
- (void)addRefreshHeader:(MJRefreshComponentAction)block {
    [self addRefreshTableView:self.scrollView header:block];
}

/// 添加 footer 刷新控件
- (void)addRefreshTableView:(UIScrollView *)tv footer:(MJRefreshComponentAction)block {
    tv.mj_footer = [HMRefreshGifFooter footerWithRefreshingBlock:block];
}

/// 添加 footer 刷新控件
- (void)addRefreshFooter:(MJRefreshComponentAction)block {
    [self addRefreshTableView:self.scrollView footer:block];
}

/// 空白页
- (UIView *)viewEmpty {
    if (!_viewEmpty) {
        _viewEmpty = [[UIView alloc] initWithFrame:self.scrollView.bounds];
        [self.scrollView addSubview:_viewEmpty];
        
        /// 图片
        UIImageView * imv_wsj = [[UIImageView alloc] init];
        [_viewEmpty addSubview:imv_wsj];
        [imv_wsj mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(0.f);
            make.top.mas_equalTo(self.emptyVerticalOffset);
        }];
        if (self.emptyImage) {
            imv_wsj.image = self.emptyImage;
        } else if (self.emptyImageName) {
            imv_wsj.image = [UIImage imageNamed:self.emptyImageName];
        }
        
        /// 文本
        UILabel * label_ts = [UILabel new];
        [_viewEmpty addSubview:label_ts];
        label_ts.attributedText = self.emptyTitle;
        label_ts.textAlignment = NSTextAlignmentCenter;
        [label_ts mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(0);
            make.top.equalTo(imv_wsj.mas_bottom).offset(17.f);
        }];
    }
    return _viewEmpty;
}

@end
