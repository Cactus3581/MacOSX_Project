//
//  ViewController.m
//  MacPro
//
//  Created by xiaruzhen on 2017/6/5.
//  Copyright © 2017年 xiaruzhen. All rights reserved.
//

#import "ViewController.h"

@interface  ViewController()<NSTableViewDelegate,NSTableViewDataSource>
@property (nonatomic,strong) NSMutableArray *array;
@property (nonatomic,strong) NSTableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

//    NSView *view = [[NSView alloc]initWithFrame:CGRectMake(0, 100, 100, 100)];
//    view.layer.backgroundColor = [NSColor blueColor].CGColor;
//    [self.view addSubview:view];

    NSScrollView * tableContainer = [[NSScrollView alloc] initWithFrame:NSMakeRect(10, 10, 560, 540)];
    self.tableView = [[NSTableView alloc] initWithFrame:NSMakeRect(0, 0, 544, 540)];
    // create tableview style
    //设置水平，坚直线
    [self.tableView setGridStyleMask:NSTableViewSolidVerticalGridLineMask | NSTableViewSolidHorizontalGridLineMask];
    //线条色
    [self.tableView setGridColor:[NSColor redColor]];
    //设置背景色
    [self.tableView setBackgroundColor:[NSColor greenColor]];
    //设置每个cell的换行模式，显不下时用...
    [[self.tableView cell]setLineBreakMode:NSLineBreakByTruncatingTail];
    [[self.tableView cell]setTruncatesLastVisibleLine:YES];
    
    [self.tableView sizeLastColumnToFit];
    [self.tableView setColumnAutoresizingStyle:NSTableViewUniformColumnAutoresizingStyle];
    
    //[tableView setAllowsTypeSelect:YES];
    //设置允许多选
    [self.tableView setAllowsMultipleSelection:NO];
    
    [self.tableView setAllowsExpansionToolTips:YES];
    [self.tableView setAllowsEmptySelection:YES];
    [self.tableView setAllowsColumnSelection:YES];
    [self.tableView setAllowsColumnResizing:YES];
    [self.tableView setAllowsColumnReordering:YES];
    
    [self.tableView.window setAcceptsMouseMovedEvents:YES];

    //双击
    [self.tableView setDoubleAction:@selector(ontableviewrowdoubleClicked)];
    //单击
    [self.tableView setAction:@selector(ontablerowclicked)];
    
    //选中高亮色模式
    //显示背景色
    [self.tableView setSelectionHighlightStyle:NSTableViewSelectionHighlightStyleRegular];
    //会把背景色去掉
    //[tableView setSelectionHighlightStyle:NSTableViewSelectionHighlightStyleSourceList];
    //NSTableViewSelectionHighlightStyleNone
    
    //不需要列表头
    //[tableView setHeaderView:nil];
    //使用隐藏的效果会出现表头的高度
    //[tableView.headerView setHidden:YES];
    
    // create columns for our table
    NSTableColumn * column1 = [[NSTableColumn alloc] initWithIdentifier:@"col1"];
    [column1.headerCell setTitle:@"第一列"];
    /*
     NSTableColumnNoResizing        不能改变宽度
     NSTableColumnAutoresizingMask  拉大拉小窗口时会自动布局
     NSTableColumnUserResizingMask  允许用户调整宽度
     */
    //[column1 setResizingMask:NSTableColumnAutoresizingMask];
    
    NSTableColumn * column2 = [[NSTableColumn alloc] initWithIdentifier:@"col2"];
    [column2.headerCell setTitle:@"第二列"];
    //[column2 setResizingMask:NSTableColumnAutoresizingMask];
    
    [column1 setWidth:250];
    [column2 setWidth:250];
    
    // generally you want to add at least one column to the table view.
    [self.tableView addTableColumn:column1];
    [self.tableView addTableColumn:column2];
    
    [self.tableView setDelegate:self];
    [self.tableView setDataSource:self];
    
    // embed the table view in the scroll view, and add the scroll view to our window.
    [tableContainer setDocumentView:self.tableView];
    [tableContainer setHasVerticalScroller:YES];
    [tableContainer setHasHorizontalScroller:YES];
    [self.view addSubview:tableContainer];
    
    [self focus:self.view.window];
}

