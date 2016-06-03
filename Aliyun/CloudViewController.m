//
//  CloudViewController.m
//  Aliyun
//
//  Created by sunzhanxing on 16/4/26.
//  Copyright (c) 2016年 teilim. All rights reserved.
//

#import "CloudViewController.h"
#import "CloudTableViewCell.h"
#import "CloudHeaderView.h"
#import "CloudTableViewModel.h"
#import "CloudCellFrameModel.h"
#import "CloudShowViewController.h"
#import "CloudDomainViewController.h"
#import "CloudEcsViewController.h"
#import "CloudOssViewController.h"
#import "CloudRdsViewController.h"
#import "CloudDnsViewController.h"
#import "CloudCdnViewController.h"
#import "CloudSlbViewController.h"
#import "CloudOcsViewController.h"

@interface CloudViewController() <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) UITableView *cloudTableView; // tableView控制器
@property (strong, nonatomic) NSArray *cloudModelArray; // 存放Plist数据的数组
@property (strong, nonatomic) CloudHeaderView *headerView;
@end

@implementation CloudViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self setupTableView];
}
/**
 *  创建tableView，并将当前控制器设置成 tableHeaderView 代理
 */
- (void)setupTableView {
    self.cloudTableView = [[UITableView alloc]init];
    self.cloudTableView.frame = self.view.bounds;
    self.cloudTableView.dataSource = self;
    self.cloudTableView.delegate = self;
    [self.view addSubview:self.cloudTableView];
    
    self.headerView = [[CloudHeaderView alloc]initWithFrame:CGRectMake(0, 0, Screen_Width, 305)];
    self.headerView.delegate = self;
    self.cloudTableView.tableHeaderView = self.headerView;
}

/**
 *  数据的懒加载
 */
- (NSArray *)cloudModelArray {
    if (_cloudModelArray == nil) {
        // 获得plist的全路径
        NSString *path = [[NSBundle mainBundle] pathForResource:@"cloudModel.plist" ofType:nil];
        
        // 加载数组
        NSArray *dictArray = [NSArray arrayWithContentsOfFile:path];
        
        // 将dictArray里面的所有字典转成模型对象,放到新的数组中
        NSMutableArray *cloudModelMuArray = [NSMutableArray array];
        
        for (NSDictionary *dict in dictArray) {
            // 创建模型对象
            CloudTableViewModel *cloudModel = [CloudTableViewModel cloudWithDict:dict];
            CloudCellFrameModel *cloudCellFrameModel = [[CloudCellFrameModel alloc] init];
            cloudCellFrameModel.tableViewModel = cloudModel;
            
            // 添加模型对象到数组中
            [cloudModelMuArray addObject:cloudCellFrameModel];
        }
        // 赋值
        _cloudModelArray = cloudModelMuArray;
    }
    return _cloudModelArray;
}

#pragma mark - 实现数据源方法
/**
 *  一共有多少行数据
 */
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.cloudModelArray.count;
}

/**
 *  每一行显示怎样的cell
 */
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // 通过一个标识去缓存池中寻找可循环利用的cell
    static NSString *ID = @"cloudCell";
    CloudTableViewCell  *cloudTableCell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    // 如果没有可循环利用的cell就创建
    if (cloudTableCell == nil) {
        cloudTableCell = [[CloudTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    
    // 设置cell的数据
    cloudTableCell.cloudCellFrameModel = self.cloudModelArray[indexPath.row];
    
    // 返回当前cell
    return cloudTableCell;
}

/**
 *  返回对应Cell的高度
 */
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
  
    CloudCellFrameModel *cloudCellFrameModel = self.cloudModelArray[indexPath.row];
    return cloudCellFrameModel.cellHeight;
}

#pragma mark - 实现代理方法
/**
 *  向控制器传递对应Cell的数据
 */
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // 取消选中当前的cell
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    // 创建控制器，将对应的数据传递
    CloudShowViewController *cloudShowViewController = [[CloudShowViewController alloc]init];
    cloudShowViewController.cloudCellFrameModel = self.cloudModelArray[indexPath.row];
    [self.navigationController pushViewController: cloudShowViewController animated:NO];
}

#pragma mark - HeaderViewDelegate
/**
 * 实现 HeaderViewDelegate 代理方法
 */
- (void)categoryView:(CloudHeaderView *)categoryView didButtonClick:(UIButton *)button {
    switch (button.tag) {
        case 0: {
            CloudDomainViewController *domainVC = [[CloudDomainViewController alloc] init];
            [self.navigationController pushViewController:domainVC animated:NO];
            break;
        }
        case 1: {
            CloudEcsViewController *ecsVC = [[CloudEcsViewController alloc] init];
            [self.navigationController pushViewController:ecsVC animated:NO];
            break;
        }
        case 2: {
            CloudRdsViewController *rdsVc = [[CloudRdsViewController alloc]init];
            [self.navigationController pushViewController:rdsVc animated:NO];
            break;
        }
        case 3: {
            CloudOssViewController *ossVC = [[CloudOssViewController alloc] init];
            [self.navigationController pushViewController:ossVC animated:NO];
            break;
        }
        case 4: {
            CloudSlbViewController *slbVC = [[CloudSlbViewController alloc] init];
            [self.navigationController pushViewController:slbVC animated:NO];
            break;
        }
        case 5: {
            CloudCdnViewController *cdnVC = [[CloudCdnViewController alloc] init];
            [self.navigationController pushViewController:cdnVC animated:NO];
            break;
        }
        case 6: {
            CloudDnsViewController *dnsVC = [[CloudDnsViewController alloc] init];
            [self.navigationController pushViewController:dnsVC animated:NO];
            break;
        }
            
        default: {
            CloudOcsViewController *ocsVC = [[CloudOcsViewController alloc] init];
            [self.navigationController pushViewController:ocsVC animated:NO];
            break;
        }
    }
}

@end
