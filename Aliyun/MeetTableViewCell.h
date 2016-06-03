//
//  MeetTableViewCell.h
//  Aliyun
//
//  Created by sunzhanxing on 16/5/2.
//  Copyright (c) 2016年 teilim. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MeetTableViewModel;
@interface MeetTableViewCell : UITableViewCell
@property(strong, nonatomic) MeetTableViewModel *meetTableViewModel;

@end
