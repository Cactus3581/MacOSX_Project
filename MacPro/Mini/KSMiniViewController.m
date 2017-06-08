//
//  KSMiniViewController.m
//  MacPro
//
//  Created by xiaruzhen on 2017/6/7.
//  Copyright © 2017年 xiaruzhen. All rights reserved.
//

#import "KSMiniViewController.h"
#import "KSMiniTableCellView.h"
#import "MainWindowController.h"
#import "AppDelegate.h"
#import "SearchTextField.h"
#import "KSMiniMeansCellView.h"


@interface KSMiniViewController ()<NSTableViewDelegate,NSTableViewDataSource,SearchTextFieldDelegate>
@property (weak) IBOutlet SearchTextField *searchTextfield;
@property (weak) IBOutlet NSView *searchHeadView;
@property (weak) IBOutlet NSTableView *tableView;
@property (nonatomic,strong) NSMutableArray *array;
@property (nonatomic,strong) NSMutableArray *searchArray;
@property (nonatomic,strong) NSDictionary *searchwordDic;

@end

@implementation KSMiniViewController
+ (instancetype)miniViewController{
    KSMiniViewController *loginWC =  [[KSMiniViewController alloc]initWithNibName:@"KSMiniViewController" bundle:nil];    
    return loginWC;
}
- (void)viewDidLoad {
    [super viewDidLoad];
//    [self initView];

    
    self.searchHeadView.wantsLayer = YES;
    self.searchHeadView.layer.cornerRadius  =4;
    self.searchHeadView.layer.masksToBounds = YES;
    self.searchHeadView.layer.borderWidth   = 1;
    self.searchHeadView.layer.borderColor   = [NSColor lightGrayColor].CGColor;
    self.searchHeadView.layer.backgroundColor = [NSColor lightGrayColor].CGColor;
    //蓝色选择框
    self.searchTextfield.focusRingType = NSFocusRingTypeNone;
    self.searchTextfield.maximumNumberOfLines = 1;
    [[self.searchTextfield
      cell] setLineBreakMode:NSLineBreakByWordWrapping];
    [[self.searchTextfield cell] setTruncatesLastVisibleLine:YES];
    
    //设置是否绘制背景
    self.searchTextfield.drawsBackground = NO;
    //设置文字颜色
    self.searchTextfield.textColor = [NSColor blueColor];
    //设置是否显示边框
    self.searchTextfield.bordered = NO;
    //设置是否绘制贝塞尔风格的边框
    self.searchTextfield.bezeled = NO;
    self.searchTextfield.delegate = self;
}

- (void)viewWillAppear {
    [super viewWillAppear];
    [self.searchTextfield becomeFirstResponder];
}

#pragma mark - 初始化视图
- (void)initView {
    // 设置背景色为白色
    self.view.wantsLayer = YES;
    self.view.layer.backgroundColor = [NSColor whiteColor].CGColor;
}

- (void)awakeFromNib {
    [self.tableView registerNib:[[NSNib alloc] initWithNibNamed:NSStringFromClass(KSMiniTableCellView.class) bundle:nil] forIdentifier:@"KSMiniTableCellView"];
    [self.tableView registerNib:[[NSNib alloc] initWithNibNamed:NSStringFromClass(KSMiniMeansCellView.class) bundle:nil] forIdentifier:@"KSMiniMeansCellView"];

    [self.tableView setDelegate:self];
    [self.tableView setDataSource:self];
    //设置背景色
    //[self.tableView setBackgroundColor:[NSColor greenColor]];
    
    //设置每个cell的换行模式，显不下时用...
    [[self.tableView cell]setLineBreakMode:NSLineBreakByTruncatingTail];
    [[self.tableView cell]setTruncatesLastVisibleLine:YES];

    [self.tableView sizeLastColumnToFit];
    [self.tableView setColumnAutoresizingStyle:NSTableViewNoColumnAutoresizing];
    //设置鼠标
//    [self.tableView.window setAcceptsMouseMovedEvents:YES];
    //selece时背景色去掉
    [self.tableView setSelectionHighlightStyle:NSTableViewSelectionHighlightStyleNone];
}

- (CGFloat)tableView:(NSTableView *)tableView heightOfRow:(NSInteger)row {
    if (self.searchwordDic.allKeys.count) {
        return 80;
    }
    return 30;
}

- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView {
    
    if (self.searchwordDic.allKeys.count) {
        return 1;
    }
    if (self.searchArray.count) {
        return self.searchArray.count;
    }
    return self.array.count;
}

