//
//  ConsoleLogoModel.m
//  Aliyun
//
//  Created by sunzhanxing on 16/5/11.
//  Copyright (c) 2016年 teilim. All rights reserved.
//

#import "ConsoleLogoModel.h"

@implementation ConsoleLogoModel

+ (instancetype)itemWithIcon:(NSString *)icon title:(NSString *)title destVcClass:(Class)destVcClass {
    ConsoleLogoModel *consoleLogoModel = [[self alloc] init];
    consoleLogoModel.logoIcon = icon;
    consoleLogoModel.logoName = title;
    consoleLogoModel.destVcClass = destVcClass;
    return consoleLogoModel;
}
@end
