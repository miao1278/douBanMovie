//
//  MainViewController.m
//  movie
//
//  Created by miao on 15-10-1.
//  Copyright (c) 2015年 miao. All rights reserved.
//

#import "MainViewController.h"
#import "HomeViewController.h"
#import "NewsViewController.h"
#import "TopViewController.h"
#import "ModelTableViewController.h"
#import "MoreTableViewController.h"
#import "MainNavViewController.h"
#import "myButton.h"


@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //创建三级控制器
    [self _initViewControllers];
    
    //自定义tabbar
    [self _initTabbar];
}

- (void)_initViewControllers{
    
    //创建跟视图控制器
    HomeViewController *homeVC = [[UIStoryboard storyboardWithName:@"Main" bundle:nil]instantiateInitialViewController];
    NewsViewController *newsVC = [[NewsViewController alloc] init];
    TopViewController  *topVC  = [[TopViewController alloc] init];
    ModelTableViewController *modelVC = [[ModelTableViewController alloc] init];
    MoreTableViewController *moreVC = [[UIStoryboard storyboardWithName:@"Main" bundle:nil]instantiateViewControllerWithIdentifier:@"more_table"];
    
    NSArray *VCArray = @[homeVC,newsVC,topVC,modelVC,moreVC];
    
    //包裹nav
    NSMutableArray *navArray = [[NSMutableArray alloc] init];
    for (int i = 0; i < VCArray.count; i++) {
        MainNavViewController *nav = [[MainNavViewController alloc]initWithRootViewController:VCArray[i]];
        //[self.tabBarController addChildViewController:nav];如果采用下面的方法自定义tabbar 那么这个方法不可用  他不会移除
        [navArray addObject:nav];
    }
    self.viewControllers = navArray;
}

- (void)_initTabbar{
    //从uitabbar的subviews移除button
    UITabBar *tabbar = self.tabBar;
    NSArray *subViews = tabbar.subviews;
    for (UIView *view in subViews) {
        Class cls = NSClassFromString(@"UITabBarButton");//一个个加的话不会移除
        if ([view isKindOfClass:cls]) {
            [view removeFromSuperview];
        }
    }
    //tabbar的背景图片
    tabbar.backgroundImage = [UIImage imageNamed:@"tab_bg_all.png"];
    
    //宽度
    CGFloat width = windowWidth/5;
    
    //点击图片
    _selectImg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"selectTabbar_bg_all1.png"]];
    _selectImg.frame = CGRectMake(5, 5, width - 10, 49-10);
    [tabbar addSubview:_selectImg];
    
    //添加按钮
    NSArray *buttonImg = @[ @"movie_home.png",
                            @"msg_new.png",
                            @"start_top250.png",
                            @"icon_cinema.png",
                            @"more_select_setting.png"];
    
    NSArray *title = @[@"首页",@"新闻",@"TOP",@"影院",@"更多"];
    for (int i = 0; i<title.count; i++) {
        myButton *button = [[myButton alloc]initWithFrame:CGRectMake(i*width, 0, width, 49)
                                            withImageName:buttonImg[i]
                                            withTitle:title[i]];
        button.tag = i;
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        [tabbar addSubview:button];
    }
    
}


//按钮点击
- (void)buttonClick:(UIButton *)sender{
    //绑定控制器
    self.selectedIndex = sender.tag;
    
    [UIView animateWithDuration:0.35 animations:^{
        _selectImg.center = sender.center;
    }];
}
@end
