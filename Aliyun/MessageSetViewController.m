//
//  MessageSetViewController.m
//  Aliyun
//
//  Created by sunzhanxing on 16/5/17.
//  Copyright (c) 2016年 teilim. All rights reserved.
//

#import "MessageSetViewController.h"
#import "MyCellModel.h"
#import "MySettingGroup.h"
#import "MessageSetViewController.h"
#import "MySwitchItem.h"

@implementation MessageSetViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self setupGroup1];
}

/**
 *  设置数据
 */
- (void)setupGroup1 {
    
    MyCellModel *opinion = [MySwitchItem itemWithIcon:nil title:@"接收消息" destVcClass:nil];
    MyCellModel *update = [MySwitchItem itemWithIcon:nil title:@"防打扰（21点－8点不通知）" destVcClass:nil];

    MySettingGroup *mySettingGroup = [[MySettingGroup alloc] init];
    mySettingGroup.items = @[opinion, update];
    [self.myCellArray addObject:mySettingGroup];
    
}

@end
