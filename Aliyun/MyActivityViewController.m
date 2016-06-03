//
//  MyActivityViewController.m
//  Aliyun
//
//  Created by sunzhanxing on 16/5/17.
//  Copyright (c) 2016年 teilim. All rights reserved.
//

#import "MyActivityViewController.h"

@interface MyActivityViewController ()
@property(nonatomic, strong) UIImageView *imageView;
@property(nonatomic, strong) UILabel *label;
@end

@implementation MyActivityViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self setupFollowView];
}

/**
 * 设置数据
 */
- (void)setupFollowView {
    
    self.view = [[UIView alloc]initWithFrame:self.view.bounds];
    self.view.backgroundColor  = [UIColor whiteColor];
    self.imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, Screen_Width, 350)];
    self.imageView.image = [UIImage imageNamed:@"empty_hint_293x245_"];
    [self.view addSubview:self.imageView];
    self.label = [[UILabel alloc]initWithFrame:CGRectMake(0, 370, Screen_Width, 50)];
    self.label.numberOfLines = 2;
    self.label.font = [UIFont systemFontOfSize: 16];
    self.label.text = [NSString stringWithFormat:@"暂无数据"];
    self.label.textColor = [UIColor grayColor];
    self.label.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:self.label];
}

@end
