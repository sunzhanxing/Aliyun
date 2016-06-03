//
//  MyViewController.m
//  Aliyun
//
//  Created by sunzhanxing on 16/4/26.
//  Copyright (c) 2016年 teilim. All rights reserved.
//

#import "MyViewController.h"
#import "MyCellModel.h"
#import "MySettingCell.h"
#import "MySettingGroup.h"
#import "MySettingViewController.h"
#import "MyHeaderView.h"
#import "MyLoginViewController.h"

@interface MyViewController()

@end

@implementation MyViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self setupTableView];
    
    [self.myTableView reloadData];
}
/**
 * 添加tableView
 */
- (void)setupTableView {
    self.myTableView = [[UITableView alloc]init];
    self.myTableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    self.myTableView.delegate = self;
    self.myTableView.dataSource = self;
    [self.view addSubview:self.myTableView];
}

/**
 *  实现代理方法，跳转控制器
 */
- (void)categoryView:(MyHeaderView *)categoryView {
    
    MyLoginViewController *myLoginVC = [[MyLoginViewController alloc] init];
    [self.navigationController pushViewController:myLoginVC animated:NO];
}

/**
 *  存储组模型
 */
- (NSArray *)myCellArray {
    if (_myCellArray == nil) {
        _myCellArray = [NSMutableArray array];
    }
    return _myCellArray;
}

#pragma mark - 实现数据源方法
/**
 * 一共有多少组
 */
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
   
    return self.myCellArray.count;
}

/**
 * 每行有多少组
 */
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    MySettingGroup *group = self.myCellArray[section];
    return group.items.count;
}

/**
 * 每行对应的cell
 */
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
   
    MySettingCell *cell = [MySettingCell cellWithTableView:tableView];
    MySettingGroup *group = self.myCellArray[indexPath.section];
    cell.myCellModel = group.items[indexPath.row];
    return cell;
}

#pragma - mark 实现代理方法
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // 取消选中这一行
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    // 传递这一行的数据模型
    MySettingGroup *group = self.myCellArray[indexPath.section];
    MyCellModel *myCellModel = group.items[indexPath.row];
    
    // 根据 myCellModel.destVcClass 判断控制器
    if(myCellModel.destVcClass != nil) {
        UIViewController *activityViewController = [[myCellModel.destVcClass alloc]init];
       
        // 根据数据模型传递标题
        activityViewController.title = myCellModel.cellName;
        
        // 跳转控制器
        [self.navigationController pushViewController:activityViewController animated:NO];
    }
}
@end
