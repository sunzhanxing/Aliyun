//
//  MyLoginViewController.m
//  Aliyun
//
//  Created by sunzhanxing on 16/5/31.
//  Copyright (c) 2016年 teilim. All rights reserved.
//

#import "MyLoginViewController.h"
#import "MyDateViewController.h"
#import "CloudViewController.h"
@interface MyLoginViewController ()
@property (strong, nonatomic) UILabel *titleLabel;
@property (strong, nonatomic) UITextField *userField;
@property (strong, nonatomic) UILabel *userLabel;
@property (strong, nonatomic) UITextField *pswField;
@property (strong, nonatomic) UILabel *psdLabel;
@property (strong, nonatomic) UIButton *logoButton;
@property (strong, nonatomic) UIButton *signInButton;

@end

@implementation MyLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = ColorWithRGB(235, 235, 241);
    
    [self setupNavTitleView];
    
    [self setupUserView];
    
    [self setupPsdView];
    
    [self setupButtonView];
}


- (void)setupNavTitleView {
    self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 40)];
    self.navigationItem.titleView = self.titleLabel;
    self.titleLabel.text = @"主页";
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.titleLabel.font = [UIFont systemFontOfSize:16];
    self.titleLabel.textColor = [UIColor whiteColor];
}

- (void)setupUserView {
    self.userLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 84, 80, 40)];
    self.userLabel.text = @" 账户";
    self.userLabel.backgroundColor = [UIColor whiteColor];
    self.userLabel.textColor = [UIColor blackColor];
    self.userLabel.font = [UIFont systemFontOfSize:14];
    [self.view addSubview: self.userLabel];
    
    self.userField = [[UITextField alloc]initWithFrame:CGRectMake(80, 84, Screen_Width - 40, 40)];
    self.userField.backgroundColor = [UIColor whiteColor];
    self.userField.textColor = [UIColor blackColor];
    self.userField.font = [UIFont systemFontOfSize:14];
    [self.view addSubview: self.userField];
}

- (void)setupPsdView {
    self.psdLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 124, 80, 40)];
    self.psdLabel.text = @" 登陆密码";
    self.psdLabel.backgroundColor = [UIColor whiteColor];
    self.psdLabel.textColor = [UIColor blackColor];
    self.psdLabel.font = [UIFont systemFontOfSize:14];
    [self.view addSubview: self.psdLabel];
    
    self.pswField = [[UITextField alloc]initWithFrame:CGRectMake(80, 124, Screen_Width - 40, 40)];
    self.pswField.backgroundColor = [UIColor whiteColor];
    self.pswField.textColor = [UIColor blackColor];
    self.pswField.secureTextEntry = YES;
    self.pswField.font = [UIFont systemFontOfSize:14];
    [self.view addSubview: self.pswField];
}

- (void)setupButtonView {
    self.logoButton = [[UIButton alloc]initWithFrame:CGRectMake(10, 194, Screen_Width - 20, 40)];
    [self.logoButton setBackgroundImage:[UIImage imageNamed:@"UMS_account_login"]  forState:UIControlStateNormal];
    [self.logoButton setBackgroundImage:[UIImage imageNamed:@"UMS_account_login"]  forState:UIControlStateHighlighted];
    [self.logoButton setTitle:@"登陆" forState:UIControlStateNormal];
    self.logoButton.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.logoButton.tintColor = [UIColor blackColor];
    [self.view addSubview:self.logoButton];
    [self.logoButton addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
}

- (void)buttonClick {
    if (![self.userField.text isEqualToString:@"309016033"]) {
        // 帐号不存在
        UIAlertView *myAlertView = [[UIAlertView alloc]initWithTitle:@"温馨提醒" message:nil delegate:self cancelButtonTitle:@"账号不存在" otherButtonTitles:nil, nil];
        [myAlertView show];
        return;
    }
    if (![self.pswField.text isEqualToString:@"123456"]) {
        // 密码错误
        UIAlertView *myAlertView = [[UIAlertView alloc]initWithTitle:@"温馨提醒" message:nil delegate:self cancelButtonTitle:@"密码错误" otherButtonTitles:nil, nil];
        [myAlertView show];
        return;
    }
    for (UIViewController *temp in self.navigationController.viewControllers) {
        if ([temp isKindOfClass:[MyDateViewController class]]) {
            [self.navigationController popToViewController:temp animated:YES];
        }
    }

}
@end
