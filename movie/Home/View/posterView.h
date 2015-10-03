//
//  posterView.h
//  movie
//
//  Created by miao on 15-9-30.
//  Copyright (c) 2015年 miao. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^scrllWithCurrentIndex)(NSInteger);
//监听滚动协议
@protocol posterColletionViewDelegate <NSObject>

//定义一个方法当代理滚动的时候传递过来这个滚动到的视图
- (void)scrollToCurrentIndex:(NSInteger)CurrentIndex;

@end

@interface posterView : UICollectionView<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (nonatomic,strong)NSArray *data;
@property (nonatomic,assign)CGFloat pageWidth;//页面宽度
@property (nonatomic,assign)NSInteger currentIndex;//记录当前的cell

@property (nonatomic,weak) id<posterColletionViewDelegate>scrolldelegate;

@end
