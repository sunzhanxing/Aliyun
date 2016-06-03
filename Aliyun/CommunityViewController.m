//
//  CommunityViewController.m
//  Aliyun
//
//  Created by sunzhanxing on 16/5/19.
//  Copyright (c) 2016年 teilim. All rights reserved.
//

#import "CommunityViewController.h"
#import "CommunityTableViewCell.h"
#import "CommunityTableViewModel.h"
#import "YqShowViewController.h"
@interface CommunityViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (strong, nonatomic) UITableView *communityTabelView;
@property (strong, nonatomic) NSArray *communityArray;
@end

@implementation CommunityViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];

    [self setupTableView];
    
}

/**
 * 数据懒加载
 */
- (NSArray *)communityArray {
    
    if (_communityArray== nil) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"Community.plist" ofType:nil];
        NSArray *dictArray = [NSArray arrayWithContentsOfFile:path];
        NSMutableArray *communityMuArray = [NSMutableArray array];
        
        for (NSDictionary *dict in dictArray) {
            CommunityTableViewModel *communityModel = [CommunityTableViewModel communityWithDict:dict];
            [communityMuArray addObject:communityModel];
        }
        
        _communityArray = communityMuArray;
    }
    return _communityArray;
}

/**
 * 设置tableView
 */
- (void)setupTableView {
    self.communityTabelView = [[UITableView alloc]init];
    self.communityTabelView.frame = CGRectMake(0, 64, Screen_Width, self.view.frame.size.height);
    self.communityTabelView.contentInset = UIEdgeInsetsMake(0, 0, 110, 0);
    self.communityTabelView.delegate = self;
    self.communityTabelView.dataSource = self;
    [self.view addSubview:self.communityTabelView];
    self.communityTabelView.rowHeight = 110;
}

#pragma - mark 数据源方法

/**
 * 一共多少组
 */
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.communityArray.count;
}

/**
 * 每行cell怎样显示
 */
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {    
   
    static NSString *ID = @"communityCell";
    CommunityTableViewCell *cell = [tableView dequeueReusableHeaderFooterViewWithIdentifier:ID];

    if (cell == nil) {
        cell = [[CommunityTableViewCell  alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    cell.communityTableViewModel = self.communityArray[indexPath.row];
    
    return cell;
}

#pragma - mark 代理方法
/**
 * 点击对应的cell，进行操作
 */
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // 取消选中当前行
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    YqShowViewController *yqShowViewController = [[YqShowViewController alloc]init];
    yqShowViewController.communityTableViewModel = self.communityArray[indexPath.row];
    [self.navigationController pushViewController: yqShowViewController animated:NO];
    
}
@end
