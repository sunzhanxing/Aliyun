//
//  ConsoleViewController.m
//  Aliyun
//
//  Created by sunzhanxing on 16/4/26.
//  Copyright (c) 2016年 teilim. All rights reserved.
//

#import "ConsoleViewController.h"
#import "ConsoleLogoModel.h"
#import "ConsoleLogoCollectionViewCell.h"
#import "ConsoleLogoGroup.h"
#import "WebViewController.h"
#import "EcsViewController.h"
#import "OssWebViewController.h"
#import "RdsViewController.h"
#import "SlbViewController.h"
#import "OcsViewController.h"
#import "CdnViewController.h"
#import "DomainViewController.h"
#import "DnsViewController.h"

@interface ConsoleViewController() <UICollectionViewDataSource, UICollectionViewDelegate>
@property(strong, nonatomic) UICollectionView *consoleCollectionView;
@end

@implementation ConsoleViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
 
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    [flowLayout setItemSize:CGSizeMake(90,90)];
    flowLayout.sectionInset = UIEdgeInsetsMake(20, 10, 0, 10);
    flowLayout.minimumLineSpacing = 20;
    self.consoleCollectionView = [[UICollectionView alloc]initWithFrame:self.view.bounds collectionViewLayout:flowLayout];
    self.consoleCollectionView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.consoleCollectionView];
    self.consoleCollectionView.delegate = self;
    self.consoleCollectionView.dataSource = self;
    [self.consoleCollectionView registerClass:[ConsoleLogoCollectionViewCell class] forCellWithReuseIdentifier:@"setting"];
    
    [self setupGroup0];
    [self setupGroup1];
}
/**
 * 存放组数据
 */
- (NSMutableArray *)items1 {
    
    if (_items1 == nil) {
        _items1 = [NSMutableArray array];
    }
    return _items1;
}

/**
 * 设置第0组数据
 */
- (void)setupGroup0 {
    
    ConsoleLogoModel *consoleAlarm = [ConsoleLogoModel itemWithIcon:@"console_alarm_40x40_" title:@"监控报警" destVcClass:[WebViewController class]];
    ConsoleLogoModel *consoleRenew = [ConsoleLogoModel itemWithIcon:@"console_renew_40x40_" title:@"急需续费" destVcClass:[WebViewController class]];
    ConsoleLogoModel *consoleTicket = [ConsoleLogoModel itemWithIcon:@"console_ticket_40x40_" title:@"工单" destVcClass:[WebViewController class]];
    
    ConsoleLogoGroup *consoleLogoGroup = [[ConsoleLogoGroup alloc]init];
    consoleLogoGroup.logoGroupArray = @[consoleAlarm, consoleRenew, consoleTicket];
    [self.items1 addObject:consoleLogoGroup];
}

/**
 * 设置第1组数据
 */
- (void)setupGroup1 {
    
    ConsoleLogoModel *ecs = [ConsoleLogoModel itemWithIcon:@"ecs_39x44_" title:@"云服务器 ECS" destVcClass:[EcsViewController class]];
    ConsoleLogoModel *oss = [ConsoleLogoModel itemWithIcon:@"oss_39x44_" title:@"对象存储 OSS" destVcClass:[OssWebViewController class]];
    ConsoleLogoModel *rds = [ConsoleLogoModel itemWithIcon:@"rds_39x44_" title:@"云数据库 RDS" destVcClass:[RdsViewController class]];
    ConsoleLogoModel *slb = [ConsoleLogoModel itemWithIcon:@"slb_39x44_" title:@"负载均衡" destVcClass:[SlbViewController class]];
    ConsoleLogoModel *ocs = [ConsoleLogoModel itemWithIcon:@"ocs_39x44_" title:@"云数据库Memcache版" destVcClass:[OcsViewController class]];
    ConsoleLogoModel *cdn = [ConsoleLogoModel itemWithIcon:@"cdn_39x44_" title:@"CDN" destVcClass:[CdnViewController class]];
    ConsoleLogoModel *domain = [ConsoleLogoModel itemWithIcon:@"domain_39x44_" title:@"域名管理" destVcClass:[DomainViewController class]];
    ConsoleLogoModel *dns = [ConsoleLogoModel itemWithIcon:@"dns_39x44_" title:@"云解析 DNS" destVcClass:[DnsViewController class]];

    ConsoleLogoGroup *consoleLogoGroup = [[ConsoleLogoGroup alloc]init];
    consoleLogoGroup.logoGroupArray = @[ecs, oss, rds, slb, ocs, cdn, domain, dns];
    [self.items1 addObject:consoleLogoGroup];
}

#pragma mark - 数据源方法
/**
 * 一共有多少组
 */
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
   
    return self.items1.count;
}
/**
 * 每组有多少行
 */
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    ConsoleLogoGroup *group = self.items1[section];
    return group.logoGroupArray.count;

}

/**
 * 每行显示怎样的cell
 */
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
     static NSString *cellIdentifier = @"setting";
    ConsoleLogoCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    ConsoleLogoGroup *consoleLogoGroup = self.items1[indexPath.section];
    cell.consoleLogoModel = consoleLogoGroup.logoGroupArray[indexPath.item];
    return cell;
}
#pragma mark - 代理方法
/**
 * 点击对应的cell，跳转对应的控制器
 */
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    ConsoleLogoGroup *consoleLogoGroup = self.items1[indexPath.section];
    ConsoleLogoModel *consoleLogoModel = consoleLogoGroup.logoGroupArray[indexPath.item];
    UIViewController *controller = [[consoleLogoModel.destVcClass alloc]init];
    [self.navigationController pushViewController:controller animated:NO];
}
@end
