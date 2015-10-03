//
//  starView.m
//  movie
//
//  Created by miao on 15-9-30.
//  Copyright (c) 2015年 miao. All rights reserved.
//

#import "starView.h"

@implementation starView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self _initView];
    }
    return self;
}
- (void)_initView{
    

    //创建灰色星星视图
    _grayView = [[UIView alloc] initWithFrame:CGRectZero];
    
    //设置背景颜色
    _grayView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"gray@2x.png"]];
    [self addSubview:_grayView];

    //创建黄色星星视图
    _yellowView = [[UIView alloc] initWithFrame:CGRectZero];

    //设置背景颜色
    _yellowView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"yellow@2x.png"]];
    [self addSubview:_yellowView];
    
    //创建label
    _scoreLable = [[UILabel alloc] initWithFrame:CGRectZero];
    _scoreLable.textColor = [UIColor whiteColor];
    _scoreLable.font = [UIFont systemFontOfSize:15];
    [self addSubview:_scoreLable];
}

-(void)setScore:(NSNumber *)score{
    _score = score;
    //使视图调用layoutSub方法
    [self setNeedsLayout];
}

-(void)layoutSubviews{
    [super layoutSubviews];
    //布局
    _grayView.frame = CGRectMake(0, 0, 5*self.height, self.height);
    _yellowView.frame = _grayView.frame;
    _scoreLable.frame = CGRectMake(_grayView.right+5, _grayView.top, 30, 20);

    
    UIImage *grayImg = [UIImage imageNamed:@"gray@2x.png"];
    UIImage *yellowImg = [UIImage imageNamed:@"yellow@2x.png"];
    
    //可能星星视图比较大，让他们缩放一下
    //   缩放之后的/缩放之前的 = 缩放比
    //X：5*self.height/5*grayImg.宽度
    //Y：self.height/grayImg.高度
    _grayView.transform = CGAffineTransformMakeScale(self.height/grayImg.size.width, self.height/grayImg.size.height);
    _yellowView.transform = CGAffineTransformMakeScale(self.height/yellowImg.size.width, self.height/yellowImg.size.height);
    
    //r让黄色星星按比例显示
    CGFloat value = [_score floatValue];
    
    _yellowView.frame= CGRectMake(0, 0, 5 * self.height * value/10 , self.height);
    
    //右边标题
    _scoreLable.text = [NSString stringWithFormat:@"%.1f",value];
    
}

//星星视图的宽度是星星视图的高度乘以五加30 +5
-(void)setFrame:(CGRect)frame{
    CGFloat height = frame.size.height;
    frame.size.width = height * 5 + 30 + 5;
    [super setFrame:frame];
}

@end
