//
//  posterColletionView.h
//  movie
//
//  Created by miao on 15-9-30.
//  Copyright (c) 2015年 miao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "posterView.h"
#import "HeaderView.h"
#import "HomeModel.h"

@interface posterColletionView : UIView <posterColletionViewDelegate>
{
    posterView *_postView;//海报列表
    UIImageView *_imgHeader;//下拉collection
    UIButton *_btn;//下拉按钮
    HeaderView *_headerColletion;
    UILabel *_fooderLable;//底部标题
}

//传递数据
@property (nonatomic,strong)NSArray *data;
@property (nonatomic,weak)id<posterColletionViewDelegate>delegate;

@end
