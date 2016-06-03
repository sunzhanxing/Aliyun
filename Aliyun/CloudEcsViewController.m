//
//  CloudEcsViewController.m
//  Aliyun
//
//  Created by sunzhanxing on 16/5/26.
//  Copyright (c) 2016年 teilim. All rights reserved.
//

#import "CloudEcsViewController.h"

@interface CloudEcsViewController ()
@property (strong, nonatomic) UIWebView *webView;
@end

@implementation CloudEcsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setRequestWithURL];
}

/**
 *  将URL反馈到当前所创建的webView上
 */
- (void)setRequestWithURL {
    
    self.webView = [[UIWebView alloc]initWithFrame:self.view.bounds];
    self.webView.scalesPageToFit = YES;
    [self.view addSubview:self.webView];
    
    // 将URL添加到webUrl中
    NSString *url = [NSString stringWithFormat:@"https://m.aliyun.com/product/ecs"];
    NSURL *webUrl = [NSURL URLWithString:url];
    
    // 把URL告诉给服务器，从 m.aliyun.com/product/ecs 请求数据
    NSURLRequest *request = [NSURLRequest requestWithURL:webUrl];
    
    // 发送请求给服务器
    [self.webView loadRequest:request];
}

@end
