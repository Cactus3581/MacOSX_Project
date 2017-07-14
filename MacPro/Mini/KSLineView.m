//
//  KSLineView.m
//  MacPro
//
//  Created by xiaruzhen on 2017/6/9.
//  Copyright © 2017年 xiaruzhen. All rights reserved.
//

#import "KSLineView.h"

@implementation KSLineView

- (instancetype)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
        self.wantsLayer = YES;
        self.layer.backgroundColor = [NSColor lightGrayColor].CGColor;
    }
    return self;
}
- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    // Drawing code here.
}

@end
