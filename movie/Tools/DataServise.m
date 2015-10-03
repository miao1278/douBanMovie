//
//  DataServise.m
//  movie
//
//  Created by miao on 15-9-27.
//  Copyright (c) 2015年 miao. All rights reserved.
//

#import "DataServise.h"

@implementation DataServise

+(id)requestDataFile:(NSString *)FileNmae{
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:FileNmae ofType:nil];
    
    NSData *data = [NSData dataWithContentsOfFile:filePath];
    
    id result = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    
    return result;
}

@end
