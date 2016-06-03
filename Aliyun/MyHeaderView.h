//
//  MyHeaderView.h
//  Aliyun
//
//  Created by sunzhanxing on 16/5/31.
//  Copyright (c) 2016年 teilim. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MyUserModel,MyHeaderView;

@protocol MyHeaderViewDelegate <NSObject>
- (void)categoryView:(MyHeaderView *)categoryView;
@end

@interface MyHeaderView : UIView
@property (nonatomic, strong) MyUserModel *myUserModel;
@property (nonatomic, weak) id<MyHeaderViewDelegate> delegate;
@end
