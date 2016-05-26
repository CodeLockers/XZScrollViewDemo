//
//  ViewController.m
//  XZScrollViewDemo
//
//  Created by 徐章 on 16/5/22.
//  Copyright © 2016年 徐章. All rights reserved.
//

#import "ViewController.h"
#import "XZPagingEnabledViewController.h"
#import "XZSnapViewController.h"
#import "XZTargetOffsetViewController.h"

#define TitleArray @[@"pagingEnabled",@"snap",@"targetContentOffset"]

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.tableFooterView = [UIView new];
    self.automaticallyAdjustsScrollViewInsets = NO;
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableView_DataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return TitleArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([UITableViewCell class])];
    if (!cell) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass([UITableViewCell class])];
    }
    
    cell.textLabel.text = TitleArray[indexPath.row];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

#pragma mark - UITableView_Delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    switch (indexPath.row) {
        case 0:
        {
            XZPagingEnabledViewController *pagingEnabledVc = [[XZPagingEnabledViewController alloc] init];
            [self.navigationController pushViewController:pagingEnabledVc animated:YES];
         }
            break;
        case 1:
        {
            XZSnapViewController *snapVc = [[XZSnapViewController alloc] init];
            [self.navigationController pushViewController:snapVc animated:YES];
        }
            break;
        case 2:
        {
            XZTargetOffsetViewController *targetOffsetVc = [[XZTargetOffsetViewController alloc] init];
            [self.navigationController pushViewController:targetOffsetVc animated:YES];
        }
            break;
        default:
            break;
    }
}
@end
