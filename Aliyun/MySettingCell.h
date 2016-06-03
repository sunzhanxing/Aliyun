//
//  MySettingCell.h
//  Aliyun
//
//  Created by sunzhanxing on 16/5/9.
//  Copyright (c) 2016年 teilim. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MyCellModel;

@interface MySettingCell : UITableViewCell
@property(nonatomic, strong) MyCellModel *myCellModel;
@property(nonatomic, strong) UISwitch *switchView;
+ (instancetype)cellWithTableView:(UITableView *)tableView;
@end
