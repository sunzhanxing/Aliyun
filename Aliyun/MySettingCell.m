//
//  YqSettingCell.m
//  Aliyun
//
//  Created by sunzhanxing on 16/5/9.
//  Copyright (c) 2016年 teilim. All rights reserved.
//

#import "MySettingCell.h"
#import "MyCellModel.h"
#import "MessageSetViewController.h"
#import "MySwitchItem.h"
@interface MySettingCell()

@end

@implementation MySettingCell

- (void)setMyCellModel:(MyCellModel *)myCellModel {
    
    _myCellModel = myCellModel;
    
    self.imageView.image = [UIImage imageNamed:self.myCellModel.cellIcon];
    
    self.textLabel.text = self.myCellModel.cellName;
    
    [self setupRightContent];
}

+ (instancetype)cellWithTableView:(UITableView *)tableView {
    
    static NSString *ID = @"setting";
    MySettingCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[MySettingCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
        cell.textLabel.font = [UIFont systemFontOfSize:14];
    }
    return cell;
}

- (UISwitch *)switchView {
    if (_switchView == nil) {
        _switchView = [[UISwitch alloc] init];
    }
    return _switchView;
}

- (void)setupRightContent {
    
    if([self.myCellModel isKindOfClass:[MySwitchItem class]]) {
        self.accessoryView = self.switchView;
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    } else {
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
}
@end
