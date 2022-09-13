//
//  HMBaseTableViewCell.h
//  HWork
//
//  Created by 华&梅 on 2022/4/19.
//  Copyright © 2022 Alibaba. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

// 基础的 TableViewCell
@interface HMBaseTableViewCell : UITableViewCell

/// 创建 Cell
///viewStyle 当前视图的类型
+ (instancetype)initCellWithTv:(UITableView *)tableView style:(UITableViewCellStyle)style viewStyle:(NSInteger)viewStyle;

/// 创建 Cell
+ (instancetype)initCellWithTv:(UITableView *)tableView;

/// 创建 Cell
+ (instancetype)initCellWithTv:(UITableView *)tableView style:(UITableViewCellStyle)style;

/// 创建 Cell
///viewStyle 当前视图的类型
+ (instancetype)initCellWithTv:(UITableView *)tableView viewStyle:(NSInteger)viewStyle;


//MARK: - ==== 属性
// viewStyle 当前视图的类型 用于区分创建相似的单元格
@property (nonatomic, assign) NSInteger viewStyle;
// 分界线
@property (nonatomic, strong) UIImageView * imvLine;

// 创建子视图所需要的方法
- (void)setupViewLayout:(NSInteger)vs;

// 绑定数据 - bindViewModel
- (void)bindViewModel:(id)viewModel;

/// 空操作 - 做一些处理
- (void)setIndexPath:(NSIndexPath *)indexPath rowsInSection:(NSInteger)rows;

@end

NS_ASSUME_NONNULL_END
