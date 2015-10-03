//
//  tableView.h
//  movie
//
//  Created by miao on 15-9-26.
//  Copyright (c) 2015年 miao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface tableView : UITableView<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong)NSMutableArray *data;

@end
