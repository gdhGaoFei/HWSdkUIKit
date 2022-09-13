//
//  HMBaseTableViewController.h
//  HWork
//
//  Created by 华&梅 on 2022/5/7.
//  Copyright © 2022 Alibaba. All rights reserved.
//

#import "HMBaseScrollViewController.h"
#import "HMBaseTableViewCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface HMBaseTableViewController : HMBaseScrollViewController
<
UITableViewDelegate,
UITableViewDataSource
>


/// TableView的类型
@property (nonatomic, assign) UITableViewStyle style;
/// TableView
@property (nonatomic, strong) UITableView * tableView;

// contentInset
- (UIEdgeInsets)contentInset;

/// dequeueReusableCell
- (HMBaseTableViewCell *)tableView:(UITableView *)tableView dequeueReusableCell:(NSString *)identifier indexPath:(NSIndexPath *)indexPath;

/// configure cell data
- (void)configure:(HMBaseTableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath with:(id)object;

@end

NS_ASSUME_NONNULL_END
