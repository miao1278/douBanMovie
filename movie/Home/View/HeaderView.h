//
//  HeaderView.h
//  movie
//
//  Created by miao on 15-10-2.
//  Copyright (c) 2015年 miao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "headerViewCell.h"
#import "HomeModel.h"

@interface HeaderView : UICollectionView<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>

@property (nonatomic,strong)NSArray *data;

@property (nonatomic,assign)CGFloat pageWidth;

@property (nonatomic,assign)CGFloat currentIndex;

@end
