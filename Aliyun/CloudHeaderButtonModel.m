//
//  CloudHeaderButtonModel.m
//  Aliyun
//
//  Created by sunzhanxing on 16/4/26.
//  Copyright (c) 2016年 teilim. All rights reserved.
//

#import "CloudHeaderButtonModel.h"

@implementation CloudHeaderButtonModel

+ (instancetype)buttonWithDict:(NSDictionary *)dict {
   
    return [[self alloc] initWithDict:dict];
}

- (instancetype)initWithDict:(NSDictionary *)dict {
    
    if (self = [super init]) {
        
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

@end
