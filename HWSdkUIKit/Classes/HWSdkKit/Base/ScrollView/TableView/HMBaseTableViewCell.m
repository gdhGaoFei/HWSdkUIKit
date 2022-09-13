//
//  HMBaseTableViewCell.m
//  HWork
//
//  Created by 华&梅 on 2022/4/19.
//  Copyright © 2022 Alibaba. All rights reserved.
//

#import "HMBaseTableViewCell.h"
#import "HWSdkKitHeader.h"

@implementation HMBaseTableViewCell

/// 创建 Cell
///viewStyle 当前视图的类型
+ (instancetype)initCellWithTv:(UITableView *)tableView style:(UITableViewCellStyle)style viewStyle:(NSInteger)viewStyle {
    NSString * ident = [NSStringFromClass(self.class) stringByAppendingFormat:@"%ld", viewStyle];
    HMBaseTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier: ident];
    if (cell == nil) {
        cell = [[self.class alloc] initWithStyle:style reuseIdentifier:ident];
        cell.viewStyle = viewStyle;
        [cell setupViewLayout:viewStyle];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

/// 创建 Cell
+ (instancetype)initCellWithTv:(UITableView *)tableView {
    return [self.class initCellWithTv:tableView style:(UITableViewCellStyleSubtitle) viewStyle:0];
}

/// 创建 Cell
+ (instancetype)initCellWithTv:(UITableView *)tableView style:(UITableViewCellStyle)style {
    return [self.class initCellWithTv:tableView style:style viewStyle:0];
}

/// 创建 Cell
///viewStyle 当前视图的类型
+ (instancetype)initCellWithTv:(UITableView *)tableView viewStyle:(NSInteger)viewStyle {
    return [self.class initCellWithTv:tableView style:(UITableViewCellStyleSubtitle) viewStyle:viewStyle];
}


// 创建子视图所需要的方法
- (void)setupViewLayout:(NSInteger)vs {
    
}

// 绑定数据 - bindViewModel
- (void)bindViewModel:(id)viewModel {
    
}

/// 空操作 - 做一些处理
- (void)setIndexPath:(NSIndexPath *)indexPath rowsInSection:(NSInteger)rows {
    
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

//MARK: - ==== 懒加载
// 分界线
- (UIImageView *)imvLine {
    if (!_imvLine) {
        _imvLine = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, 0.5f)];
        [self.contentView addSubview:_imvLine];
        _imvLine.backgroundColor = kHWSdkColor_E2E2E2();
    }
    return _imvLine;
}

@end
