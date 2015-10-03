

//
//  myButton.m
//  movie
//
//  Created by miao on 15-10-1.
//  Copyright (c) 2015年 miao. All rights reserved.
//

#import "myButton.h"

@implementation myButton

-(instancetype)initWithFrame:(CGRect)frame withImageName:(NSString *)imgName withTitle:(NSString *)title{
    
    self = [super initWithFrame:frame];
    if (self) {
    
    //创建imgView
    UIImage *img = [UIImage imageNamed:imgName];
    _imgView = [[UIImageView alloc] initWithImage:img];
    //注意：不能打开
    //    _imgView.userInteractionEnabled = YES;
    _imgView.contentMode = UIViewContentModeScaleAspectFit;
    _imgView.frame = CGRectMake(20, 5, CGRectGetWidth(self.frame)-40, CGRectGetHeight(self.frame)-5-15);
    [self addSubview:_imgView];
    
    //创建label
    _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetHeight(self.frame)-15, CGRectGetWidth(self.frame), 15)];
    _titleLabel.textAlignment = NSTextAlignmentCenter;
    _titleLabel.text = title;
    _titleLabel.font = [UIFont systemFontOfSize:12];
    _titleLabel.textColor = [UIColor whiteColor];
    [self addSubview:_titleLabel];
    }
    return self;
    
}

@end
