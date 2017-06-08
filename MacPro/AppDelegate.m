//
//  AppDelegate.m
//  MacPro
//
//  Created by xiaruzhen on 2017/6/5.
//  Copyright © 2017年 xiaruzhen. All rights reserved.
//

#import "AppDelegate.h"
#import "MainWindowController.h"
#import "SBPopViewController.h"

@interface AppDelegate ()
@property (nonatomic,strong) MainWindowController *mainWindow;
@property (nonatomic ,strong) NSStatusItem *demoItem;     // 添加状态item属性
@property (nonatomic, strong) NSPopover *popover;   // 弹窗
@property (weak) IBOutlet NSMenuItem *undoButton;

@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    _mainWindow = [MainWindowController windowController];
    [[_mainWindow window] center];
    
    
    
    // 创建NSStatusItem并添加到系统状态栏上
    self.demoItem = [[NSStatusBar systemStatusBar] statusItemWithLength:NSVariableStatusItemLength];
    // 设置NSStatusItem 的图片
    NSImage *image = [NSImage imageNamed:@"bb"];
    [self.demoItem.button setImage: image];
    
    // 创建popover，并设置
    _popover = [[NSPopover alloc]init];
    _popover.behavior = NSPopoverBehaviorTransient;
    _popover.appearance = [NSAppearance appearanceNamed:NSAppearanceNameVibrantLight];
    _popover.contentViewController = [[SBPopViewController alloc]initWithNibName:@"SBPopViewController" bundle:nil];
    
    // 为NSStatusItem 添加点击事件
    self.demoItem.target = self;
    self.demoItem.button.action = @selector(showMyPopover:);
    
    // 防止下面的block方法中造成循环引用
    __weak typeof (self) weakSelf = self;
    // 添加对鼠标左键进行事件监听
    // 如果想对其他事件监听也进行监听，可以修改第一个枚举参数： NSEventMaskLeftMouseDown | 你要监听的其他枚举值
    [NSEvent addGlobalMonitorForEventsMatchingMask:NSEventMaskLeftMouseDown handler:^(NSEvent * event) {
        if (weakSelf.popover.isShown) {
            // 关闭popover；
            [weakSelf.popover close];
        }
    }];

}
#pragma mark -显示popover方法
- (void)showMyPopover:(NSStatusBarButton *)button{
    [_popover showRelativeToRect:button.bounds ofView:button preferredEdge:NSRectEdgeMaxY];
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}


//通过点击dock上的图标将窗口重新打开
- (BOOL)applicationShouldHandleReopen:(NSApplication *)theApplication hasVisibleWindows:(BOOL)flag {
    
    if (!flag){
        //当app所有窗口全部关闭，再点击dock时触发->互斥
        [_mainWindowController.window makeKeyAndOrderFront:self];
        return YES;
    }else if(self.openMain) {
        [_mainWindow.window makeKeyAndOrderFront:self];
    }
    return NO;
}

//- (NSApplicationTerminateReply)applicationShouldTerminate:(NSApplication *)sender{
//    return YES;
//}
//- (BOOL)application:(NSApplication *)sender openFile:(NSString *)filename{
//    return YES;
//
//}
//- (void)application:(NSApplication *)sender openFiles:(NSArray<NSString *> *)filenames{
//
//}
//- (BOOL)application:(NSApplication *)sender openTempFile:(NSString *)filename
//{
//    return YES;
//
//}
//- (BOOL)applicationShouldOpenUntitledFile:(NSApplication *)sender
//{
//    return YES;
//
//}
//- (BOOL)applicationOpenUntitledFile:(NSApplication *)sender
//{
//    return YES;
//
//}
//- (BOOL)application:(id)sender openFileWithoutUI:(NSString *)filename
//{
//    return YES;
//
//}
//- (BOOL)application:(NSApplication *)sender printFile:(NSString *)filename
//{
//    return YES;
//
//}
//- (NSApplicationPrintReply)application:(NSApplication *)application printFiles:(NSArray<NSString *> *)fileNames withSettings:(NSDictionary<NSString *, id> *)printSettings showPrintPanels:(BOOL)showPrintPanels
//{
//    return YES;
//
//}
//- (BOOL)applicationShouldTerminateAfterLastWindowClosed:(NSApplication *)sender
//{
//    return YES;
//
//}
@end
