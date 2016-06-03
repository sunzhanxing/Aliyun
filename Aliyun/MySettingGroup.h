//
//  MySettingGroup.h
//  Aliyun
//
//  Created by sunzhanxing on 16/5/9.
//  Copyright (c) 2016年 teilim. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MySettingGroup : NSObject
/**
 *  头部标题
 */
@property (nonatomic, copy) NSString *header;
/**
 *  尾部标题
 */
@property (nonatomic, copy) NSString *footer;
/**
 *  存放着这组所有行的模型数据
 */
@property (nonatomic, strong) NSArray *items;

@end
