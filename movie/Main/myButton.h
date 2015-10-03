//
//  myButton.h
//  movie
//
//  Created by miao on 15-10-1.
//  Copyright (c) 2015年 miao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface myButton : UIButton
{
    UIImageView *_imgView;
    UILabel *_titleLabel;
}

- (instancetype)initWithFrame:(CGRect)frame
                withImageName:(NSString *)imgName
                    withTitle:(NSString *)title;

@end
