//
//  WebViewController.h
//  Aliyun
//
//  Created by sunzhanxing on 16/5/16.
//  Copyright (c) 2016年 teilim. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WebViewController : UIViewController
@property(strong, nonatomic) UIWebView *webView;
@property(strong, nonatomic) UISegmentedControl *segmentedControl;
@property(strong, nonatomic) UIImageView *imageView;
@property(strong, nonatomic) UIView *exampleView;
@property(strong, nonatomic) UILabel *exampleLabel;
@property(strong, nonatomic) UIButton *exampleButton;
@property(strong, nonatomic) UIView *followView;
@property(strong, nonatomic) UILabel *followLabel;

- (void)setRequestWithURL;

@end
