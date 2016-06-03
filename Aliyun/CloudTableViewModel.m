//
//  CloudTableViewModel.m
//  Aliyun
//
//  Created by sunzhanxing on 16/4/26.
//  Copyright (c) 2016年 teilim. All rights reserved.
//

#import "CloudTableViewModel.h"

@implementation CloudTableViewModel

+ (instancetype)cloudWithDict:(NSDictionary *)dict {
    
    return [[self alloc]initWithDict:dict];
}

- (instancetype)initWithDict:(NSDictionary *)dict {
    
    if (self = [super init]) {
        
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

@end