- (NSView *)tableView:(NSTableView *)tableView viewForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row{
    KSMiniTableCellView *cellView = [tableView makeViewWithIdentifier:@"KSMiniTableCellView" owner:self];
    
    KSMiniMeansCellView *resultCellView = [tableView makeViewWithIdentifier:@"KSMiniMeansCellView" owner:self];
    if (self.searchwordDic.allKeys.count) {
        resultCellView.wordName.stringValue = self.searchwordDic[@"name"];
        resultCellView.meansName.stringValue = self.searchwordDic[@"name"];
        return resultCellView;
    }else {
        if (self.searchArray.count) {
            cellView.wordName.stringValue = self.searchArray[row];
        }else {
            cellView.wordName.stringValue = self.array[row];
        }
    }
    return cellView;
}

- (void)tableViewSelectionDidChange:(NSNotification *)notification {
    //NSInteger selectedRow = [self.tableView selectedRow];
    MainWindowController *mainWindow = [[MainWindowController alloc]initWithWindowNibName:@"MainWindowController"];
    //强引用这个Window，不然这个Window会在跳转之后的瞬间被销毁
    AppDelegate *appDelegate = (AppDelegate *)[NSApplication sharedApplication].delegate;
    appDelegate.mainWindowController = mainWindow;
    [mainWindow.window makeKeyAndOrderFront:self];
    //关闭现在的登录窗口
    [self.view.window orderOut:self];
}

// 点击row
- (NSIndexSet *)tableView:(NSTableView *)tableView selectionIndexesForProposedSelection:(NSIndexSet *)proposedSelectionIndexes {
    return proposedSelectionIndexes;
}
//设置鼠标悬停在cell上显示的提示文本
- (NSString *)tableView:(NSTableView *)tableView toolTipForCell:(NSCell *)cell rect:(NSRectPointer)rect tableColumn:(nullable NSTableColumn *)tableColumn row:(NSInteger)row mouseLocation:(NSPoint)mouseLocation{
    return @"跳回去";
}
//当列表长度无法展示完整某行数据时 当鼠标悬停在此行上 是否扩展显示
- (BOOL)tableView:(NSTableView *)tableView shouldShowCellExpansionForTableColumn:(nullable NSTableColumn *)tableColumn row:(NSInteger)row{
    return YES;
}
//设置cell的交互能力
/*
 如果返回YES，则Cell的交互能力会变强，例如NSButtonCell的点击将会调用- (void)tableView:(NSTableView *)tableView setObjectValue方法
 */
- (BOOL)tableView:(NSTableView *)tableView shouldTrackCell:(NSCell *)cell forTableColumn:(nullable NSTableColumn *)tableColumn row:(NSInteger)row{
    return YES;
}

- (void)focus:(NSWindow *)owner {
    [owner makeFirstResponder:self.tableView];
}

- (void)mouseMoved:(NSEvent *)theEvent
{
    [super mouseMoved:theEvent];
    NSLog(@"2 wheel theEvent = %@",theEvent);
}

- (void)scrollWheel:(NSEvent *)theEvent {
    NSLog(@"wheel theEvent = %@",theEvent);
    
    [super scrollWheel:theEvent];
    //滚动时触发一下鼠标移动事件
    [self mouseMoved:theEvent];
}

- (NSInteger)columnAtPoint:(NSPoint)point {
    return 0;
}

#pragma mark - textfield delegate
//编辑输入时
- (void)textDidEndEditingWith:(NSString *)stringValue {
    NSLog(@"keyUp = %@",stringValue);
    [self.searchArray removeAllObjects];
    if ([self.array containsObject:self.searchTextfield.stringValue]) {
        [self.searchArray addObject:stringValue];
        [self.tableView reloadData];
    }
}

//结束编辑时
- (void)textEndEditing
{
    [self.searchArray removeAllObjects];
    NSLog(@"stringValue = %@",self.searchTextfield.stringValue);
    self.searchwordDic = @{@"name":@"word"};
    [self.tableView reloadData];
}

- (NSMutableArray *)array {
    if (!_array) {
        _array = [NSMutableArray arrayWithObjects:@"a",@"b",@"c",@"d",@"e",@"f",@"c", nil];
    }
    return _array;
}

- (NSMutableArray *)searchArray {
    if (!_searchArray) {
        _searchArray = [NSMutableArray array];
    }
    return _searchArray;
}

- (NSDictionary *)searchwordDic
{
    if (!_searchwordDic) {
        _searchwordDic = [NSDictionary dictionary];
    }
    return _searchwordDic;
}

@end
