//
//  MeetTableViewModel.m
//  Aliyun
//
//  Created by sunzhanxing on 16/5/2.
//  Copyright (c) 2016年 teilim. All rights reserved.
//

#import "MeetTableViewModel.h"

@implementation MeetTableViewModel

+ (instancetype)meetWithDict:(NSDictionary *)dict {
    return [[self alloc]initWithDict:dict];
}

- (instancetype)initWithDict:(NSDictionary *)dict {
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}
@end
