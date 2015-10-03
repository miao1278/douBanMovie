//
//  posterColletionView.m
//  movie
//
//  Created by miao on 15-9-30.
//  Copyright (c) 2015年 miao. All rights reserved.
//

#import "posterColletionView.h"
#import "HeaderView.h"

#define  HeaderHeight   100
#define  FooterHeight    30

@implementation posterColletionView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        //灯光视图的先后顺序很重要盖住视图
        //初始化海报视图
        [self _initPostView];
        
        //创建灯光View
        [self _initLightView];
        
        //初始化下拉菜单
        [self _initHeaderView];
        
        //添加headerColletion
        [self _addHeaderCollection];
        
        //添加底部标题
        [self _addFooderView];
        
        //用三种方式来实现 headerView 和postView 的item一致
        
        //1.kvo监听模式 option需要新的值还是旧的值
        [_postView addObserver:self forKeyPath:@"currentIndex" options:NSKeyValueObservingOptionNew context:nil];
        [_headerColletion addObserver:self forKeyPath:@"currentIndex" options:NSKeyValueObservingOptionNew context:nil];
        
        
    }
    return self;
}


- (void)_initPostView{
    _postView = [[posterView alloc] initWithFrame:CGRectMake(0, 26, windowWidth, windowHeight - 49 -64 -26 - FooterHeight)];
    _postView.scrolldelegate = self;
    _postView.pageWidth = 250;
    [self addSubview:_postView];
}

//加载数据
- (void)setData:(NSArray *)data{
    _data = data;
    _postView.data = data;
    _headerColletion.data = data;
    
    //设置底部标题的字符串
    if (data.count > 0) {
        HomeModel *model = data[0];
        _fooderLable.text = model.title;
    }
    
}

//_initHeaderView
- (void)_initHeaderView{
    _imgHeader = [[UIImageView alloc] initWithFrame:CGRectMake(0, -HeaderHeight, windowWidth, HeaderHeight+26)];
    
    //设置用户交互为yes
    _imgHeader.userInteractionEnabled = YES;
    
    UIImage *image = [UIImage imageNamed:@"indexBG_home.png"];
    
    //把imge拉伸到frame的高度，的拉伸点 图片拉伸 MJ大神讲解http://blog.csdn.net/q199109106q/article/details/8615661
    //只是对一个像素进行复制到一定宽度。而图像后面的剩余像素也不会被拉伸。奶奶的 ，这个方法要有个新的image来接收  我也是醉了
    UIImage *bigImg =  [image stretchableImageWithLeftCapWidth:0 topCapHeight:5];
    //设置图片
    _imgHeader.image = bigImg;
    
    [self addSubview:_imgHeader];
    //设置下拉按钮
    _btn = [UIButton buttonWithType:UIButtonTypeCustom];

    [_btn setImage:[UIImage imageNamed:@"down_home.png"] forState:UIControlStateNormal];
    [_btn setImage:[UIImage imageNamed:@"up_home.png"] forState:UIControlStateSelected];
    _btn.frame = CGRectMake((windowWidth-20)/2, _imgHeader.height-20-5, 26, 20);
    
    //添加点击事件
    [_btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    [_imgHeader addSubview:_btn];
}

//添加headerColletion
- (void)_addHeaderCollection{
    _headerColletion = [[HeaderView alloc] initWithFrame:CGRectMake(0, 0, windowWidth, HeaderHeight)];
    _headerColletion.pageWidth = 80;
    [_imgHeader addSubview:_headerColletion];
    
}

//创建灯光视图
- (void)_initLightView{
    UIImageView *leftImge = [[UIImageView alloc] initWithFrame:CGRectMake(10, 5, 124, 204)];
    leftImge.image = [UIImage imageNamed:@"light.png"];
    [self addSubview:leftImge];
    
    UIImageView *rightImge = [[UIImageView alloc] initWithFrame:CGRectMake(windowWidth-10-124, 5, 124, 204)];
    rightImge.image = [UIImage imageNamed:@"light.png"];
    [self addSubview:rightImge];

}

//下拉按钮点击
- (void)btnClick:(UIButton *)btn{
    if (!_btn.selected) {
        //显示索引列表
        [self _showIndexView];
        
    }else{
        //隐藏索引列表
        [self _hiddenIndexView];
    }
        
}

- (void)_showIndexView{
    [UIView animateWithDuration:0.5 animations:^{
        _imgHeader.transform = CGAffineTransformMakeTranslation(0, HeaderHeight);
    }];
    
    //改变下拉按钮的状态
    _btn.selected = YES;
}

- (void)_hiddenIndexView{
    [UIView animateWithDuration:0.5 animations:^{
        //恢复原来状态
        _imgHeader.transform = CGAffineTransformIdentity;
    }];
    _btn.selected = NO;
}

- (void)_addFooderView{
    
    _fooderLable = [[UILabel alloc] initWithFrame:CGRectMake(0,windowHeight- 49- FooterHeight - 64, windowWidth,FooterHeight)];
    _fooderLable.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"poster_title_home.png"]];
    
    //6.0之后 nstext
//    _fooderLable.textAlignment = UITextAlignmentCenter;
    _fooderLable.textAlignment = NSTextAlignmentCenter;
    
    _fooderLable.textColor = [UIColor whiteColor];
    
    _fooderLable.text = @"电影标题";
    
    [self addSubview:_fooderLable];
}

//*************三种方式实现headerView 和postView 的item一致******************************

//1.kvo监听模式
/**
 keyPath:监听的属性名
 object：监听的对象
 change：监听的值
 context：传递的数据
 */
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    //取得新的值
    NSNumber *value = [change objectForKey:@"new"];
    //转换为int值
    NSInteger selectIndex = [value intValue];

    //转换为滚动到的位置书
    NSIndexPath *IndexPath = [NSIndexPath indexPathForItem:selectIndex inSection:0];
    
    //如果监听的对象是headerView 并且postView的currentIndex 不等于headerViewcell选中的currentIndex那么 postView 就滚动到选中的item
    if (object == _headerColletion && _postView.currentIndex != selectIndex) {
        
        [_postView scrollToItemAtIndexPath:IndexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
        
        //操作完成后把postView的currentIndex 变成这个
        _postView.currentIndex = selectIndex;
        
    //如果监听的对象是postView 并且headerView的currentIndex 不等于postViewcell选中的currentIndex那么 postView 就滚动到选中的item
    } else if(object == _postView && _headerColletion.currentIndex != selectIndex){
        
        [_headerColletion scrollToItemAtIndexPath:IndexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
        //操作完成后把postView的currentIndex 变成这个
        _headerColletion.currentIndex = selectIndex;
    }

}

//2.代理方法实现
- (void)scrollToCurrentIndex:(NSInteger)CurrentIndex{
    
    NSIndexPath *IndexPath = [NSIndexPath indexPathForItem:CurrentIndex inSection:0];
    
    [_headerColletion scrollToItemAtIndexPath:IndexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
    
    //操作完成后把postView的currentIndex 变成这个
    _headerColletion.currentIndex = CurrentIndex;
}

@end
