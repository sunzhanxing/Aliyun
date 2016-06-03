//
//  CloudShowViewController.m
//  Aliyun
//
//  Created by sunzhanxing on 16/4/26.
//  Copyright (c) 2016年 teilim. All rights reserved.
//

#import "CloudShowViewController.h"
#import "CloudTableViewModel.h"
#import "CloudCellFrameModel.h"
#import "UILabel+StringFrame.h"
@interface CloudShowViewController()
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

@implementation CloudShowViewController

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
 *  设置所有UI空间的数据
 */
- (void)setupDate {
    
    self.titleLabel.text = self.cloudCellFrameModel.tableViewModel.cloudTitle;
    self.titleLabel.numberOfLines = 2;
    
    self.userImage.image = [UIImage imageNamed:self.cloudCellFrameModel.tableViewModel.cloudUserImage];
    self.userImage.layer.masksToBounds = YES;
    self.userImage.layer.cornerRadius = 20;
    
    self.userLabel.text = self.cloudCellFrameModel.tableViewModel.cloudUser;
    self.userLabel.font = [UIFont systemFontOfSize:13];
    
    self.dateLabel.text = self.cloudCellFrameModel.tableViewModel.dateLabel;
    self.dateLabel.textAlignment = NSTextAlignmentRight;
    self.dateLabel.font = [UIFont systemFontOfSize:13];
    self.dateLabel.textColor = [UIColor grayColor];
    
    self.textLabel.text = self.cloudCellFrameModel.tableViewModel.cloudMessage;
    self.textLabel.font = [UIFont systemFontOfSize:50];
    self.textLabel.numberOfLines = 0;
    
    self.toolbar.backgroundColor = [UIColor grayColor];
    
    self.browseImage.image = [UIImage imageNamed:self.cloudCellFrameModel.tableViewModel.browseImage];
    
    self.browseLabel.text = self.cloudCellFrameModel.tableViewModel.browseLabel;
    self.browseLabel.font = [UIFont systemFontOfSize:13];
    self.browseLabel.textColor = [UIColor grayColor];
    
    [self.transmitButton setImage:[UIImage imageNamed:self.cloudCellFrameModel.tableViewModel.transmitButton] forState:UIControlStateNormal];
    [self.transmitButton setImage:[UIImage imageNamed:self.cloudCellFrameModel.tableViewModel.transmitButton] forState:UIControlStateHighlighted];
}

/**
 *  设置所有UI空间的尺寸
 */
- (void)setupFrame {
    self.titleLabel.frame = CGRectMake(20, 10, Screen_Width - 40, 60);
    self.userImage.frame = CGRectMake(20, CGRectGetMaxY(self.titleLabel.frame), 40, 40);
    self.userLabel.frame = CGRectMake(70, CGRectGetMaxY(self.titleLabel.frame), 100, 40);
    self.dateLabel.frame = CGRectMake(Screen_Width - 120, 50, 100, 30);
    CGSize size = [self.textLabel boundingRectWithSize:CGSizeMake(320, 0)];
    self.textLabel.frame = CGRectMake(20, 120, Screen_Width - 40, size.height);
    self.toolbar.frame = CGRectMake(0, self.view.frame.size.height - 44, Screen_Width, 44);
    self.browseImage.frame = CGRectMake(15, 12, 20, 20);
    self.browseLabel.frame = CGRectMake(54, 0, 100, 44);
    self.transmitButton.frame = CGRectMake(Screen_Width - 40, 0, 44, 44);
}
/**
 *  设置 ScrollViewContent 可滚动的最大Y值
 */
- (void)setupScrollViewContentSize {
    CGRect ScrollViewContentSizeY = self.textLabel.frame;
    self.scrollView.contentSize = CGSizeMake(0, CGRectGetMaxY(ScrollViewContentSizeY));
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.pagingEnabled = YES;
    self.scrollView.bounces = NO;
}@end
