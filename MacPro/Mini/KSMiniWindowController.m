//
//  KSMiniWindowController.m
//  MacPro
//
//  Created by xiaruzhen on 2017/6/7.
//  Copyright © 2017年 xiaruzhen. All rights reserved.
//

#import "KSMiniWindowController.h"
#import "KSMiniViewController.h"

@interface KSMiniWindowController ()
@property (nonatomic,strong) KSMiniViewController *miniVc;
@end

@implementation KSMiniWindowController

#pragma mark - windowVC与vc建立关系
+ (instancetype)windowController{
    KSMiniWindowController *loginWC = [[KSMiniWindowController alloc]initWithWindowNibName:@"KSMiniWindowController"];
    // 设置动画样式
    [loginWC.window setAnimationBehavior:NSWindowAnimationBehaviorDocumentWindow];
    loginWC.window.contentView = loginWC.miniVc.view;
    return loginWC;
}


- (void)windowDidLoad {
    [super windowDidLoad];
    self.window.title = @"";
    //window bar透明
    self.window.titlebarAppearsTransparent = YES;
    //隐藏bar时，可被拖拽
    self.window.movableByWindowBackground = YES;
     NSApplication *app=[NSApplication sharedApplication];
    [self.window center];
    [[self.window standardWindowButton:NSWindowZoomButton] setHidden:YES];
    [[self.window standardWindowButton:NSWindowMiniaturizeButton] setHidden:YES];
    NSLog(@"keyWindow %@",app.keyWindow);
    NSLog(@"mainWindow %@",app.mainWindow);
    // 设置背景色为白色
    self.window.contentView.wantsLayer = YES;
    self.window.contentView.layer.backgroundColor = [NSColor whiteColor].CGColor;
    
}



- (KSMiniViewController *)miniVc
{
    if (!_miniVc) {
        _miniVc= [KSMiniViewController miniViewController];
    }
    return _miniVc;
}

@end
