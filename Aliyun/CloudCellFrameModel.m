//
//  CloudCellFrameModel.m
//  Aliyun
//
//  Created by sunzhanxing on 16/5/6.
//  Copyright (c) 2016年 teilim. All rights reserved.
//

#import "CloudCellFrameModel.h"
#import "CloudTableViewModel.h"
@implementation CloudCellFrameModel

- (void)setTableViewModel:(CloudTableViewModel *)tableViewModel {
    
    _tableViewModel = tableViewModel;
    
    // 设置文章顶部空白View Frame
    CGFloat cloudBlankViewHeight = 10;
    _blankFrame = CGRectMake(0,0, Screen_Width, cloudBlankViewHeight);
    
    if (self.tableViewModel.cloudImage) {
        // 设置文章配图View Frame
        CGFloat cloudImageViewY = 10;
        CGFloat cloudImageViewHeight = 180;
        _pictureFrame = CGRectMake(0, cloudImageViewY, Screen_Width,cloudImageViewHeight);
        
        // 设置文章标题View Frame
        CGFloat cloudTitleViewX = 20;
        CGFloat cloudTitleViewY = cloudImageViewY + cloudImageViewHeight + 10;
        CGFloat cloudTitleViewHeight = 40;
        _titleFrame = CGRectMake(cloudTitleViewX, cloudTitleViewY,Screen_Width - 40, cloudTitleViewHeight);
        
        // 设置文章描述View
        CGFloat cloudMessageViewX = cloudTitleViewX;
        CGFloat cloudMessageViewY = cloudTitleViewY + cloudTitleViewHeight;
        CGFloat cloudMessageViewHeight = 60;
        self.messageFrame = CGRectMake(cloudMessageViewX, cloudMessageViewY,Screen_Width - 40, cloudMessageViewHeight);
        _cellHeight = 310;

    } else {
        
        // 设置文章标题View Frame
        CGFloat cloudTitleViewX = 20;
        CGFloat cloudTitleViewY = 10;
        CGFloat cloudTitleViewHeight = 40;
        _titleFrame = CGRectMake(cloudTitleViewX, cloudTitleViewY,Screen_Width - 40, cloudTitleViewHeight);
        
        // 设置文章描述View
        CGFloat cloudMessageViewX = cloudTitleViewX;
        CGFloat cloudMessageViewY = cloudTitleViewY + cloudTitleViewHeight;
        CGFloat cloudMessageViewHeight = 60;
        _messageFrame = CGRectMake(cloudMessageViewX, cloudMessageViewY,Screen_Width - 40, cloudMessageViewHeight);
        _cellHeight = 120;
    }
}
@end
