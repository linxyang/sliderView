//
//  ViewController.m
//  powerAdjustViewDemo
//
//  Created by fuchun on 16/8/6.
//  Copyright © 2016年 nzq. All rights reserved.
//

#import "ViewController.h"
#import "PowerAdjustView.h"
#import "UIView+frame.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithWhite:0.3 alpha:0.8];
    PowerAdjustView *powerView = [[PowerAdjustView alloc] initWithPowerGradeChangeBlock:^(PowerGradeType gradeType) {
        NSLog(@"滑动到了档位:%zd",gradeType);
    }];
    
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0,100, 375, 400)];
    [self.view addSubview:scrollView];
    
    scrollView.contentSize = CGSizeMake(375, 500);
    
    powerView.x = 30;
    powerView.y = 0;
    [scrollView addSubview:powerView];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
