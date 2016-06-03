//
//  CloudCellFrameModel.h
//  Aliyun
//
//  Created by sunzhanxing on 16/5/6.
//  Copyright (c) 2016年 teilim. All rights reserved.
//
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "CloudTableViewModel.h"

@interface CloudCellFrameModel : NSObject
/**
 *  空白的frame
 */
@property (nonatomic, assign) CGRect blankFrame;
/**
 *  配图的frame
 */
@property (nonatomic, assign) CGRect pictureFrame;
/**
 *  标题frame
 */
@property (nonatomic, assign) CGRect titleFrame;
/**
 *  正文的frame
 */
@property (nonatomic, assign) CGRect messageFrame;

/**
 *  cell的高度
 */
@property (nonatomic, assign,readonly) CGFloat cellHeight;

@property (nonatomic, strong) CloudTableViewModel *tableViewModel;
@end
