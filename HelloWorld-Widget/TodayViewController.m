//
//  TodayViewController.m
//  HelloWorld-Widget
//
//  Created by 魏亮 on 2017/3/29.
//  Copyright © 2017年 魏亮. All rights reserved.
//

#import "TodayViewController.h"
#import <NotificationCenter/NotificationCenter.h>
#import "Masonry.h"

@interface TodayViewController () <NCWidgetProviding>

@end

@implementation TodayViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.extensionContext.widgetLargestAvailableDisplayMode = NCWidgetDisplayModeExpanded;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self setupFirst];
    //共享数据
    NSLog(@"%@",[[NSUserDefaults standardUserDefaults]objectForKey:@"widget"]);
}

- (void)widgetActiveDisplayModeDidChange:(NCWidgetDisplayMode)activeDisplayMode withMaximumSize:(CGSize)maxSize {
    
    if(activeDisplayMode == NCWidgetDisplayModeCompact) {
        self.preferredContentSize = CGSizeMake(0, 110);
    } else {

        self.preferredContentSize = CGSizeMake(0, 200);
    }
}
//适配iOS8 不让用偏左
- (UIEdgeInsets)widgetMarginInsetsForProposedMarginInsets:(UIEdgeInsets)defaultMarginInsets {
    return UIEdgeInsetsZero;
}

- (void)widgetPerformUpdateWithCompletionHandler:(void (^)(NCUpdateResult))completionHandler {
    // Perform any setup necessary in order to update the view.
    
    // If an error is encountered, use NCUpdateResultFailed
    // If there's no update required, use NCUpdateResultNoData
    // If there's an update, use NCUpdateResultNewData

    completionHandler(NCUpdateResultNewData);
}

- (void)setupFirst {
    UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:btn1];
    btn1.backgroundColor = [UIColor redColor];
    
    [btn1 setTitle:@"进入第二页" forState:UIControlStateNormal];
    
    [btn1 addTarget:self action:@selector(first) forControlEvents:UIControlEventTouchUpInside];
    
    [btn1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.view).offset(10);
        make.left.mas_equalTo(10);
        make.right.mas_equalTo(-10);
        make.height.mas_equalTo(90);
    }];
    UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:btn2];
    btn2.backgroundColor = [UIColor yellowColor];
    [btn2 setTitle:@"进入第三页" forState:UIControlStateNormal];
    
    [btn2 addTarget:self action:@selector(second) forControlEvents:UIControlEventTouchUpInside];

    [btn2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(btn1.mas_bottom).offset(10);
        make.left.mas_equalTo(10);
        make.right.mas_equalTo(-10);
        make.height.mas_equalTo(80);
    }];
}
- (void)first {
    [self.extensionContext openURL:[NSURL URLWithString:@"myapphahaha://first"] completionHandler:^(BOOL success) {
        NSLog(@"进入第二页");
    }];
}
- (void)second {
    [self.extensionContext openURL:[NSURL URLWithString:@"myapphahaha://second"] completionHandler:^(BOOL success) {
        NSLog(@"进入第三页");
    }];
}
@end
