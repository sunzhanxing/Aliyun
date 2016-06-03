//
//  YqShowViewController.m
//  Aliyun
//
//  Created by sunzhanxing on 16/5/24.
//  Copyright (c) 2016年 teilim. All rights reserved.
//

#import "YqShowViewController.h"
#import "CommunityTableViewModel.h"
#import "UILabel+StringFrame.h"
@interface YqShowViewController ()
@property (strong, nonatomic) UIScrollView *scrollView;
@property (strong, nonatomic) UILabel *titleLabel;
@property (strong, nonatomic) UIImageView *userImage;
@property (strong, nonatomic) UILabel *userLabel;
@property (strong, nonatomic) UILabel *dateLabel;
@property (strong, nonatomic) UILabel *textLabel;
@property (strong, nonatomic) UIToolbar *toolbar;
@property (strong, nonatomic) UIImageView *browseImage;
@property (strong, nonatomic) UILabel *browseLabel;
@property (strong, nonatomic) UIButton *transmitButton;

@end

@implementation YqShowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.scrollView = [[UIScrollView alloc]initWithFrame:self.view.bounds];
    self.scrollView.contentInset = UIEdgeInsetsMake(0, 0, 80, 0);
    [self.view addSubview:self.scrollView];
    
    self.titleLabel = [[UILabel alloc]init];
    [self.scrollView addSubview:self.titleLabel];
    
    self.userImage = [[UIImageView alloc]init];
    [self.scrollView addSubview:self.userImage];
    
    self.userLabel = [[UILabel alloc]init];
    [self.scrollView addSubview:self.userLabel];

    self.dateLabel = [[UILabel alloc]init];
    [self.scrollView addSubview:self.dateLabel];
    
    self.textLabel = [[UILabel alloc]init];
    [self.scrollView addSubview:self.textLabel];
    
    self.toolbar = [[UIToolbar alloc]init];
    [self.view addSubview:self.toolbar];
    
    self.browseImage = [[UIImageView alloc]init];
    [self.toolbar addSubview:self.browseImage];
    
    self.browseLabel = [[UILabel alloc]init];
    [self.toolbar addSubview:self.browseLabel];

    self.transmitButton = [[UIButton alloc]init];
    [self.toolbar addSubview:self.transmitButton];
    
    [self setupDate];
    
    [self setupFrame];
    
    [self setupScrollViewContentSize];
    
}
/**
 * 设置子控件数据
 */
- (void)setupDate {
    
    self.titleLabel.text = self.communityTableViewModel.titleLabel;
    self.titleLabel.numberOfLines = 2;
    
    self.userImage.image = [UIImage imageNamed:self.communityTableViewModel.userImage];
    self.userImage.layer.masksToBounds = YES;
    self.userImage.layer.cornerRadius = 20;
    
    self.userLabel.text = self.communityTableViewModel.userLabel;
    self.userLabel.font = [UIFont systemFontOfSize:13];
    
    self.dateLabel.text = self.communityTableViewModel.dateLabel;
    self.dateLabel.textAlignment = NSTextAlignmentRight;
    self.dateLabel.font = [UIFont systemFontOfSize:13];
    self.dateLabel.textColor = [UIColor grayColor];
    
    self.textLabel.text = self.communityTableViewModel.textLabel;
    self.textLabel.font = [UIFont systemFontOfSize:50];
    self.textLabel.numberOfLines = 0;
    
    self.toolbar.backgroundColor = [UIColor grayColor];
    
    self.browseImage.image = [UIImage imageNamed:self.communityTableViewModel.browseImage];
    
    self.browseLabel.text = self.communityTableViewModel.browseLabel;
    self.browseLabel.font = [UIFont systemFontOfSize:13];
    self.browseLabel.textColor = [UIColor grayColor];
    
    [self.transmitButton setImage:[UIImage imageNamed:self.communityTableViewModel.transmitButton] forState:UIControlStateNormal];
    [self.transmitButton setImage:[UIImage imageNamed:self.communityTableViewModel.transmitButton] forState:UIControlStateHighlighted];
}

/**
 * 设置子控件尺寸
 */
- (void)setupFrame {
    
    self.titleLabel.frame = CGRectMake(20, 10, Screen_Width - 40, 30);
    self.userImage.frame = CGRectMake(20, 50, 40, 40);
    self.userLabel.frame = CGRectMake(70, 50, 80, 50);
    self.dateLabel.frame = CGRectMake(Screen_Width - 120, 50, 100, 30);
    CGSize size = [self.textLabel boundingRectWithSize:CGSizeMake(320, 0)];
    self.textLabel.frame = CGRectMake(20, 120, Screen_Width - 40, size.height);
    self.toolbar.frame = CGRectMake(0, self.view.frame.size.height - 44, Screen_Width, 44);
    self.browseImage.frame = CGRectMake(15, 12, 20, 20);
    self.browseLabel.frame = CGRectMake(54, 0, 100, 44);
    self.transmitButton.frame = CGRectMake(Screen_Width - 40, 0, 44, 44);
}

/**
 * 设置当前ScrollView滚动的最大Y值
 */
- (void)setupScrollViewContentSize {
    
    CGRect ScrollViewContentSizeY = self.textLabel.frame;
    self.scrollView.contentSize = CGSizeMake(0, CGRectGetMaxY(ScrollViewContentSizeY));
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.pagingEnabled = YES;
    self.scrollView.bounces = NO;
}

@end
