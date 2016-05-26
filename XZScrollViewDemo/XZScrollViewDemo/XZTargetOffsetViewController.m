//
//  XZTargetOffsetViewController.m
//  XZScrollViewDemo
//
//  Created by 徐章 on 16/5/25.
//  Copyright © 2016年 徐章. All rights reserved.
//

#import "XZTargetOffsetViewController.h"

@interface XZTargetOffsetViewController ()<UIScrollViewDelegate>
@property (nonatomic, strong) UIScrollView *scrollView;
@end

@implementation XZTargetOffsetViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.scrollView = [[UIScrollView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    [self.view addSubview:self.scrollView];
    
    UILabel *line = [[UILabel alloc] initWithFrame:CGRectMake(([UIScreen mainScreen].bounds.size.width-1)/2.0f, 0, 1, [UIScreen mainScreen].bounds.size.height)];
    [self.view addSubview:line];
    line.backgroundColor = [UIColor redColor];
    
    self.scrollView = [[UIScrollView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [self.view addSubview:self.scrollView];
    
    CGFloat width = 50.0f;
    
    self.scrollView.contentSize = CGSizeMake(50*100+[UIScreen mainScreen].bounds.size.width-width, 50);
    self.scrollView.delegate = self;
    for (NSInteger i =0; i<100; i++) {
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(([UIScreen mainScreen].bounds.size.width-width)/2.0f+i*width, 200, width, width)];
        label.layer.cornerRadius = 25.0f;
        label.layer.masksToBounds = YES;
        label.text = [NSString stringWithFormat:@"%ld",i];
        label.backgroundColor = [UIColor redColor];
        label.textAlignment = NSTextAlignmentCenter;
        [self.scrollView addSubview:label];
    }

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (CGPoint)nearestTargetOffsetForOffset:(CGPoint)offset
{
    CGFloat pageSize = 50.0f;
    NSInteger page = roundf(offset.x / pageSize);
    CGFloat targetX = pageSize * page;
    return CGPointMake(targetX, offset.y);
}

- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset
{
    CGPoint targetOffset = [self nearestTargetOffsetForOffset:*targetContentOffset];
    targetContentOffset->x = targetOffset.x;
    targetContentOffset->y = targetOffset.y;
}

@end
