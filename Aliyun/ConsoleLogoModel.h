//
//  ConsoleLogoModel.h
//  Aliyun
//
//  Created by sunzhanxing on 16/5/11.
//  Copyright (c) 2016年 teilim. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ConsoleLogoModel : NSObject

@property(nonatomic, copy) NSString *logoName;
@property(nonatomic, copy) NSString *logoIcon;
@property(nonatomic, assign) Class destVcClass;
@property(nonatomic, strong) NSArray *logoGroup;

/**
 *  封装CollectionView中的图标、名称和控制器
 */
+ (instancetype)itemWithIcon:(NSString *)icon title:(NSString *)title destVcClass:(Class)destVcClass;
@end
