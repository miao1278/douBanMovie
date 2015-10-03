//
//  HomeViewController.m
//  movie
//
//  Created by miao on 15-9-26.
//  Copyright (c) 2015年 miao. All rights reserved.
//

#import "HomeViewController.h"
#import "tableView.h"
#import "posterColletionView.h"
#import "MJExtension.h"
#import "HomeModel.h"

@interface HomeViewController (){
    tableView *_tableView;
    posterColletionView *_colletionView;
}

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"首页";
    
    //初始化第一个你看到的tableview
    [self _initTableVew];
    
    //初始化翻转的视图
    [self  _initCollectionView];
    
    //初始化你右边的按钮
    [self _initNavagetionItem];
    
    //加载数据
    [self loadData];

}
//初始化第一个你看到的tableview
- (void)_initTableVew{
    
    _tableView = [[tableView alloc] initWithFrame:CGRectMake(0, 0,windowWidth, windowHeight-49 -64)];
    _tableView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_main@2x.png"]];
    _tableView.hidden = NO;

    [self.view addSubview:_tableView];
}
//初始化翻转视图
- (void)_initCollectionView{
    _colletionView = [[posterColletionView alloc] initWithFrame:CGRectMake(0, 0, windowWidth, windowHeight-49-64)];
    _colletionView.hidden = YES;
    [self.view addSubview:_colletionView];
}

//初始化你右边的按钮
- (void)_initNavagetionItem{
    UIView *customView = [[UIView alloc] init];
    customView.frame = CGRectMake(0, 0, 60, 30);
    UIButton *btn1 = [[UIButton alloc] init];
    UIButton *btn2 = [[UIButton alloc] init];
    
    [btn1 setBackgroundImage:[UIImage imageNamed:@"exchange_bg_home@2x.png"] forState:UIControlStateNormal];
    [btn1 setImage:[UIImage imageNamed:@"list_home.png"] forState:UIControlStateNormal];
    btn1.frame = customView.bounds;
    btn1.tag = 100;
    [btn1 addTarget:self action:@selector(NavagetionItemClick:) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    [btn2 setBackgroundImage:[UIImage imageNamed:@"exchange_bg_home@2x.png"] forState:UIControlStateNormal];
    [btn2 setImage:[UIImage imageNamed:@"poster_home.png"] forState:UIControlStateNormal];
    btn2.frame = customView.bounds;
    btn2.tag = 101;
    [btn2 addTarget:self action:@selector(NavagetionItemClick:) forControlEvents:UIControlEventTouchUpInside];
    
    btn1.hidden = NO;
    btn2.hidden = YES;
    [customView addSubview:btn1];
    [customView addSubview:btn2];
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithCustomView:customView];
    self.navigationItem.rightBarButtonItem = rightItem;
}

//导航栏按钮点击
- (void)NavagetionItemClick:(UIView *)sender{
    // 取出我们做的NavagetionItem中的按钮
    UIView *customView = self.navigationItem.rightBarButtonItem.customView;
    
    UIButton *btn1 = (UIButton *)[customView viewWithTag:100];
    UIButton *btn2 = (UIButton *)[customView viewWithTag:101];
    
    //设置下动画
    /*
    动画
    [UIView animateKeyframesWithDuration:<#(NSTimeInterval)#> delay:<#(NSTimeInterval)#> options:<#(UIViewKeyframeAnimationOptions)#> animations:<#^(void)animations#> completion:<#^(BOOL finished)completion#>];
    
    操作自视图 transition替换view
    UIView transitionWithView:<#(UIView *)#> duration:<#(NSTimeInterval)#> options:<#(UIViewAnimationOptions)#> animations:<#^(void)animations#> completion:<#^(BOOL finished)completion#>
    **/
    UIViewAnimationOptions Transition;
    
    //判断翻转选择动画
    if (!btn1.hidden) {
        Transition = UIViewAnimationOptionTransitionFlipFromLeft;
    }else{
        Transition = UIViewAnimationOptionTransitionFlipFromRight;
    }
    [UIView transitionWithView:customView duration:0.35 options:Transition animations:^{
        btn1.hidden = !btn1.hidden;
        btn2.hidden = !btn2.hidden;
    } completion:nil];
    
    //视图翻转动画
    
    [UIView transitionWithView:self.view duration:0.35 options:Transition animations:^{
        _colletionView.hidden = !_colletionView.hidden;
        _tableView.hidden = !_tableView.hidden;
    } completion:nil];
    
}

//加载数据
- (void)loadData{
    _data = [[NSMutableArray alloc] init];
    
    //本地json数据
    NSDictionary *jsonDic = [DataServise requestDataFile:@"us_box.json"];
    
    NSArray *subjects = jsonDic[@"subjects"];
    
    for (NSDictionary *dic in subjects) {
        NSDictionary *subjectDic = dic[@"subject"];
        HomeModel *model = [HomeModel objectWithKeyValues:subjectDic];
        [_data addObject:model];
    }
    //传递给post视图
    _colletionView.data = _data;
    _tableView.data = _data;
}

@end
