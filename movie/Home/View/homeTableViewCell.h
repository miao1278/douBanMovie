//
//  homeTableViewCell.h
//  movie
//
//  Created by miao on 15-9-30.
//  Copyright (c) 2015年 miao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeModel.h"
#import "starView.h"


@interface homeTableViewCell : UITableViewCell
{
    UIImageView *_imageView;
    starView *_starView;
}

@property (nonatomic,strong)HomeModel *model;

@end
