//
//  CloudOssViewController.m
//  Aliyun
//
//  Created by sunzhanxing on 16/5/26.
//  Copyright (c) 2016年 teilim. All rights reserved.
//

#import "CloudOssViewController.h"

@interface CloudOssViewController ()
@property (nonatomic, strong) UIWebView *webView;
@end

@implementation CloudOssViewController

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
    
    NSString *url = [NSString stringWithFormat:@"https://m.aliyun.com/product/oss"];
    NSURL *webUrl = [NSURL URLWithString:url];
    NSURLRequest *request = [NSURLRequest requestWithURL:webUrl];
    [self.webView loadRequest:request];
}

@end
