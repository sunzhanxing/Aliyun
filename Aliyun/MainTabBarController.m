//
//  MainTabBarViewController.m
//  Aliyun
//
//  Created by sunzhanxing on 16/4/26.
//  Copyright (c) 2016年 teilim. All rights reserved.
//

#import "MainTabBarController.h"
#import "MainNavigationController.h"
#import "CloudViewController.h"
#import "ConsoleViewController.h"
#import "YqViewController.h"
#import "MyViewController.h"
#import "MyDateViewController.h"

@interface MainTabBarController ()

@end

@implementation MainTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupAllSubViewControllers];
    
    // 拿到导航栏的外观
    UINavigationBar *navBar = [UINavigationBar appearance];
    
    // 设置导航栏的颜色
    [navBar setBarTintColor: ColorWithRGB(26, 120, 244)];
    
    // 设置导航栏字体颜色
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    textAttrs[NSForegroundColorAttributeName] = [UIColor whiteColor];
    [navBar setTitleTextAttributes:textAttrs];
}

-(void)share {
    
}

/**
 * 初始化所有子控制器
 */
- (void)setupAllSubViewControllers {
    
    CloudViewController *cloudViewController = [[CloudViewController alloc]init];
    
    [self setupAllSubViewControllers:cloudViewController title:@"阿里云" imageName:@"tab_cloud_24x24_" selectedImageName:@"tab_cloud_selected_24x24_"];
    
    ConsoleViewController *consoleViewController = [[ConsoleViewController alloc]init];
    
    [self setupAllSubViewControllers:consoleViewController title:@"控制台" imageName:@"tab_console_24x24_" selectedImageName:@"tab_console_selected_24x24_"];
    
    YqViewController *yqViewController = [[YqViewController alloc]init];
    
    [self setupAllSubViewControllers:yqViewController title:@"云栖" imageName:@"tab_yq_24x24_" selectedImageName:@"tab_yq_selected_24x24_"];
    
    MyDateViewController *mySetUpViewController = [[MyDateViewController alloc]init];
    
    [self setupAllSubViewControllers:mySetUpViewController title:@"我的" imageName:@"tab_my_24x24_" selectedImageName:@"tab_my_selected_24x24_"];
    
}
/**
 * 设置所有子控制器的属性
 */
- (void)setupAllSubViewControllers:(UIViewController *)subView title:(NSString *)title imageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName {
    
    subView.title = title;
    self.tabBar.backgroundImage = [UIImage imageNamed:@"bar_background"];
    subView.tabBarItem.image = [UIImage imageNamed:imageName];
    subView.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    UIButton *tagButton = [[UIButton alloc]init];
    [tagButton setTitle:@"消息" forState:UIControlStateNormal];
    tagButton.titleLabel.font = [UIFont systemFontOfSize:16];
    tagButton.frame = CGRectMake(0, 0, 40, 40);
    [tagButton addTarget:self action:@selector(tagClick) forControlEvents:UIControlEventTouchUpInside];
    subView.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:tagButton];

    MainNavigationController *navigationController = [[MainNavigationController alloc] initWithRootViewController:subView];
    
    [self addChildViewController:navigationController];
}
- (void)tagClick {
    NSLog(@"当前没有任何消息");
}
@end
