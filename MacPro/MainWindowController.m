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
static MainWindowController *mainWC=nil;

@implementation MainWindowController
+ (instancetype)windowController{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        mainWC= [[MainWindowController alloc]initWithWindowNibName:@"MainWindowController"];
        mainWC.window.title = @"";
    });
    // 设置动画样式
    [mainWC.window setAnimationBehavior:NSWindowAnimationBehaviorDocumentWindow];
    [mainWC.window center];
    return mainWC;
}
- (void)windowDidLoad {
    [super windowDidLoad];
//    self.pushButton.wantsLayer = _miniWindow;
    self.window.backgroundColor = [NSColor whiteColor];
    
    
//    [self.window setContentBorderThickness:62.0 forEdge:NSMinYEdge];
    
//    NSShadow *shadow = [[NSShadow alloc] init];
//    [shadow setShadowColor:[NSColor colorWithDeviceWhite:0.1 alpha:0.6]];
//    [shadow setShadowOffset:NSMakeSize(0, 20)];
//    [shadow setShadowBlurRadius:20];
//    [self.pushButton setShadow:shadow];
    [self.pushButton.layer setShadowColor:[NSColor redColor].CGColor];
    [self.pushButton.layer setShadowOffset:CGSizeMake(0, 8)];
    [self.pushButton.layer setShouldRasterize:YES];
    [self.pushButton.layer setShadowRadius:8];
    [self.pushButton.layer setShadowOpacity:0.4];
    
    
    [NSEvent addGlobalMonitorForEventsMatchingMask:NSDownArrowFunctionKey handler:^(NSEvent * event) {
        NSLog(@"NSDownArrowFunctionKey");
    }];
    


    


    
}


- (void)mouseUp:(NSEvent *)event{
    [super mouseUp:event];
}

- (void)keyUp:(NSEvent *)event{
    [super keyUp:event];
}


#pragma mark - 跳转方法目前发现3种
//登录
- (IBAction)swew:(id)sender {
    //在 Mac OS X 裡頭，我們則是要讓 NSWindow 決定他上面的哪個元件應該變成 First Responder
//    [self.newsWindow.window makeFirstResponder:nil];
//    
//    //[self.window addChildWindow:self.newsWindow.window ordered:NSWindowAbove];
    
    
    // 设为KeyWindow并前置
    [self.newsWindow.window makeKeyAndOrderFront:self];
    //强引用这个Window，不然这个Window会在跳转之后的瞬间被销毁
    AppDelegate *appDelegate = (AppDelegate *)[NSApplication sharedApplication].delegate;
    appDelegate.mainWindowController = [MainWindowController windowController];
    appDelegate.openMain = YES;

}

//mini模式
- (IBAction)miniaction:(id)sender {
    
    // 设为KeyWindow并前置
    [self.miniWindow.window makeKeyAndOrderFront:self];
    //强引用这个Window，不然这个Window会在跳转之后的瞬间被销毁
    AppDelegate *appDelegate = (AppDelegate *)[NSApplication sharedApplication].delegate;
    appDelegate.mainWindowController = self.miniWindow;
    
    // 关闭现在的登录窗口
//    [self.window orderOut:self];
    
    
//    - (void)center;
//    - (void)makeKeyAndOrderFront:(nullable id)sender;
//    - (void)orderFront:(nullable id)sender;
//    - (void)orderBack:(nullable id)sender;
//    - (void)orderOut:(nullable id)sender;
//    - (void)orderWindow:(NSWindowOrderingMode)place relativeTo:(NSInteger)otherWin;
//    - (void)orderFrontRegardless;
    
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
