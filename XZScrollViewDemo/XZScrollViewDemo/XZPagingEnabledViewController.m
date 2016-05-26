//
//  XZPagingEnabledViewController.m
//  XZScrollViewDemo
//
//  Created by 徐章 on 16/5/23.
//  Copyright © 2016年 徐章. All rights reserved.
//

#import "XZPagingEnabledViewController.h"

@interface XZPagingEnabledViewController ()
@property (nonatomic, strong) UIScrollView *scrollView;
@end

@implementation XZPagingEnabledViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"PagingEnabled";
    
    CGFloat width = 240.0f;
    
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(([UIScreen mainScreen].bounds.size.width - width)/2.0f, 64, width, [UIScreen mainScreen].bounds.size.height-64.0f)];
    
    self.scrollView.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.scrollView];
    
    self.scrollView.contentSize = CGSizeMake(width*10,width);
    self.scrollView.pagingEnabled = YES;
    self.scrollView.layer.masksToBounds = NO;
    
    for (NSInteger i=0; i<10; i++) {
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(i*width+20, (CGRectGetHeight(self.scrollView.frame) - width)/2.0f, width - 40, width-40)];
        
        
        
        label.text = [NSString stringWithFormat:@"%ld",i];
        label.textAlignment = NSTextAlignmentCenter;
        label.font = [UIFont systemFontOfSize:30.0f];
        label.backgroundColor = [UIColor greenColor];
        label.layer.cornerRadius = 100.0f;
        label.layer.masksToBounds = YES;
        [self.scrollView addSubview:label];
    }
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
