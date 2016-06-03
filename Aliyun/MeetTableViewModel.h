//
//  MeetTableViewModel.h
//  Aliyun
//
//  Created by sunzhanxing on 16/5/2.
//  Copyright (c) 2016年 teilim. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MeetTableViewModel : NSObject

@property (nonatomic, copy) NSString *pictureImage;
@property (nonatomic, copy) NSString *label;
@property (nonatomic, copy) NSString *button;
@property (nonatomic, copy) NSString *dateImage;
@property (nonatomic, copy) NSString *dateLabel;
@property (nonatomic, copy) NSString *siteImage;
@property (nonatomic, copy) NSString *siteLabel;

+ (instancetype)meetWithDict:(NSDictionary *)dict;
- (instancetype)initWithDict:(NSDictionary *)dict;
@end
