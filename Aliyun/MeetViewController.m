//
//  MeetViewController.m
//  Aliyun
//
//  Created by sunzhanxing on 16/5/19.
//  Copyright (c) 2016年 teilim. All rights reserved.
//

#import "MeetViewController.h"
#import "MeetTableViewCell.h"
#import "MeetTableViewModel.h"
#import "XiaMenViewController.h"
#import "WuHanViewController.h"
#import "NanJinViewController.h"
#import "ShenZhenViewController.h"
@interface MeetViewController () <UITableViewDataSource, UITableViewDelegate>
@property (strong, nonatomic) UITableView *meetTabelView;
@property (strong, nonatomic) UIImageView *meetImageView;
@property (strong, nonatomic) NSArray *meetArray;
@end

@implementation MeetViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self setupTableView];
    
}
/**
 * 数据懒加载
 */
- (NSArray *)meetArray {
    
    if (_meetArray== nil) {
        
        NSString *path = [[NSBundle mainBundle] pathForResource:@"meetPlist.plist" ofType:nil];
        NSArray *dictArray = [NSArray arrayWithContentsOfFile:path];
        NSMutableArray *meetMuArray = [NSMutableArray array];
        for (NSDictionary *dict in dictArray) {
           
            // 创建模型对象
            MeetTableViewModel *meetModel = [MeetTableViewModel meetWithDict:dict];
            
            // 添加模型对象到数组中
            [meetMuArray addObject:meetModel];
        }
        
        // 赋值
        _meetArray = meetMuArray;
    }
    return _meetArray;
}

/**
 * 设置tableView
 */
- (void)setupTableView {
    self.meetTabelView = [[UITableView alloc]init];
    self.meetTabelView.frame = CGRectMake(0, 64, Screen_Width, self.view.frame.size.height);
    self.meetTabelView.delegate = self;
    self.meetTabelView.dataSource = self;
    [self.view addSubview:self.meetTabelView];
    self.meetTabelView.contentInset = UIEdgeInsetsMake(0, 0, 110, 0);
    self.meetTabelView.rowHeight = 165;
    self.meetImageView = [[UIImageView alloc]init];
    self.meetImageView.frame = CGRectMake(0, 0, Screen_Width, 120);
    self.meetImageView.image = [UIImage imageNamed:@"yq_meeting_header_image.jpg"];
    self.meetTabelView.tableHeaderView = self.meetImageView;
}

#pragma - mark 数据源方法
/**
 * 一共有多少行
 */
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
   
    return self.meetArray.count;
}
/**
 * 每一行显示怎样的cell
 */
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *ID = @"meetCell";
    MeetTableViewCell *cell = [tableView dequeueReusableHeaderFooterViewWithIdentifier:ID];
    if (cell == nil) {
        cell = [[MeetTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    cell.meetTableViewModel = self.meetArray[indexPath.row];
    return cell;
}

#pragma - mark 代理方法
/**
 * 点击每行cell，跳转对应的控制器
 */
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    switch (indexPath.row) {
        case 0: {
            XiaMenViewController *xiaMenVC = [[XiaMenViewController alloc]init];
            [self.navigationController pushViewController:xiaMenVC animated:NO];
            break;
        }
        case 1: {
            WuHanViewController *wuHanVC = [[WuHanViewController alloc]init];
            [self.navigationController pushViewController:wuHanVC animated:NO];
            break;
        }
        case 2: {
            NanJinViewController *nanJinVC = [[NanJinViewController alloc]init];
            [self.navigationController pushViewController:nanJinVC animated:NO];
            break;
        }
        default: {
            ShenZhenViewController *shenZhenVC = [[ShenZhenViewController alloc]init];
            [self.navigationController pushViewController:shenZhenVC animated:NO];
            break;
        }
    }
}
@end
