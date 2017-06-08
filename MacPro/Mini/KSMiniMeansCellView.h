//
//  KSMiniMeansCellView.h
//  MacPro
//
//  Created by xiaruzhen on 2017/6/8.
//  Copyright © 2017年 xiaruzhen. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface KSMiniMeansCellView : NSTableCellView
@property (weak) IBOutlet NSTextField *wordName;
@property (weak) IBOutlet NSTextField *meansName;
@property (weak) IBOutlet NSButton *playVoiceButton;

@end
