//
//  CommunityTableViewModel.h
//  Aliyun
//
//  Created by sunzhanxing on 16/5/22.
//  Copyright (c) 2016年 teilim. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CommunityTableViewModel : NSObject
@property (nonatomic, copy) NSString *titleLabel;
@property (nonatomic, copy) NSString *textLabel;
@property (nonatomic, copy) NSString *userLabel;
@property (nonatomic, copy) NSString *userImage;
@property (nonatomic, copy) NSString *browseImage;
@property (nonatomic, copy) NSString *browseLabel;
@property (nonatomic, copy) NSString *dateLabel;
@property (nonatomic, copy) NSString *transmitButton;

+ (instancetype)communityWithDict:(NSDictionary *)dict;
- (instancetype)initWithDict:(NSDictionary *)dict;
@end
