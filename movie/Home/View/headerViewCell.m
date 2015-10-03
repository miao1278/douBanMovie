//
//  headerViewCell.m
//  movie
//
//  Created by miao on 15-10-2.
//  Copyright (c) 2015年 miao. All rights reserved.
//

#import "headerViewCell.h"
#import "UIImageView+WebCache.h"

@implementation headerViewCell

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        _imgView = [[UIImageView alloc] init];
        _imgView.frame = CGRectMake(5, 5, self.width - 10, self.height -10);
        [self.contentView addSubview:_imgView];
    }
    return self;
}

- (void)setModel:(HomeModel *)model{
    _model = model;
    
    
    NSString *urlStr = model.images[@"small"];
    [_imgView sd_setImageWithURL:[NSURL URLWithString:urlStr] placeholderImage:[UIImage imageNamed:@"pig.png"]];
}

@end
