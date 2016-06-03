//
//  CommunityTableViewModel.m
//  Aliyun
//
//  Created by sunzhanxing on 16/5/22.
//  Copyright (c) 2016年 teilim. All rights reserved.
//

#import "CommunityTableViewModel.h"

@implementation CommunityTableViewModel

+ (instancetype)communityWithDict:(NSDictionary *)dict {
    return [[self alloc]initWithDict:dict];
}

- (instancetype)initWithDict:(NSDictionary *)dict {
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}
@end
