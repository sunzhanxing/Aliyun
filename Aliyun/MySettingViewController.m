//
//  MySettingViewController.m
//  Aliyun
//
//  Created by sunzhanxing on 16/5/9.
//  Copyright (c) 2016年 teilim. All rights reserved.
//

#import "MySettingViewController.h"
#import "MyCellModel.h"
#import "MySettingGroup.h"
#import "MessageSetViewController.h"
#import "OpinionViewController.h"
#import "UpdateViewController.h"
#import "AboutViewController.h"

@implementation MySettingViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setupGroup0];
    
    [self setupGroup1];
    
    [self setupButton];
}

/**
 * 设置第0组数据
 */
- (void)setupGroup0 {
    
    MyCellModel *messageModel = [MyCellModel itemWithIcon:@"nil" title:@"消息设置" destVcClass:[MessageSetViewController class]];
    
    MySettingGroup *mySettingGroup = [[MySettingGroup alloc] init];
    mySettingGroup.items = @[messageModel];
    [self.myCellArray addObject:mySettingGroup];

}

/**
 * 设置第1组数据
 */
- (void)setupGroup1 {
    
    MyCellModel *opinion = [MyCellModel itemWithIcon:@"nil" title:@"意见反馈" destVcClass:[OpinionViewController class]];
    MyCellModel *update = [MyCellModel itemWithIcon:@"nil" title:@"检查更新" destVcClass:[UpdateViewController class]];
    MyCellModel *about = [MyCellModel itemWithIcon:@"nil" title:@"关于我们" destVcClass:[AboutViewController class]];
    
    MySettingGroup *mySettingGroup = [[MySettingGroup alloc] init];
    mySettingGroup.items = @[opinion, update, about];
    [self.myCellArray addObject:mySettingGroup];
    
}

/**
 * 设置按钮
 */
- (void)setupButton {
    
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(0, 420, Screen_Width, 40)];
    [button setTitle:[NSString stringWithFormat:@"退出当前帐户"]forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:16];
    button.titleLabel.textAlignment = NSTextAlignmentLeft;
    [button setBackgroundImage:[UIImage imageNamed:@"loginVerifyCodeBG_258x46_"] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageNamed:@"loginVerifyCodeBG_258x46_"] forState:UIControlStateHighlighted];
    [self.view addSubview:button];
    [button addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
    
}

/**
 * 按钮的点击事件
 */
- (void)buttonClick {
    UIAlertView *myAlertView = [[UIAlertView alloc]initWithTitle:@"您确定要注销么？" message:nil delegate:self cancelButtonTitle:@"确定" otherButtonTitles:@"取消", nil];
    [myAlertView show];
}
@end
