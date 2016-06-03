//
//  MainNavViewController.m
//  Aliyun
//
//  Created by sunzhanxing on 16/4/26.
//  Copyright (c) 2016年 teilim. All rights reserved.
//

#import "MainNavigationController.h"

@interface MainNavigationController ()

@end

@implementation MainNavigationController

- (void)viewDidLoad {
    
    [super viewDidLoad];
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
        
    if (self.viewControllers.count > 0) {
            
        viewController.hidesBottomBarWhenPushed = YES;
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setImage:[UIImage imageNamed:@"alu_navbar_left_normal"] forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:@"alu_navbar_left_highlight"] forState:UIControlStateHighlighted];
            
        CGRect frame = button.frame;
        frame.size = CGSizeMake(70, 30);
        button.frame = frame;
            
        // 让按钮内部的所有内容左对齐
        button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        // 让按钮的内容往左边偏移10
        button.contentEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 0);
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
        [button addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
            
        // 修改导航栏左边的item
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
            
        // 隐藏tabbar
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:animated];
}

- (void)back
{
    [self popViewControllerAnimated:NO];
}
@end
