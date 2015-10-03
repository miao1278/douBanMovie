//
//  headerViewCell.h
//  movie
//
//  Created by miao on 15-10-2.
//  Copyright (c) 2015年 miao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeModel.h"

@interface headerViewCell : UICollectionViewCell
{
    UIImageView *_imgView;
}

@property (nonatomic,strong)HomeModel *model;

@end
