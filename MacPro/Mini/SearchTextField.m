//
//  SearchTextField.m
//  MacPro
//
//  Created by xiaruzhen on 2017/6/8.
//  Copyright © 2017年 xiaruzhen. All rights reserved.
//

#import "SearchTextField.h"
#import "KSVerticallyCenteredTextFieldCell.h"

@interface SearchTextField ()
@property(nonatomic,copy) NSString *strValue;
@end

@implementation SearchTextField

+ (void)setCellClass:(Class)factoryId
{
    [super setCellClass:[KSVerticallyCenteredTextFieldCell class]];
    
    
}

+ (Class)cellClass
{
    return [KSVerticallyCenteredTextFieldCell class];
}
//下面这些方法用于子类进行重写
//选择文本框时调用
- (void)selectText:(nullable id)sender {
    
}

//询问是否允许开始编辑文本框
- (BOOL)textShouldBeginEditing:(NSText *)textObject {
    return YES;
}


//询问是否允许结束编辑文本框
- (BOOL)textShouldEndEditing:(NSText *)textObject {
    return YES;
}

//文本框已经开始进入编辑的通知
- (void)textDidBeginEditing:(NSNotification *)notification {
    
}

//文本框已经结束编辑的通知
- (void)textDidEndEditing:(NSNotification *)notification {
//    NSLog(@"%@",[notification valueForKey:@"name"]);
//    NSLog(@"%@",[notification valueForKey:@"object"]);
//    NSLog(@"%@",[notification valueForKey:@"userInfos"]);
    
    if (_delegate && [_delegate respondsToSelector:@selector(textEndEditing)]) {
        [_delegate textEndEditing];
    }    
}

//文本框中文字发生变化的通知
- (void)textDidChange:(NSNotification *)notification {
    
}

-(void)keyUp:(NSEvent *)theEvent{
    [super keyUp:theEvent];
    _strValue = [theEvent characters];

    switch ([[theEvent charactersIgnoringModifiers] characterAtIndex:0]) {
        case NSUpArrowFunctionKey:
            // Increase by 5 here
            break;
        case NSDownArrowFunctionKey:;
            // Decrease by 5 here
            break;
        default:
            break;
    }
    if (_delegate && [_delegate respondsToSelector:@selector(textDidEndEditingWith:)]) {
        [_delegate textDidEndEditingWith:[theEvent characters]];
    }
}

- (BOOL)textField:(NSTextField *)textField textView:(NSTextView *)textView shouldSelectCandidateAtIndex:(NSUInteger)index {
    return YES;
}
@end
