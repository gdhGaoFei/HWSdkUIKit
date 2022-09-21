//
//  HMViewController.m
//  HWSdkUIKit
//
//  Created by gdhgaofei@163.com on 09/13/2022.
//  Copyright (c) 2022 gdhgaofei@163.com. All rights reserved.
//

#import "HMViewController.h"

@interface HMViewController ()

@end

@implementation HMViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = kHWSdkColor_RandomColor();
    NSMutableArray * arrs = [NSMutableArray arrayWithCapacity:1];
    for (int i = 0; i<4; i++) {
        NSString * str = [[NSDate date] stringWithFormat:@"HH:mm"];
        [arrs addObject:str];
    }
    self.dataSource = [arrs copy];
    
//    [self addRefreshHeader:^{
//        NSLog(@"======");
//    }];
//    [self addRefreshFooter:^{
//        NSLog(@"^^^^^^^^");
//    }];
    @weakify(self);
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        @strongify(self);
        NSLog(@"======");
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            NSArray * arr = self.dataSource;
            self.dataSource = arrs;
        });
    }];
}

- (HMBaseTableViewCell *)tableView:(UITableView *)tableView dequeueReusableCell:(NSString *)identifier indexPath:(NSIndexPath *)indexPath {
    HMBaseTableViewCell * cell = [HMBaseTableViewCell initCellWithTv:tableView];
    cell.textLabel.text = self.dataSource[indexPath.row];
    return cell;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
