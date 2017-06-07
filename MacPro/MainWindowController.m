//
//  MainWindowController.m
//  MacPro
//
//  Created by xiaruzhen on 2017/6/6.
//  Copyright © 2017年 xiaruzhen. All rights reserved.
//

#import "MainWindowController.h"
#import "NewsWindowController.h"
#import "KSLoginWindowController.h"
#import "KSLoginViewController.h"
#import "AppDelegate.h"
#import "KSLoginVC.h"
#import "KSMiniWindowController.h"

@interface MainWindowController ()
@property (weak) IBOutlet NSButton *pushButton;

@property (nonatomic,strong) NewsWindowController *newsWindow;
@property (nonatomic,strong) KSMiniWindowController *miniWindow;
@property (weak) IBOutlet NSView *miniButton;

@end

@implementation MainWindowController

- (void)windowDidLoad {
    [super windowDidLoad];
//    self.pushButton.wantsLayer = _miniWindow;
    
}

#pragma mark - 跳转方法目前发现3种
//登录
- (IBAction)swew:(id)sender {
    //在 Mac OS X 裡頭，我們則是要讓 NSWindow 決定他上面的哪個元件應該變成 First Responder
    [self.newsWindow.window makeFirstResponder:nil];
    
    //[self.window addChildWindow:self.newsWindow.window ordered:NSWindowAbove];
}

//mini模式
- (IBAction)miniaction:(id)sender {
    
    // 3.设为KeyWindow并前置
    [self.miniWindow.window makeKeyAndOrderFront:self];
    
    // 4.关闭现在的登录窗口
    [self.window orderOut:self];
    /*
    [self.miniWindow showWindow:nil];
    //与上面一样
    //[self showWindow:self.miniWindow];
    //[self.newsWindow.window orderFront:nil];
    //设定层级
    [self.miniWindow.window setLevel:1];
     */
}


#pragma mark - windowVC懒加载
- (KSMiniWindowController *)miniWindow
{
    if (!_miniWindow) {
        _miniWindow= [KSMiniWindowController windowController];
    }
    return _miniWindow;
}

- (NewsWindowController *)newsWindow
{
    if (!_newsWindow) {
        _newsWindow= [NewsWindowController windowController];
    }
    return _newsWindow;
}
@end
