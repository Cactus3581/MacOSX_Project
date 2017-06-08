//
//  KSLoginWindowController.m
//  MacPro
//
//  Created by xiaruzhen on 2017/6/6.
//  Copyright © 2017年 xiaruzhen. All rights reserved.
//

#import "KSLoginWindowController.h"
#import "AppDelegate.h"
static NSString *const kStoryboardName  = @"Main";
static NSString *const kChatWindowControllerIdentifier = @"LKKLoginWindowController";
@interface KSLoginWindowController ()


@end
@implementation KSLoginWindowController

- (void)windowDidLoad {
    [super windowDidLoad];
    
    AppDelegate *appDelegate = (AppDelegate *)[NSApplication sharedApplication].delegate;
    appDelegate.mainWindowController = self;
    
    [self.window center];
}


+ (instancetype)windowController{
    
    NSStoryboard *storyboard = [NSStoryboard storyboardWithName:kStoryboardName
                                                         bundle:[NSBundle mainBundle]];
    
    KSLoginWindowController *loginWC = [storyboard instantiateControllerWithIdentifier:kChatWindowControllerIdentifier];
    
    // 设置动画样式
    [loginWC.window setAnimationBehavior:NSWindowAnimationBehaviorDocumentWindow];
    return loginWC;
}

@end
