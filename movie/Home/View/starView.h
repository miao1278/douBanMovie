//
//  starView.h
//  movie
//
//  Created by miao on 15-9-30.
//  Copyright (c) 2015年 miao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface starView : UIView
{
    UIView *_grayView;
    UIView *_yellowView;
    UILabel *_scoreLable;
}

@property (nonatomic,strong)NSNumber *score;

@end
