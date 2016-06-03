//
//  WebViewController.m
//  Aliyun
//
//  Created by sunzhanxing on 16/5/16.
//  Copyright (c) 2016年 teilim. All rights reserved.
//

#import "WebViewController.h"

@implementation WebViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self setSegmentedControl];
    
    [self setupFollowView];
    
    [self setupExampleView];

}
/**
 * 设置SegmentedControl分页
 */
- (void)setSegmentedControl {
    
    NSArray *segamentedArray = [NSArray arrayWithObjects:@"实例列表",@"我的关注",nil];
    self.segmentedControl = [[UISegmentedControl alloc]initWithItems:segamentedArray];
    self.segmentedControl.frame = CGRectMake(0, 0, 100, 30);
    self.segmentedControl.selectedSegmentIndex = 0;
    self.segmentedControl.tintColor = [UIColor whiteColor];
    [self.navigationItem setTitleView:self.segmentedControl];
    [self.segmentedControl addTarget:self action:@selector(doSometingInSegment:) forControlEvents:UIControlEventValueChanged];
}

/**
 * 设置“实例列表”View内容
 */
- (void)setupExampleView {
    
    self.exampleView = [[UIView alloc]initWithFrame:self.view.bounds];
    self.exampleView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.exampleView];
    self.imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, Screen_Width, 350)];
    self.imageView.image = [UIImage imageNamed:@"empty_hint_293x245_"];
    [self.exampleView addSubview:self.imageView];
    
    self.exampleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 370, Screen_Width, 50)];
    self.exampleLabel.numberOfLines = 2;
    self.exampleLabel.font = [UIFont systemFontOfSize: 16];
    self.exampleLabel.text = [NSString stringWithFormat:@"您竟然还没有实例？\n 引领全球云计算的产品，请笑纳！"];
    self.exampleLabel.textColor = [UIColor grayColor];
    self.exampleLabel.textAlignment = NSTextAlignmentCenter;
    [self.exampleView addSubview:self.exampleLabel];
    
    self.exampleButton = [[UIButton alloc]initWithFrame:CGRectMake(Screen_Width * 0.4 - 10, 440, 100, 40)];
    [self.exampleButton setTitle:[NSString stringWithFormat:@"了解产品特性"]forState:UIControlStateNormal];
    [self.exampleButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    self.exampleButton.titleLabel.font = [UIFont systemFontOfSize:14];
    self.exampleButton.titleLabel.textAlignment = NSTextAlignmentLeft;
    [self.exampleButton setBackgroundImage:[UIImage imageNamed:@"loginVerifyCodeBG_258x46_"] forState:UIControlStateNormal];
    [self.exampleButton setBackgroundImage:[UIImage imageNamed:@"loginVerifyCodeBG_258x46_"] forState:UIControlStateHighlighted];
    [self.exampleView addSubview:self.exampleButton];
    [self.exampleButton addTarget:self action:@selector(setRequestWithURL) forControlEvents:UIControlEventTouchUpInside];
    
}

/**
 * 设置“我的关注”View内容
 */
- (void)setupFollowView {
    
    self.followView = [[UIView alloc]initWithFrame:self.view.bounds];
    self.followView.backgroundColor  = [UIColor whiteColor];
    [self.view addSubview:self.followView];
    
    self.imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, Screen_Width, 350)];
    self.imageView.image = [UIImage imageNamed:@"empty_hint_293x245_"];
    [self.followView addSubview:self.imageView];
    
    self.followLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 370, Screen_Width, 50)];
    self.followLabel.numberOfLines = 2;
    self.followLabel.font = [UIFont systemFontOfSize: 16];
    self.followLabel.text = [NSString stringWithFormat:@"添加需重点关注的12张监控 \n 同一监控项最多支持4台实例对比哦"];
    self.followLabel.textColor = [UIColor grayColor];
    self.followLabel.textAlignment = NSTextAlignmentCenter;
    [self.followView addSubview:self.followLabel];
}
/**
 * 点击 SegmentedControl 显示对应的View
 */
- (void)doSometingInSegment:(UISegmentedControl *)seg {
    NSInteger index = seg.selectedSegmentIndex;
    if (index == 0) {
        [self.view addSubview:self.exampleView];
        [self.followView removeFromSuperview];
    } else {
        [self.view addSubview:self.followView];
        [self.exampleView removeFromSuperview];
    }
}

/**
 *  将URL反馈到当前所创建的webView上
 */
- (void)setRequestWithURL {
    
    self.webView = [[UIWebView alloc]initWithFrame:self.view.bounds];
    self.webView.scalesPageToFit = YES;
    [self.view addSubview:self.webView];
    
    NSString *url = [NSString stringWithFormat:@"https://m.aliyun.com"];
    NSURL *webUrl = [NSURL URLWithString:url];
    NSURLRequest *request = [NSURLRequest requestWithURL:webUrl];
    [self.webView loadRequest:request];
}

@end
