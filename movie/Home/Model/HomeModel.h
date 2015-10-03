//
//  HomeModel.h
//  movie
//
//  Created by miao on 15-9-27.
//  Copyright (c) 2015年 miao. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface HomeModel :NSObject

@property(nonatomic, strong)NSDictionary *rating;   //评分
@property(nonatomic, copy)NSString *title;  //电影的标题
@property(nonatomic, copy)NSString *original_title; //原标题
@property(nonatomic, copy)NSString *year;   //上映年份
@property(nonatomic, strong)NSDictionary *images;   //电影图片


@end
