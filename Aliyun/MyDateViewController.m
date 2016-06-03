//
//  MyDateViewController.m
//  Aliyun
//
//  Created by sunzhanxing on 16/5/9.
//  Copyright (c) 2016年 teilim. All rights reserved.
//

#import "MyDateViewController.h"
#import "MyCellModel.h"
#import "WebViewController.h"
#import "MyViewController.h"
#import "MySettingGroup.h"
#import "MySettingViewController.h"
#import "MyActivityViewController.h"
#import "MyHeaderView.h"
@interface MyDateViewController()<MyHeaderViewDelegate>
@property(strong, nonatomic) MyHeaderView *myHeaderView;
@end

@implementation MyDateViewController
- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self setupHeaderView];

    [self setupGroup0];
    [self setupGroup1];
    [self setupGroup2];
    [self setupGroup3];
    [self setupGroup4];

}

/**
 * 设置headerView
 */
- (void)setupHeaderView {
    
    self.myHeaderView = [[MyHeaderView alloc]initWithFrame:CGRectMake(0, 0, Screen_Width, 120)];
    
    self.myHeaderView.backgroundColor = ColorWithRGB(43, 112, 245);
    
    self.myHeaderView.delegate = self;
    
    self.myTableView.tableHeaderView = self.myHeaderView;
    
}

/**
 * 设置第0组数据
 */
- (void)setupGroup0 {
    
    MyCellModel *myActivity = [MyCellModel itemWithIcon:@"my_activity_22x22_" title:@"我的活动" destVcClass:[MyActivityViewController class]];
    
    MySettingGroup *mySettingGroup = [[MySettingGroup alloc] init];
    mySettingGroup.items = @[myActivity];
    [self.myCellArray addObject:mySettingGroup];
    
}

/**
 * 设置第1组数据
 */
- (void)setupGroup1 {
    
    MyCellModel *monthComsumption = [MyCellModel itemWithIcon:@"month_comsumption_22x22_" title:@"当月消费" destVcClass:[MyActivityViewController class]];
    
    MyCellModel *remainingSum = [MyCellModel itemWithIcon:@"remaining_sum_22x22_" title:@"账户余额" destVcClass:[MyActivityViewController class]];
    
    MySettingGroup *mySettingGroup = [[MySettingGroup alloc] init];
    mySettingGroup.items = @[monthComsumption, remainingSum];
    [self.myCellArray addObject:mySettingGroup];
}

/**
 * 设置第2组数据
 */
- (void)setupGroup2 {
    
    MyCellModel *invitationCode = [MyCellModel itemWithIcon:@"invitation_code_22x22_" title:@"我的推荐码" destVcClass:[MyActivityViewController class]];
    
    MyCellModel *cupon = [MyCellModel itemWithIcon:@"cupon_22x22_" title:@"代金券" destVcClass:[MyActivityViewController class]];
    
    MySettingGroup *mySettingGroup = [[MySettingGroup alloc] init];
    mySettingGroup.items = @[invitationCode, cupon];
    [self.myCellArray addObject:mySettingGroup];
}

/**
 * 设置第3组数据
 */
- (void)setupGroup3 {
    
    MyCellModel *setting = [MyCellModel itemWithIcon:@"setting_22x22_" title:@"设置" destVcClass:[MySettingViewController class]];
    
    MySettingGroup *mySettingGroup = [[MySettingGroup alloc] init];
    mySettingGroup.items = @[setting];
    [self.myCellArray addObject:mySettingGroup];
}

/**
 * 设置第4组数据
 */
- (void)setupGroup4 {
    
    MyCellModel *scan = [MyCellModel itemWithIcon:@"scan_22x22_" title:@"扫一扫" destVcClass:[WebViewController class]];
    
    MySettingGroup *mySettingGroup = [[MySettingGroup alloc] init];
    mySettingGroup.items = @[scan];
    [self.myCellArray addObject:mySettingGroup];
    
}

@end
