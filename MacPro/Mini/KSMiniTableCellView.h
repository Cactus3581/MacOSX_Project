//
//  KSMiniTableCellView.h
//  MacPro
//
//  Created by xiaruzhen on 2017/6/7.
//  Copyright © 2017年 xiaruzhen. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface KSMiniTableCellView : NSTableCellView
@property (weak) IBOutlet NSTextField *wordName;
@property (weak) IBOutlet NSTextField *wordMeans;
@property (weak) IBOutlet NSButton *playVoice;

@end
