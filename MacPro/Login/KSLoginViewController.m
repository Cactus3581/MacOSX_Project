//
//  KSLoginViewController.m
//  MacPro
//
//  Created by xiaruzhen on 2017/6/6.
//  Copyright © 2017年 xiaruzhen. All rights reserved.
//

#import "KSLoginViewController.h"
#import "AppDelegate.h"

@interface KSLoginViewController ()
@end

@implementation KSLoginViewController

- (void)viewDidLoad{
    [super viewDidLoad];
//    [self initView];
}

#pragma mark - 初始化视图
- (void)initView{
    
    // 设置背景色为白色
    self.view.wantsLayer = YES;
    self.view.layer.backgroundColor = [NSColor whiteColor].CGColor;
    
}

#pragma mark - 点击了登录Button

#pragma mark - 关闭窗口


@end

