//
//  NewsWindowController.m
//  MacPro
//
//  Created by xiaruzhen on 2017/6/6.
//  Copyright © 2017年 xiaruzhen. All rights reserved.
//

#import "NewsWindowController.h"
#import "AppDelegate.h"
#import <Quartz/Quartz.h>
@interface NewsWindowController ()
@property (weak) IBOutlet NSButton *accountLoginButton;
@property (weak) IBOutlet NSButton *phoneLoginButton;
@property (weak) IBOutlet NSTextField *passwordTextfield;
@property (weak) IBOutlet NSView *lineView;
@property (weak) IBOutlet NSView *topButtonBackView;
@property (weak) IBOutlet NSView *textfieldBackView;
@property (weak) IBOutlet NSTextField *accountTextfield;
@property (weak) IBOutlet NSButton *gainVerificationCodeButton;
@property (weak) IBOutlet NSButton *loginButton;
@property (weak) IBOutlet NSView *textfieldLineview;
@property (weak) IBOutlet NSView *lineBottomView;
@end
static NewsWindowController *loginWC=nil;
@implementation NewsWindowController

+ (instancetype)windowController{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
    });
    loginWC= [[NewsWindowController alloc]initWithWindowNibName:@"NewsWindowController"];
    // 设置动画样式
    [loginWC.window setAnimationBehavior:NSWindowAnimationBehaviorDocumentWindow];
    [loginWC.window center];
    return loginWC;
}

- (void)windowDidLoad {
    [super windowDidLoad];
    //window bar透明
    self.window.titlebarAppearsTransparent = YES;
    //隐藏bar时，可被拖拽
    self.window.movableByWindowBackground = YES;
    
    //层叠窗口
    self.shouldCascadeWindows = YES;
    [self.window center];
    [self.window setBackgroundColor:[NSColor whiteColor]];
    [[self window] setMovableByWindowBackground:NO];
    [[self.window standardWindowButton:NSWindowZoomButton] setHidden:YES];
    [[self.window standardWindowButton:NSWindowMiniaturizeButton] setHidden:YES];
    NSColor *color = [NSColor blueColor];
    NSMutableAttributedString *colorTitle = [[NSMutableAttributedString alloc] initWithAttributedString:[self.accountLoginButton attributedTitle]];
    NSRange titleRange = NSMakeRange(0, [colorTitle length]);
    [colorTitle addAttribute:NSForegroundColorAttributeName value:color range:titleRange];
    [self.accountLoginButton setAttributedTitle:colorTitle];

    self.accountTextfield.placeholderString = @"昵称/邮箱/手机号";
    
    self.passwordTextfield.placeholderString = @"密码";
    self.lineView.layer.backgroundColor = [NSColor blueColor].CGColor;
    self.gainVerificationCodeButton.hidden = YES;
    self.textfieldBackView.wantsLayer = YES;
    self.textfieldLineview.layer.backgroundColor = [NSColor lightGrayColor].CGColor;
    self.accountTextfield.focusRingType = NSFocusRingTypeNone;
    self.passwordTextfield.focusRingType = NSFocusRingTypeNone;
    self.accountTextfield.maximumNumberOfLines = 1;
    self.passwordTextfield.maximumNumberOfLines = 1;
    self.lineBottomView.layer.backgroundColor = [NSColor lightGrayColor].CGColor;
    [[self.accountTextfield
      cell] setLineBreakMode:NSLineBreakByWordWrapping];
    
    [[self.accountTextfield
      cell] setTruncatesLastVisibleLine:YES];
    
    self.loginButton.wantsLayer = YES;
    self.loginButton.layer.backgroundColor = [NSColor blueColor].CGColor;
    self.loginButton.layer.cornerRadius = self.accountLoginButton.bounds.size.height/2;
}

- (IBAction)accountLogin:(id)sender {
    NSColor *color = [NSColor blueColor];
    NSMutableAttributedString *colorTitle = [[NSMutableAttributedString alloc] initWithAttributedString:[self.accountLoginButton attributedTitle]];
    NSRange titleRange = NSMakeRange(0, [colorTitle length]);
    [colorTitle addAttribute:NSForegroundColorAttributeName value:color range:titleRange];
    [self.accountLoginButton setAttributedTitle:colorTitle];
    
    NSColor *color1 = [NSColor blackColor];
    NSMutableAttributedString *colorTitle1 = [[NSMutableAttributedString alloc] initWithAttributedString:[self.phoneLoginButton attributedTitle]];
    NSRange titleRange1 = NSMakeRange(0, [colorTitle length]);
    [colorTitle1 addAttribute:NSForegroundColorAttributeName value:color1 range:titleRange1];
    [self.phoneLoginButton setAttributedTitle:colorTitle1];
    
    if (!self.gainVerificationCodeButton.hidden) {
        CABasicAnimation *anima = [CABasicAnimation animationWithKeyPath:@"transform.translation.x"];
        anima.toValue = [NSValue valueWithCATransform3D:CATransform3DIdentity];
        anima.duration = .25f;
        anima.removedOnCompletion = NO;
        anima.fillMode = kCAFillModeForwards;
        [self.lineView.layer addAnimation:anima forKey:nil];
    }
    self.gainVerificationCodeButton.hidden = YES;
    self.accountTextfield.placeholderString = @"昵称/邮箱/手机号";
    self.passwordTextfield.placeholderString = @"密码";
}

- (IBAction)phoneLogin:(id)sender {
    NSColor *color = [NSColor blueColor];
    NSMutableAttributedString *colorTitle = [[NSMutableAttributedString alloc] initWithAttributedString:[self.phoneLoginButton attributedTitle]];
    NSRange titleRange = NSMakeRange(0, [colorTitle length]);
    [colorTitle addAttribute:NSForegroundColorAttributeName value:color range:titleRange];
    [self.phoneLoginButton setAttributedTitle:colorTitle];
    
    NSColor *color1 = [NSColor blackColor];
    NSMutableAttributedString *colorTitle1 = [[NSMutableAttributedString alloc] initWithAttributedString:[self.accountLoginButton attributedTitle]];
    NSRange titleRange1 = NSMakeRange(0, [colorTitle length]);
    [colorTitle1 addAttribute:NSForegroundColorAttributeName value:color1 range:titleRange1];
    [self.accountLoginButton setAttributedTitle:colorTitle1];
    if (self.gainVerificationCodeButton.hidden) {
        CABasicAnimation *anima = [CABasicAnimation animationWithKeyPath:@"transform.translation.x"];//
        anima.toValue = [NSNumber numberWithFloat:self.lineView.bounds.size.width+30];
        anima.duration = .25f;
        anima.removedOnCompletion = NO;
        anima.fillMode = kCAFillModeForwards;
        [self.lineView.layer addAnimation:anima forKey:nil];
    }
    self.gainVerificationCodeButton.hidden = NO;
    self.accountTextfield.placeholderString = @"手机号";
    self.passwordTextfield.placeholderString = @"验证码";
}

- (void)close
{
    
}
- (IBAction)gainVerificationCode:(id)sender {
    
}


- (IBAction)login:(id)sender {
}



@end
