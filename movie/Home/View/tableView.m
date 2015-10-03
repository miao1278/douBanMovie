//
//  tableView.m
//  movie
//
//  Created by miao on 15-9-26.
//  Copyright (c) 2015年 miao. All rights reserved.
//

#import "tableView.h"
#import "HomeModel.h"
#import "MJExtension.h"
#import "homeTableViewCell.h"


@implementation tableView


//添加table
- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style{
    self = [super initWithFrame:frame style:style];
    if (self) {
        [self _initViews];
    }
    return self;
}


- (void)_initViews{
    self.delegate = self;
    self.dataSource = self;
}



#pragma mark TableViewDelegete
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _data.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *ID = @"homeTableViewCell";
    
    homeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[homeTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    
    HomeModel *model = _data[indexPath.row];
    cell.model = model;
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath  {
    return 120;
}

@end
