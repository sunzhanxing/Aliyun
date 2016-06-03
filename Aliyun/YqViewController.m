//
//  YqViewController.m
//  Aliyun
//
//  Created by sunzhanxing on 16/4/26.
//  Copyright (c) 2016年 teilim. All rights reserved.
//

#import "YqViewController.h"
#import "MeetTableViewModel.h"
#import "MeetTableViewCell.h"
#import "MeetViewController.h"
#import "CommunityViewController.h"
#import "MyDateViewController.h"
#import "WebViewController.h"

@interface YqViewController()

@property (strong, nonatomic) MeetViewController *meetViewController;
@property (strong, nonatomic) CommunityViewController *communityViewController;
@property (strong, nonatomic) UISegmentedControl *segmentedControl;
@property (strong, nonatomic) NSArray *yqGroupArray;
@end

@implementation YqViewController

- (void)viewDidLoad{
    
    [super viewDidLoad];
    
    // 告诉控制器不在最上面添加64的高度
    self.automaticallyAdjustsScrollViewInsets = NO;

    [self setupSegmentedControl];
    // 默认点击第一个
    [self doSometingInSegment:0];
}

/**
 * 设置 SegmentedControl
 */
- (void)setupSegmentedControl {
    
    NSArray *segamentedArray = [NSArray arrayWithObjects:@"云栖大会",@"云栖社区",nil];
    self.segmentedControl = [[UISegmentedControl alloc]initWithItems:segamentedArray];
    self.segmentedControl.frame = CGRectMake(0, 0, 100, 30);
    self.segmentedControl.selectedSegmentIndex = 0;
    self.segmentedControl.tintColor = [UIColor whiteColor];
    [self.navigationItem setTitleView:self.segmentedControl];
    [self.segmentedControl addTarget:self action:@selector(doSometingInSegment:) forControlEvents:UIControlEventValueChanged];
}
/**
 * 设置 SegmentedControl 对应的内容
 */
- (void)doSometingInSegment:(UISegmentedControl *)seg {
    NSInteger index = seg.selectedSegmentIndex;
    if (index == 0) {
        if (self.meetViewController == nil) {
            self.meetViewController = [[MeetViewController alloc] init];
            [self addChildViewController:self.meetViewController];
        }
        [self.communityViewController.view removeFromSuperview];
        [self.view addSubview: self.meetViewController.view];
    } else {
        if (self.communityViewController == nil) {
            self.communityViewController = [[CommunityViewController alloc]init];
            [self addChildViewController:self.communityViewController];
        }
        [self.meetViewController.view removeFromSuperview];
        [self.view addSubview: self.communityViewController.view];
    }
}

- (void)tagClick {
    
    NSLog(@"-------");
}

@end
