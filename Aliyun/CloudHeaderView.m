//
//  CloudHeaderView.m
//  Aliyun
//
//  Created by sunzhanxing on 16/4/26.
//  Copyright (c) 2016年 teilim. All rights reserved.
//

#import "CloudHeaderView.h"
#import "CloudHeaderButtonModel.h"
#import "ConsoleLogoCollectionViewCell.h"
#import "ConsoleLogoModel.h"
#import "CloudLogoCollectionViewCell.h"
#import "WebViewController.h"
#import "ConsoleLogoGroup.h"
#import "CloudViewController.h"
@interface CloudHeaderView() <UIScrollViewDelegate>

@property (strong, nonatomic) UIScrollView *headerScrollView;
@property (strong, nonatomic) UIPageControl *headerPageControl;
@property (strong, nonatomic) UIView *headerSubView;
@property (strong, nonatomic) UIButton *headerButtonIcon;
@property (strong, nonatomic) UILabel *headerButtonLabel;
@property (strong, nonatomic) UICollectionView *headerCollectionView;
@property (strong, nonatomic) NSArray *buttonViewArray;
@property (strong, nonatomic) CloudViewController *cloudViewController;

@end

@implementation CloudHeaderView

- (instancetype)initWithFrame:(CGRect)frame {
    
    if(self = [super initWithFrame:frame]){
    
    // 注意：在这里初始化子控件的属性
        
        self.headerScrollView = [[UIScrollView alloc] init];
        self.headerScrollView.delegate = self;
        [self addSubview:self.headerScrollView];
        
        self.headerPageControl = [[UIPageControl alloc] init];
        [self addSubview:self.headerPageControl];
    
        self.headerSubView = [[UIView alloc] init];
        [self addSubview:self.headerSubView];
        
        self.headerButtonIcon = [[UIButton alloc] init];
        [self addSubview:self.headerButtonIcon];
        
        self.headerButtonLabel = [[UILabel alloc] init];
        [self addSubview:self.headerButtonLabel];

    }
    return self;
}
/**
 * 设置子控件的数据和尺寸
 */
- (void)layoutSubviews {
    
    [super layoutSubviews];
    
    [self setupHeaderScrollView];
    
    [self setupHeaderPageControl];
    
    [self setupButtonView];
}

- (void)setupHeaderScrollView {
    
    // 设置尺寸
    self.headerScrollView.frame = CGRectMake(0, 0, Screen_Width, 150);
    // 添加图片
    CGFloat scrollImageViewWidth = self.headerScrollView.frame.size.width;
    CGFloat scrollImageViewHeight = 200;
    
    for (int index = 0; index < ScrollViewImageCount; index++) {
        UIImageView *scrollImageView = [[UIImageView alloc] init];
        
        // 设置显示图片
        NSString *scrollImageViewName = [NSString stringWithFormat:@"cloud_tab_image_0%d", index + 1];
        scrollImageView.image = [UIImage imageNamed:scrollImageViewName];
        
        // 设置frame
        CGFloat scrollImageViewX = index * scrollImageViewWidth;
        scrollImageView.frame = CGRectMake(scrollImageViewX, 0, scrollImageViewWidth, scrollImageViewHeight);
        [self.headerScrollView  addSubview:scrollImageView];
    }
    
    // 设置滚动的内容尺寸
    self.headerScrollView.contentSize = CGSizeMake(scrollImageViewWidth * ScrollViewImageCount, 0);
    self.headerScrollView.showsHorizontalScrollIndicator = NO;
    self.headerScrollView.pagingEnabled = YES;
    self.headerScrollView.bounces = NO;
}
/**
 * 设置PageControl
 */
- (void)setupHeaderPageControl {
    
    // 设置总个数
    self.headerPageControl.numberOfPages = ScrollViewImageCount;
   
    // 设置Frame
    CGFloat centerX = _headerPageControl.frame.size.width * 0.5;
    CGFloat centerY = 140;
    self.headerPageControl.center = CGPointMake(centerX, centerY);
    self.headerPageControl.bounds = CGRectMake(0, 0, Screen_Width, 30);
    
    self.headerPageControl.userInteractionEnabled = NO;
    // 设置圆点的颜色
    self.headerPageControl.currentPageIndicatorTintColor = ColorWithRGB(212, 59, 54);
    self.headerPageControl.pageIndicatorTintColor = ColorWithRGB(255, 255, 255);
}

