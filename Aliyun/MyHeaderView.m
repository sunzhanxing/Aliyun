//
//  MyHeaderView.m
//  Aliyun
//
//  Created by sunzhanxing on 16/5/31.
//  Copyright (c) 2016年 teilim. All rights reserved.
//

#import "MyHeaderView.h"
#import "MyUserModel.h"
@interface MyHeaderView()
@property (strong, nonatomic) UIImageView *imageview;
@property (strong, nonatomic) UILabel *hiLabel;
@property (strong, nonatomic) UILabel *userNameLabel;
@property (strong, nonatomic) UIButton *button;
@end

@implementation MyHeaderView

- (instancetype)initWithFrame:(CGRect)frame {
    
    if(self = [super initWithFrame:frame]){
        self.imageview = [[UIImageView alloc]init];
        [self addSubview:self.imageview];
        
        self.button = [[UIButton alloc]init];
        [self addSubview:self.button];
        
    }
    return self;
}

- (void)layoutSubviews {
    
    [super layoutSubviews];
    
    [self setupHeaderView];
}

- (void)setupHeaderView {
    
    self.imageview.frame = CGRectMake(self.frame.size.width * 0.4 + 5, 10, 70, 70);
    self.imageview.image = [UIImage imageNamed:@"user_01"];
    self.imageview.layer.masksToBounds = YES;
    self.imageview.layer.cornerRadius = 20;
    
    self.button.frame = CGRectMake(150, CGRectGetMaxY(self.imageview.frame) + 5, 80, 30);
    [self.button setTitle:@"立即登陆" forState:UIControlStateNormal];
    [self.button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.button setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    self.button.titleLabel.font = [UIFont systemFontOfSize:14];
    [self.button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    
}
- (void)buttonClick:(UIButton *)button {
    if ([self.delegate respondsToSelector:@selector(categoryView:)]) {
        [self.delegate categoryView:self];
    }
}
@end
