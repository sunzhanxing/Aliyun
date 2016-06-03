//
//  RdsViewController.m
//  Aliyun
//
//  Created by sunzhanxing on 16/5/16.
//  Copyright (c) 2016年 teilim. All rights reserved.
//

#import "RdsViewController.h"


@implementation RdsViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
}

- (void)setRequestWithURL {
    
    self.webView = [[UIWebView alloc]initWithFrame:self.view.bounds];
    self.webView.scalesPageToFit = YES;
    [self.view addSubview:self.webView];
    
    NSString *url = [NSString stringWithFormat:@"https://m.aliyun.com/product/rds"];
    NSURL *webUrl = [NSURL URLWithString:url];
    NSURLRequest *request = [NSURLRequest requestWithURL:webUrl];
    [self.webView loadRequest:request];
}


@end