- (void)setupButtonView {
    
    // 按钮的尺寸
    CGFloat headerButtonWight = 60;
    CGFloat headerButtonHeight = 65;
   
    // 间隙 = (控制器view的宽度 - 2 * 应用宽度) / 4
    CGFloat marginX = (Screen_Width - ScrollViewImageCount * headerButtonWight) / (ScrollViewImageCount + 1);
    CGFloat marginY = 15;
   
    // 根据应用个数创建对应的框框
    for (int index = 0; index < self.buttonViewArray.count; index++) {
        self.headerSubView = [[UIView alloc] init];
        
        // 计算行号和列号
        int row = index / 4;
        int col = index % 4;
        CGFloat headerButtonX = marginX + col * (headerButtonWight + marginX);
        CGFloat headerButtonY = 155 + row * (headerButtonHeight + marginY);
        
        // 设置frame
        self.headerSubView.frame = CGRectMake(headerButtonX, headerButtonY, headerButtonWight, headerButtonHeight);
        [self addSubview:self.headerSubView];
        
        // 添加内部控件（按钮）
        CloudHeaderButtonModel *buttonModel = self.buttonViewArray[index];
        self.headerButtonIcon = [[UIButton alloc] init];
        CGFloat iconW = 45;
        CGFloat iconH = 45;
        CGFloat iconX = (headerButtonWight - headerButtonHeight) + 12;
        CGFloat iconY = 0;
        self.headerButtonIcon.frame = CGRectMake(iconX, iconY, iconW, iconH);
        [self.headerButtonIcon setImage:[UIImage imageNamed:buttonModel.buttonIcon] forState:UIControlStateNormal];
        [self.headerButtonIcon setImage:[UIImage imageNamed:buttonModel.buttonIcon] forState:UIControlStateHighlighted];
        [self.headerSubView addSubview:self.headerButtonIcon];
        self.headerButtonIcon.tag = index;
        [self.headerButtonIcon addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        
        // 添加内部控件（Label）
        self.headerButtonLabel = [[UILabel alloc] init];
        CGFloat nameW = headerButtonWight;
        CGFloat nameH = 20;
        CGFloat nameX = 0;
        CGFloat nameY = iconY + iconH;
        self.headerButtonLabel.frame = CGRectMake(nameX, nameY, nameW, nameH);
        self.headerButtonLabel.text = buttonModel.buttonName;
        self.headerButtonLabel.font = [UIFont systemFontOfSize:11];
        self.headerButtonLabel.textColor = [UIColor grayColor];
        self.headerButtonLabel.textAlignment = NSTextAlignmentCenter;
        [self.headerSubView addSubview:self.headerButtonLabel];

    }
}

- (void)buttonClick:(UIButton *)button {
    if ([self.delegate respondsToSelector:@selector(categoryView:didButtonClick:)]) {
        [self.delegate categoryView:self didButtonClick:button];
    }
}
/**
 * 数据懒加载
 */
- (NSArray *)buttonViewArray {
    if (_buttonViewArray == nil) {
        // 获得plist的全路径
        NSString *path = [[NSBundle mainBundle] pathForResource:@"headerButtonModel.plist" ofType:nil];
        // 加载数组
        NSArray *dictArray = [NSArray arrayWithContentsOfFile:path];
        // dictArray里面的所有字典转成模型对象,放到新的数组中
        NSMutableArray *buttonModelArray = [NSMutableArray array];
        for (NSDictionary *dict in dictArray) {
            // 创建模型对象
            CloudHeaderButtonModel *cloudHeaderButtonModel = [CloudHeaderButtonModel buttonWithDict:dict];
            // 添加模型对象到数组中
            [buttonModelArray addObject:cloudHeaderButtonModel];
        }
        
        // 赋值
        _buttonViewArray = buttonModelArray;
    }
    return _buttonViewArray;
}

#pragma mark - 代理方法
/**
 *  当scrollView正在滚动就会调用
 */
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    // 根据scrollView的滚动位置决定pageControl显示第几页
    CGFloat scrollW = scrollView.frame.size.width;
    int page = (scrollView.contentOffset.x + scrollW * 0.5) / scrollW;
    self.headerPageControl.currentPage = page;
    
}

@end