//个数
- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView {
    return self.array.count;
}

//cell高度
- (CGFloat)tableView:(NSTableView *)tableView heightOfRow:(NSInteger)row {
    return 50;
}

- (id)tableView:(NSTableView *)tableView objectValueForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row  {
    
    return [self.array objectAtIndex:row];
}

// 返回cell
- (nullable NSView *)tableView:(NSTableView *)tableView viewForTableColumn:(nullable NSTableColumn *)tableColumn row:(NSInteger)row
{
    NSString *strIdt=[tableColumn identifier];
    NSTableCellView *aView = [tableView makeViewWithIdentifier:strIdt owner:self];
    if (!aView) {
        aView = [[NSTableCellView alloc]initWithFrame:CGRectMake(0, 0, tableColumn.width, 58)];
        NSTextField *textField = [[NSTextField alloc] initWithFrame:CGRectMake(15, 20, 156+50, 17)];
        textField.stringValue = [NSString stringWithFormat:@"%@-%@",tableColumn.identifier,[_array objectAtIndex:row]];
        textField.font = [NSFont systemFontOfSize:15.0f];
        textField.textColor = [NSColor blackColor];
        textField.drawsBackground = NO;
        textField.bordered = NO;
        textField.focusRingType = NSFocusRingTypeNone;
        textField.editable = NO;
        [aView addSubview:textField];
    }
    return aView;
}

// 点击row
- (NSIndexSet *)tableView:(NSTableView *)tableView selectionIndexesForProposedSelection:(NSIndexSet *)proposedSelectionIndexes {
    return proposedSelectionIndexes;
}
/*
 *    设置某行是否可以被选中，返回YES,则可以选中，返回NO 则不可选中，即没有高亮选中
 *    用于控制某一行是否可以被选中，前提是selectionShouldChangeInTableView:必须返回YES
 */
- (BOOL)tableView:(NSTableView *)tableView shouldSelectRow:(NSInteger)row {
    NSLog(@"====%ld", (long)row);
    return YES;
}

// 点击列
- (BOOL)tableView:(NSTableView *)tableView shouldSelectTableColumn:(NSTableColumn *)tableColumn
{
    return YES;
}

- (void)tableView:(NSTableView *)tableView didClickTableColumn:(NSTableColumn *)tableColumn{
    NSLog(@"%@", tableColumn.dataCell);
}

// 选中的响应(包括cell跟column)
//-(void)tableViewSelectionDidChange:(nonnull NSNotification* )notification {
//    //do something
//    NSLog(@"notification %@", notification.userInfo);
//}

//单击
- (void)ontablerowclicked {
    NSLog(@"ontablerowclicked");
}

//双击
- (void)ontableviewrowdoubleClicked {
    NSLog(@"ontableviewrowdoubleClicked");
}

- (void)focus:(NSWindow *) owner
{
    [owner makeFirstResponder:self.tableView];
}
- (void)mouseMoved:(NSEvent *)theEvent
{
    [super mouseMoved:theEvent];

}
- (void)scrollWheel:(NSEvent *)theEvent
{
    NSLog(@"wheel theEvent = %@",theEvent);
    
    [super scrollWheel:theEvent];
    //滚动时触发一下鼠标移动事件
    [self mouseMoved:theEvent];
}
- (NSInteger)columnAtPoint:(NSPoint)point {
    return 0;
}

- (NSMutableArray *)array
{
    if (!_array) {
        _array = [NSMutableArray arrayWithObjects:@"a",@"b",@"c", nil];
    }
    return _array;
}
- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}


@end
