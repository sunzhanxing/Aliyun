//
//  DnsViewController.m
//  Aliyun
//
//  Created by sunzhanxing on 16/5/16.
//  Copyright (c) 2016年 teilim. All rights reserved.
//

#import "DnsViewController.h"

@implementation DnsViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
}

/**
 *  将URL反馈到当前所创建的webView上
 */
- (void)setRequestWithURL {
    
    self.webView = [[UIWebView alloc]initWithFrame:self.view.bounds];
    self.webView.scalesPageToFit = YES;
    [self.view addSubview:self.webView];
    
    NSString *url = [NSString stringWithFormat:@"https://m.aliyun.com/product/dns/home"];
    NSURL *webUrl = [NSURL URLWithString:url];
    NSURLRequest *request = [NSURLRequest requestWithURL:webUrl];
    [self.webView loadRequest:request];
}


@end
