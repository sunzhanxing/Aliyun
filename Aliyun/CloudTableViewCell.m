//
//  CloudTableViewCell.m
//  Aliyun
//
//  Created by sunzhanxing on 16/4/26.
//  Copyright (c) 2016年 teilim. All rights reserved.
//

#import "CloudTableViewCell.h"
#import "CloudTableViewModel.h"
#import "CloudCellFrameModel.h"

@interface CloudTableViewCell()

@property (strong, nonatomic) UIImageView *cloudImageView;
@property (strong, nonatomic) UILabel *cloudTitleView;
@property (strong, nonatomic) UILabel *cloudMessageView;
@property (strong, nonatomic) UIView *cloudBlankView; 

@end

@implementation CloudTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // 文章顶部空白View
        self.cloudBlankView = [[UIView alloc] init];
        [self.contentView addSubview:self.cloudBlankView];
        
        // 文章配图View
        self.cloudImageView = [[UIImageView alloc] init];
        [self.contentView addSubview:self.cloudImageView];
        
        // 文章标题View
        self.cloudTitleView = [[UILabel alloc] init];
        [self.contentView addSubview:self.cloudTitleView];
        
        // 文章描述View
        self.cloudMessageView = [[UILabel alloc] init];
        [self.contentView addSubview:self.cloudMessageView];
    }
    return self;
}


- (void)setCloudCellFrameModel:(CloudCellFrameModel *)cloudCellFrameModel {
    
    _cloudCellFrameModel = cloudCellFrameModel;
    
    [self setupCloudCellDate];
    
    [self setupCloudCellFrame];
}

/**
 * 设置文章视图尺寸
 */
- (void)setupCloudCellFrame {
    
    self.cloudBlankView.frame = self.cloudCellFrameModel.blankFrame;
    // 配图
    if (self.cloudCellFrameModel.tableViewModel.cloudImage) {// 有配图
        self.cloudImageView.frame = self.cloudCellFrameModel.pictureFrame;
    }
    // 标题
    self.cloudTitleView.frame = self.cloudCellFrameModel.titleFrame;
    // 正文
    self.cloudMessageView.frame = self.cloudCellFrameModel.messageFrame;
}

/**
 * 设置文章视图数据
 */
- (void)setupCloudCellDate {

    self.cloudBlankView.backgroundColor = ColorWithRGB(242, 242, 242);
    
    if (self.cloudCellFrameModel.tableViewModel.cloudImage) { // 有配图
        self.cloudImageView.hidden = NO;
        self.cloudImageView.image = [UIImage imageNamed:self.cloudCellFrameModel.tableViewModel.cloudImage];
    } else { // 没有配图
        self.cloudImageView.hidden = YES;
    }
    
    self.cloudTitleView.text = self.cloudCellFrameModel.tableViewModel.cloudTitle;
    self.cloudTitleView.font = [UIFont systemFontOfSize:14];
    self.cloudTitleView.textColor = [UIColor blackColor];
    self.cloudTitleView.numberOfLines = 2;
    self.cloudMessageView.text = self.cloudCellFrameModel.tableViewModel.cloudMessage;
    self.cloudMessageView.font = [UIFont systemFontOfSize:14];
    self.cloudMessageView.textColor = [UIColor grayColor];
    self.cloudMessageView.numberOfLines = 3;

}

@end
