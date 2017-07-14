//
//  SearchTextField.h
//  MacPro
//
//  Created by xiaruzhen on 2017/6/8.
//  Copyright © 2017年 xiaruzhen. All rights reserved.
//

#import <Cocoa/Cocoa.h>
@class SearchTextField;
@protocol SearchTextFieldDelegate <NSObject>
@optional
- (void)textDidEndEditingWith:(NSString *)stringValue;
- (void)textEndEditing;
@end

@interface SearchTextField : NSTextField
@property(nonatomic,weak) id<SearchTextFieldDelegate>delegate;
@end
