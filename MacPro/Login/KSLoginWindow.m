//
//  KSLoginWindow.m
//  MacPro
//
//  Created by xiaruzhen on 2017/6/6.
//  Copyright © 2017年 xiaruzhen. All rights reserved.
//

#import "KSLoginWindow.h"

@implementation KSLoginWindow
- (instancetype)initWithContentRect:(NSRect)contentRect
                          styleMask:(NSUInteger)aStyle
                            backing:(NSBackingStoreType)bufferingType
                              defer:(BOOL)flag{
    self = [super initWithContentRect:contentRect
                            styleMask:aStyle
                              backing:bufferingType
                                defer:flag];
    if (self) {
        //有阴影
        [self setHasShadow:YES];
        //设置窗口为透明
        [self setOpaque:NO];
        //设置背景无色
        [self setBackgroundColor:[NSColor clearColor]];
        //设置为点击背景可以移动窗口
        [self setMovableByWindowBackground:YES];
    }
    return self;
}

- (void)setContentView:(__kindof NSView *)contentView{
    
    // 需要使用layer
    contentView.wantsLayer            = YES;
    contentView.layer.frame           = contentView.frame;
    contentView.layer.cornerRadius    = 5.0;
    contentView.layer.masksToBounds   = YES;
    
    [super setContentView:contentView];
}

// 不加上此代码window将无法响应
- (BOOL)canBecomeKeyWindow{
    return YES;
}
- (BOOL)canBecomeMainWindow{
    return YES;
}

@end
