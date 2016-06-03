//
//  CloudLogoCollectionViewCell.m
//  Aliyun
//
//  Created by sunzhanxing on 16/5/14.
//  Copyright (c) 2016年 teilim. All rights reserved.
//

#import "CloudLogoCollectionViewCell.h"
#import "ConsoleLogoModel.h"
@interface CloudLogoCollectionViewCell()
@property(strong, nonatomic) UIImageView *logoImageView;
@property(strong, nonatomic) UILabel *logoLabel;
@end

@implementation CloudLogoCollectionViewCell
- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.logoImageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 0, 40, 40)];
        
        [self.contentView addSubview:self.logoImageView];
        
        self.logoLabel = [[UILabel alloc] initWithFrame:CGRectMake(-15, 45, 90, 20)];
        
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
    self.logoLabel.textColor = [UIColor grayColor];
}
@end
