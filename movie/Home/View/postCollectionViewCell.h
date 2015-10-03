//
//  postCollectionViewCell.h
//  movie
//
//  Created by miao on 15-9-30.
//  Copyright (c) 2015年 miao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeModel.h"

@interface postCollectionViewCell : UICollectionViewCell
{
    UIImageView *_imgView;
}

@property (nonatomic,strong)HomeModel *model;//数据
@property (nonatomic,strong)UIImageView *imgView;

- (void)flipView;//翻转视图

@end
