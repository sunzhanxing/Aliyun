//
//  MeetTableViewCell.m
//  Aliyun
//
//  Created by sunzhanxing on 16/5/2.
//  Copyright (c) 2016年 teilim. All rights reserved.
//

#import "MeetTableViewCell.h"
#import "MeetTableViewModel.h"
@interface MeetTableViewCell()

@property(nonatomic, strong) UIImageView *pictureImage;
@property(nonatomic, strong) UILabel *label;
@property(nonatomic, strong) UIButton *button;
@property(nonatomic, strong) UIImageView *dateImage;
@property(nonatomic, strong) UILabel *dateLabel;
@property(nonatomic, strong) UIImageView *siteImage;
@property(nonatomic, strong) UILabel *siteLabel;
@end

@implementation MeetTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        self.pictureImage = [[UIImageView alloc]init];
        [self.contentView addSubview:self.pictureImage];

        self.label = [[UILabel alloc]init];
        [self.contentView addSubview:self.label];
        
        self.button = [[UIButton alloc]init];
        [self.contentView addSubview:self.button];
        
        self.dateImage = [[UIImageView alloc]init];
        [self.contentView addSubview:self.dateImage];
        
        self.dateLabel = [[UILabel alloc]init];
        [self.contentView addSubview:self.dateLabel];
        
        self.siteImage = [[UIImageView alloc]init];
        [self.contentView addSubview:self.siteImage];
        
        self.siteLabel = [[UILabel alloc]init];
        [self.contentView addSubview:self.siteLabel];
    }
    return self;
           
}

- (void) setMeetTableViewModel:(MeetTableViewModel *)meetTableViewModel {
    
    _meetTableViewModel = meetTableViewModel;
    
    [self setupYqCellFrame];
    
    [self setupYqCellDate];
    
}
/**
 * 设置文章视图尺寸
 */
- (void) setupYqCellFrame {
    self.pictureImage.frame = CGRectMake(20, 10, Screen_Width - 40, 120);
    self.label.frame = CGRectMake(0, 60, Screen_Width, 20);
    self.button.frame = CGRectMake(140, 100, 80, 20);
    self.dateImage.frame = CGRectMake(20, 140, 15, 15);
    self.dateLabel.frame = CGRectMake(40, 140, 50, 15);
    self.siteImage.frame = CGRectMake(90, 140, 15, 15);
    self.siteLabel.frame = CGRectMake(110, 140, 200, 15);
    
}

/**
 * 设置文章视图数据
 */
- (void) setupYqCellDate {
    self.pictureImage.image = [UIImage imageNamed:self.meetTableViewModel.pictureImage];
    self.label.text = self.meetTableViewModel.label;
    self.label.textAlignment = NSTextAlignmentCenter;
    self.label.font = [UIFont systemFontOfSize:15];
    self.label.textColor = [UIColor whiteColor];
    
    [self.button setTitle:@"立即报名" forState: UIControlStateNormal];
    self.button.titleLabel.font = [UIFont systemFontOfSize:13];
    [self.button setBackgroundImage:[UIImage imageNamed:self.meetTableViewModel.button] forState:UIControlStateNormal];
    self.dateImage.image = [UIImage imageNamed:self.meetTableViewModel.dateImage];
    self.dateLabel.text = self.meetTableViewModel.dateLabel;
    self.dateLabel.font = [UIFont systemFontOfSize:12];
    self.dateLabel.textColor = [UIColor grayColor];
    self.siteImage.image = [UIImage imageNamed:self.meetTableViewModel.siteImage];
    self.siteLabel.text = self.meetTableViewModel.siteLabel;
    self.siteLabel.font = [UIFont systemFontOfSize:12];
    self.siteLabel.textColor = [UIColor grayColor];
}
@end
