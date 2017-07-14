//
//  QuaryWordsView.m
//  MacPro
//
//  Created by xiaruzhen on 2017/6/9.
//  Copyright © 2017年 xiaruzhen. All rights reserved.
//

#import "QuaryWordsView.h"

@implementation QuaryWordsView

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    self.alertLabel.maximumNumberOfLines = 3;

}

- (instancetype)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
        self.wantsLayer = YES;
        self.layer.backgroundColor = [NSColor redColor].CGColor;
    }
    return self;
}




@end
