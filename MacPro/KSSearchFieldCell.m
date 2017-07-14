//
//  KSSearchFieldCell.m
//  MacPro
//
//  Created by xiaruzhen on 2017/6/9.
//  Copyright © 2017年 xiaruzhen. All rights reserved.
//

#import "KSSearchFieldCell.h"

@implementation KSSearchFieldCell


//通过代码实例化
- (id)init
{
    self = [super init];
    if (self)
    {
        
        [self setUp];
    }
    return self;
}

//通过xib实例化
- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self)
    {
        [self setUp];
    }
    return self;
}


- (NSRect) searchTextRectForBounds:(NSRect)rect {
    return NSMakeRect(0, 0, 60, 40);
}
- (NSRect) searchButtonRectForBounds:(NSRect)rect {
    return NSMakeRect(0, 0, 40, 40);

}
- (NSRect) cancelButtonRectForBounds:(NSRect)rect {
    return NSMakeRect(0, 0, 40, 40);

}
- (NSRect)drawingRectForBounds:(NSRect)rect {
    return NSMakeRect(0, 0, 200, 40);

}
- (void)setUp
{

    NSLog(@"%.2f",self.cellSize.height);
}



@end
