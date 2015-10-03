//
//  MainNavViewController.m
//  movie
//
//  Created by miao on 15-10-1.
//  Copyright (c) 2015年 miao. All rights reserved.
//

#import "MainNavViewController.h"

@interface MainNavViewController ()

@end

@implementation MainNavViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //设置背景
    [self.navigationBar setBackgroundImage:[UIImage imageNamed:@"nav_bg_all-64.png"] forBarMetrics:UIBarMetricsDefault];
    //设置标题
    self.navigationBar.titleTextAttributes = @{
                                               NSFontAttributeName:[UIFont boldSystemFontOfSize:20],
                                               NSForegroundColorAttributeName:[UIColor whiteColor]
                                               };
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}


@end
