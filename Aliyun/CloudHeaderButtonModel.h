//
//  CloudHeaderButtonModel.h
//  Aliyun
//
//  Created by sunzhanxing on 16/4/26.
//  Copyright (c) 2016年 teilim. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CloudHeaderButtonModel : NSObject

@property(nonatomic, copy) NSString *buttonName;
@property(nonatomic, copy) NSString *buttonIcon;

+ (instancetype)buttonWithDict:(NSDictionary *)dict;
- (instancetype)initWithDict:(NSDictionary *)dict;

@end
