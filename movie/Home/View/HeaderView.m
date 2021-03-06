//
//  HeaderView.m
//  movie
//
//  Created by miao on 15-10-2.
//  Copyright (c) 2015年 miao. All rights reserved.
//

#import "HeaderView.h"

@implementation HeaderView
static NSString *iden = @"header_cell";

-(instancetype)initWithFrame:(CGRect)frame{
    //设置布局
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    //滚动方向
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    //间隙
    layout.minimumLineSpacing = 0;
    
    self = [super initWithFrame:frame collectionViewLayout:layout];
    if (self) {
        self.delegate = self;
        self.dataSource = self;
        
        _currentIndex = 0;
        
        //设置滚动减速方式
        self.decelerationRate = UIScrollViewDecelerationRateFast;
        
        //注册单元格
        [self registerClass:[headerViewCell class] forCellWithReuseIdentifier:iden];
    }
    return self;
}
#pragma collectionViewDelegate
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return _data.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    headerViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:iden forIndexPath:indexPath];
    
    cell.model = _data[indexPath.item];
    
    return cell;
}

//设置单元格大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    CGSize size = CGSizeMake(_pageWidth, self.height);
    return size;
}

//视图第一张和最后一张停靠的位置
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    
    CGFloat edgeLR = (windowWidth - _pageWidth)/2.0;
    UIEdgeInsets edgeInsets = UIEdgeInsetsMake(0, edgeLR, 0, edgeLR);
    
    return edgeInsets;
}

//使视图居中显示collectionView继承于scrollView调用它的代理方法 知道他的偏移量是多少
- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset{
    //因为offset不是对象不能用点访问
    CGFloat contentX = targetContentOffset->x;
    
    /*round：如果参数是小数，则求本身的四舍五入。
     ceil：如果参数是小数，则求最小的整数但不小于本身.
     floor：如果参数是小数，则求最大的整数但不大于本身.
     
     Example:如何值是3.4的话，则
     3.4 -- round 3.000000
     -- ceil 4.000000
     -- floor 3.00000
     **/
    
    //用四色五入 计算第几页
    float pageFloat = contentX/_pageWidth;
    
    NSInteger page = (int)round(pageFloat);
    
    targetContentOffset->x = page * _pageWidth;
    
    //记录当前页面 这个值必须要用系统生成的setter语句来赋值才能kvo监听 _currentIndex = page是不能够监听到的
    self.currentIndex = page;
    
}

//单元格点击事件处理
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
        //滚到点击的cell
        [collectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
        
        //记录当前的cell  这个值必须要用系统生成的setter语句来赋值才能kvo监听 _currentIndex = page是不能够监听到的
        self.currentIndex = indexPath.item;
}

@end
