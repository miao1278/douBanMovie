//
//  postCollectionViewCell.m
//  movie
//
//  Created by miao on 15-9-30.
//  Copyright (c) 2015年 miao. All rights reserved.
//

#import "postCollectionViewCell.h"
#import "UIImageView+WebCache.h"

@implementation postCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self _initViews];

    }
    return self;
}
- (void)_initViews{
    _imgView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, self.width - 20, self.height - 20)];
    
    //大图展示
    [self.contentView addSubview:_imgView];

}

//重写set方法
-(void)setModel:(HomeModel *)model{
    _model = model;

        NSString *imgStr = model.images[@"large"];
        NSURL *imgUrl = [NSURL URLWithString:imgStr];
        [_imgView sd_setImageWithURL:imgUrl placeholderImage:[UIImage imageNamed:@"pig.png"]];

}



//翻转视图
- (void)flipView{
    
}

@end
