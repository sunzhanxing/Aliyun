//
//  MyCellModel.m
//  Aliyun
//
//  Created by sunzhanxing on 16/4/27.
//  Copyright (c) 2016年 teilim. All rights reserved.
//

#import "MyCellModel.h"

@implementation MyCellModel

+ (instancetype)itemWithIcon:(NSString *)icon title:(NSString *)title destVcClass:(Class)destVcClass {

    MyCellModel *cellModel = [[self alloc] init];
    cellModel.cellIcon = icon;
    cellModel.cellName = title;
    cellModel.destVcClass = destVcClass;
    return cellModel;
}

@end
