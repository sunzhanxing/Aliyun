//
//  CloudTableViewModel.h
//  Aliyun
//
//  Created by sunzhanxing on 16/4/26.
//  Copyright (c) 2016年 teilim. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CloudTableViewModel : NSObject

@property (nonatomic,copy) NSString *cloudImage;
@property (nonatomic,copy) NSString *cloudTitle;
@property (nonatomic,copy) NSString *cloudMessage;
@property (nonatomic, copy) NSString *cloudUser;
@property (nonatomic, copy) NSString *cloudUserImage;
@property (nonatomic, copy) NSString *browseImage;
@property (nonatomic, copy) NSString *browseLabel;
@property (nonatomic, copy) NSString *dateLabel;
@property (nonatomic, copy) NSString *transmitButton;

- (instancetype)initWithDict: (NSDictionary *)dict;
+ (instancetype)cloudWithDict: (NSDictionary *)dict;

@end
