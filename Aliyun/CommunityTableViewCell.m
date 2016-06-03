//
//  CommunityTableViewCell.m
//  Aliyun
//
//  Created by sunzhanxing on 16/5/22.
//  Copyright (c) 2016年 teilim. All rights reserved.
//

#import "CommunityTableViewCell.h"
#import "CommunityTableViewModel.h"

@interface CommunityTableViewCell()
@property (nonatomic, strong) UILabel *title;
@property (nonatomic, strong) UILabel *text;
@property (nonatomic, strong) UILabel *user;
@property (nonatomic, strong) UILabel *browse;
@end

@implementation CommunityTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        self.title = [[UILabel alloc]init];
        [self.contentView addSubview:self.title];
        
        self.text = [[UILabel alloc]init];
        [self.contentView addSubview:self.text];
        
        self.user = [[UILabel alloc]init];
        [self.contentView addSubview:self.user];
        
        self.browse = [[UILabel alloc]init];
        [self.contentView addSubview:self.browse];
        
    }
    return self;
    
}

- (void) setCommunityTableViewModel:(CommunityTableViewModel *)communityTableViewModel {
    
    _communityTableViewModel = communityTableViewModel;
    
    [self setupYqCellFrame];

    [self setupYqCellDate];
    
}

/**
 * 设置文章视图尺寸
 */
- (void) setupYqCellFrame {
    self.title.frame = CGRectMake(20, 20, Screen_Width - 40, 20);
    self.text.frame = CGRectMake(20, 30, Screen_Width - 40, 60);
    self.user.frame = CGRectMake(20, 80, 100, 20);
    self.browse.frame = CGRectMake(Screen_Width - 120, 80, 100, 20);
}

/**
 * 设置文章视图数据
 */
- (void) setupYqCellDate {
    self.title.text = self.communityTableViewModel.titleLabel;
    self.title.font = [UIFont systemFontOfSize:14];
    self.text.text = self.communityTableViewModel.textLabel;
    self.text.numberOfLines = 2;
    self.text.font = [UIFont systemFontOfSize:13];
    self.text.textColor = [UIColor grayColor];
    self.user.text = self.communityTableViewModel.userLabel;
    self.user.font = [UIFont systemFontOfSize:12];
    self.user.textColor = [UIColor grayColor];
    self.browse.text = self.communityTableViewModel.browseLabel;
    self.browse.font = [UIFont systemFontOfSize:12];
    self.browse.textColor = [UIColor grayColor];
    self.browse.textAlignment = NSTextAlignmentRight;
}

@end
