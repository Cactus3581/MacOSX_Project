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

@interface MainWindowController ()
@property (weak) IBOutlet NSButton *pushButton;

@property (nonatomic,strong) NewsWindowController *newsWindow;

@end

@implementation MainWindowController

- (void)windowDidLoad {
    [super windowDidLoad];
//    self.pushButton.wantsLayer = YES;
    
    // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
}


- (IBAction)swew:(id)sender {
    
    _newsWindow = [NewsWindowController windowController];
    [_newsWindow.window makeFirstResponder:nil];
}

@end
