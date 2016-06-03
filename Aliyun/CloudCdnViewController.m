//
//  CloudCdnViewController.m
//  Aliyun
//
//  Created by sunzhanxing on 16/5/26.
//  Copyright (c) 2016年 teilim. All rights reserved.
//

#import "CloudCdnViewController.h"

@interface CloudCdnViewController ()
@property (strong, nonatomic) UIWebView *webView;
@end

@implementation CloudCdnViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setRequestWithURL];
}

- (void)setRequestWithURL {
    
    self.webView = [[UIWebView alloc]initWithFrame:self.view.bounds];
    self.webView.scalesPageToFit = YES;
    [self.view addSubview:self.webView];
    
    NSString *url = [NSString stringWithFormat:@"https://m.aliyun.com/product/cdn"];
    NSURL *webUrl = [NSURL URLWithString:url];
    NSURLRequest *request = [NSURLRequest requestWithURL:webUrl];
    [self.webView loadRequest:request];
}

@end
