//
//  MyViewController.h
//  Aliyun
//
//  Created by sunzhanxing on 16/4/26.
//  Copyright (c) 2016年 teilim. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyHeaderView.h"

@interface MyViewController : UIViewController <UITableViewDataSource,
                                        UITableViewDelegate,UIScrollViewDelegate>
/**
 *  需要添加的tableView
 */
@property(strong, nonatomic) UITableView *myTableView;
/**
 *  存储对应的组模型
 */
@property(strong, nonatomic) NSMutableArray *myCellArray;
/**
 *  开关
 */
@property (nonatomic, strong) UISwitch *switchView;
@end
