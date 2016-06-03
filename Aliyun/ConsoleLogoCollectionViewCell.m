//
//  ConsoleLogoCollectionViewCell.m
//  Aliyun
//
//  Created by sunzhanxing on 16/5/10.
//  Copyright (c) 2016年 teilim. All rights reserved.
//

#import "ConsoleLogoCollectionViewCell.h"
#import "ConsoleLogoModel.h"

@interface ConsoleLogoCollectionViewCell()
@property(strong, nonatomic) UIImageView *logoImageView;
@property(strong, nonatomic) UILabel *logoLabel;
@end

@implementation ConsoleLogoCollectionViewCell

- (id)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        self.logoImageView = [[UIImageView alloc] initWithFrame:CGRectMake(20, 0, 40, 40)];
        [self.contentView addSubview:self.logoImageView];
        self.logoLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 45, 80, 30)];
        [self.contentView addSubview:self.logoLabel];
    }
    return self;
}

- (void)setConsoleLogoModel:(ConsoleLogoModel *)consoleLogoModel {
    
    _consoleLogoModel = consoleLogoModel;
    
    self.logoImageView.image = [UIImage imageNamed:self.consoleLogoModel.logoIcon];
    
    self.logoLabel.text = self.consoleLogoModel.logoName;
    self.logoLabel.font = [UIFont systemFontOfSize:11];
    self.logoLabel.textAlignment = NSTextAlignmentCenter;
    self.logoLabel.numberOfLines = 2;
    self.logoLabel.textColor = [UIColor grayColor];
}
@end
