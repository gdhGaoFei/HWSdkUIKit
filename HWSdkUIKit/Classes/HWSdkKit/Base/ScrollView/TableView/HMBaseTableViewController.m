//
//  HMBaseTableViewController.m
//  HWork
//
//  Created by 华&梅 on 2022/5/7.
//  Copyright © 2022 Alibaba. All rights reserved.
//

#import "HMBaseTableViewController.h"
//#import "ActionModel.h"
//#import "objc/message.h"

@interface HMBaseTableViewController ()

@end

@implementation HMBaseTableViewController

- (void)dealloc {
    if (_tableView != nil) {
        _tableView.delegate = nil;
        _tableView.dataSource = nil;
        [_tableView removeFromSuperview];
    }
}

- (void)viewDidLoad {
    self.scrollView = self.tableView;
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

// contentInset
- (UIEdgeInsets)contentInset {
    //return UIEdgeInsetsMake(kHWSdkNavStatusBar_HEIGHT(), 0, 0, 0);
    return UIEdgeInsetsMake(0, 0, 0, 0);
}

/// dequeueReusableCell
- (HMBaseTableViewCell *)tableView:(UITableView *)tableView dequeueReusableCell:(NSString *)identifier indexPath:(NSIndexPath *)indexPath {
    HMBaseTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    if (cell == nil) {
        cell = [HMBaseTableViewCell initCellWithTv:tableView];
    }
    return cell;
}

/// configure cell data
- (void)configure:(HMBaseTableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath with:(id)object {
    [cell bindViewModel:object];
}

//MARK: - ==== UITableViewDelegate, UITableViewDataSource
// 数量
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}

// 单元格
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    HMBaseTableViewCell * cell = [self tableView:tableView dequeueReusableCell:@"HMBaseTableViewCell0" indexPath:indexPath];
    //[self configure:cell atIndexPath:indexPath with:@""];
    //[cell setIndexPath:indexPath rowsInSection:0];
    return cell;
}

// 尾部视图
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    NSString * iden = @"UITableViewHeaderFooterView0";
    //
    UITableViewHeaderFooterView * view1 = [tableView dequeueReusableHeaderFooterViewWithIdentifier:iden];
    if (view1 == nil) {
        view1 = [[UITableViewHeaderFooterView alloc] initWithReuseIdentifier:iden];
        view1.backgroundView = [UIView new];
        view1.contentView.backgroundColor = [UIColor.whiteColor colorWithAlphaComponent:0.00001];
    }
    return view1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.0001;
}

// 头部视图
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    NSString * iden = @"UITableViewHeaderFooterView1";
    //
    UITableViewHeaderFooterView * view1 = [tableView dequeueReusableHeaderFooterViewWithIdentifier:iden];
    if (view1 == nil) {
        view1 = [[UITableViewHeaderFooterView alloc] initWithReuseIdentifier:iden];
        view1.backgroundView = [UIView new];
        view1.contentView.backgroundColor = [UIColor.whiteColor colorWithAlphaComponent:0.00001];
    }
    return view1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0.0001;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.dataSource.count == 0) {
        return;
    }
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
//    if (self.dataSource.count > indexPath.row && [[self.dataSource objectAtIndex:indexPath.row] isKindOfClass:[ActionModel class]]) {
//        ActionModel *model = [self.dataSource objectAtIndex:indexPath.row];
//        if (model.actionCtrl) {
//            [self pushViewControllerWithVcString:model.actionCtrl];
//        }else if (model.action){
//#pragma clang diagnostic push
//#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
//            [self performSelector:model.action];
//#pragma clang diagnostic pop
//        }else{
//            //DO nothing
//        }
//    }
}


//MARK: - ==== 懒加载
// TableView
- (UITableView *)tableView {
    if (!_tableView) {
        UITableView * tv = [[UITableView alloc] initWithFrame:self.view.bounds style:self.style];
        _tableView = tv;
        _tableView.backgroundColor = self.view.backgroundColor;
        _tableView.rowHeight = UITableViewAutomaticDimension;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        // 注册单元格
        [_tableView registerClass:HMBaseTableViewCell.class forCellReuseIdentifier:[NSStringFromClass(HMBaseTableViewCell.class) stringByAppendingString:@"0"]];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.contentInset = [self contentInset];
        
        UIView *footView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kHWSdkScreen_WIDTH(), 0.5)];
        _tableView.tableFooterView = footView;
        
        tv.separatorColor = kHWSdkColor_E2E2E2();
        //如果不加这一行代码，依然可以实现点击反馈，但反馈会有轻微延迟，体验不好。
        tv.delaysContentTouches = false;
        tv.autoresizingMask = UIViewAutoresizingFlexibleHeight |UIViewAutoresizingFlexibleWidth;
        
        if (@available(iOS 11.0, *)) {
            _tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
            _tableView.estimatedRowHeight = kHWSdkScreen_HEIGHT();
            _tableView.estimatedSectionFooterHeight = 0;
            _tableView.estimatedSectionHeaderHeight = 0;
        } else {
            // Fallback on earlier versions
            self.automaticallyAdjustsScrollViewInsets = false;
            //self.edgesForExtendedLayout = UIRectEdgeNone;
            //self.extendedLayoutIncludesOpaqueBars = false;
            //self.modalPresentationCapturesStatusBarAppearance = false;
        }
    }
    return _tableView;
}


@end
