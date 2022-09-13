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
    self.dataSource = @[@"数据", @"数据1", @"数据2", @"数据3", ];
    
    [self addRefreshHeader:^{
        NSLog(@"======");
    }];
    [self addRefreshFooter:^{
        NSLog(@"^^^^^^^^");
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
