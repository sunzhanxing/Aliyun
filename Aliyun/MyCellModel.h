//
//  MyCellModel.h
//  Aliyun
//
//  Created by sunzhanxing on 16/4/27.
//  Copyright (c) 2016年 teilim. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyCellModel : NSObject

@property (nonatomic, copy) NSString *cellIcon;
@property (nonatomic, copy) NSString *cellName;
@property (nonatomic, assign) Class destVcClass;

+ (instancetype)itemWithIcon:(NSString *)icon title:(NSString *)title destVcClass:(Class)destVcClass;

+ (instancetype)itemWithTitle:(NSString *)title;

@end
