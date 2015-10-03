//
//  homeTableViewCell.m
//  movie
//
//  Created by miao on 15-9-30.
//  Copyright (c) 2015年 miao. All rights reserved.
//

#import "homeTableViewCell.h"
#import "UIImageView+WebCache.h"


@implementation homeTableViewCell


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self _initViews];
    }
    return self;
}
//初始化子控件
-  (void)_initViews{
    self.backgroundColor = [UIColor clearColor];

    //创建imgView
    _imageView = [[UIImageView alloc] initWithFrame:CGRectZero];
    [self.contentView addSubview:_imageView];
    
    //美化视图
    _imageView.layer.borderWidth = 1;
    _imageView.layer.borderColor = [UIColor darkGrayColor].CGColor;
    _imageView.layer.cornerRadius = 5;
    //截取超出的视图
    _imageView.layer.masksToBounds = YES;
    
    
    //设置字体颜色
    self.textLabel.textColor = [UIColor orangeColor];
    self.textLabel.font = [UIFont boldSystemFontOfSize:20];
    
    self.detailTextLabel.textColor = [UIColor lightGrayColor];
    self.detailTextLabel.font = [UIFont systemFontOfSize:14];
    
    //设置赋值图标
    self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    //初始化星星视图
    _starView = [[starView alloc] initWithFrame:CGRectZero];
    [self.contentView addSubview:_starView];
    
}

//初始化自视图的frame
-(void)layoutSubviews{
    [super layoutSubviews];
    
    _imageView.frame = CGRectMake(5, 10, 70, self.frame.size.height-20);
    _imageView.backgroundColor  = [UIColor grayColor];
    self.textLabel.frame = CGRectMake(_imageView.right + 5, _imageView.top, 200, 40);
    self.detailTextLabel.frame = CGRectMake(self.textLabel.left, self.height-30-5, 200, 30);
    
    //星星视图的位置
    _starView.frame = CGRectMake(self.textLabel.left, self.textLabel.bottom + 10, 0, 25);
    _starView.score = self.model.rating[@"average"];
    
    self.textLabel.text = _model.title;
    self.detailTextLabel.text = [NSString stringWithFormat:@"年份：%@",_model.year];
    
    //显示电影的图片
    NSString *imgString = _model.images[@"small"];

    NSURL *url = [NSURL URLWithString:imgString];
    [_imageView sd_setImageWithURL:url];
    
    
}

//数据传递
-(void)setModel:(HomeModel *)model{
    _model = model;
}

@end
