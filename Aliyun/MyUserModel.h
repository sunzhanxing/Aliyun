//
//  MyUserModel.h
//  Aliyun
//
//  Created by sunzhanxing on 16/5/31.
//  Copyright (c) 2016年 teilim. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyUserModel : NSObject
@property (nonatomic, copy) NSString *userImage;
@property (nonatomic, copy) NSString *userLabel;

+ (instancetype) userWithDict:(NSDictionary *)dict;
- (instancetype) initWithDict:(NSDictionary *)dict;
@end
