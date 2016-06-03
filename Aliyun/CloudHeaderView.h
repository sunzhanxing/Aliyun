//
//  CloudHeaderView.h
//  Aliyun
//
//  Created by sunzhanxing on 16/4/26.
//  Copyright (c) 2016年 teilim. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CloudHeaderButtonModel;
@class CloudHeaderView;

@protocol CloudHeaderViewDelegate <NSObject>

- (void)categoryView:(CloudHeaderView *)categoryView didButtonClick:(UIButton *)button;

@end

@interface CloudHeaderView : UIView
@property(strong, nonatomic) CloudHeaderButtonModel *cloudHeaderButtonModel;
@property (nonatomic, weak) id<CloudHeaderViewDelegate> delegate;
@end
