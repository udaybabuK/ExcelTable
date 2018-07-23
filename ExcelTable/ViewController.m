//
//  ViewController.m
//  ExcelTable
//
//  Created by Orient Technologies Mac on 7/23/18.
//  Copyright © 2018 Orient. All rights reserved.
//

#import "ViewController.h"
#import "XCMultiSortTableView.h"
@interface ViewController ()<XCMultiTableViewDataSource, XCMultiTableViewDelegate>

@end

@implementation ViewController{
    NSMutableArray *headData;
    NSMutableArray *leftTableData;
    NSMutableArray *rightTableData;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self initData];
    
    XCMultiTableView *tableView = [[XCMultiTableView alloc] initWithFrame:CGRectInset(self.view.bounds, 5.0f, 5.0f)];
    tableView.leftHeaderEnable = YES;
    tableView.datasource = self;
    tableView.delegate = self;
    [self.view addSubview:tableView];
    
}

- (void)initData {
    headData = [NSMutableArray arrayWithCapacity:10];
    [headData addObject:@"姓名 hellow udai kumar"];
    [headData addObject:@"年龄"];
    [headData addObject:@"性别"];
    [headData addObject:@"身份"];
    [headData addObject:@"电话"];
    leftTableData = [NSMutableArray arrayWithCapacity:10];
    NSMutableArray *one = [NSMutableArray arrayWithCapacity:10];
    for (int i = 0; i < 3; i++) {
        [one addObject:[NSString stringWithFormat:@"ki-%d", i]];
    }
    [leftTableData addObject:one];
    NSMutableArray *two = [NSMutableArray arrayWithCapacity:10];
    for (int i = 3; i < 10; i++) {
        [two addObject:[NSString stringWithFormat:@"ki-%d", i]];
    }
    [leftTableData addObject:two];
    
    
    
    rightTableData = [NSMutableArray arrayWithCapacity:10];
    
    NSMutableArray *oneR = [NSMutableArray arrayWithCapacity:10];
    for (int i = 0; i < 3; i++) {
        NSMutableArray *ary = [NSMutableArray arrayWithCapacity:10];
        for (int j = 0; j < 5; j++) {
            if (j == 1) {
                [ary addObject:[NSNumber numberWithInt:random() % 5]];
            }else if (j == 2) {
                [ary addObject:[NSNumber numberWithInt:random() % 10]];
            }
            else {
                [ary addObject:[NSString stringWithFormat:@"column %d %d", i, j]];
            }
        }
        [oneR addObject:ary];
    }
    [rightTableData addObject:oneR];
    
    NSMutableArray *twoR = [NSMutableArray arrayWithCapacity:10];
    for (int i = 3; i < 10; i++) {
        NSMutableArray *ary = [NSMutableArray arrayWithCapacity:10];
        for (int j = 0; j < 5; j++) {
            if (j == 1) {
                [ary addObject:[NSNumber numberWithInt:random() % 5]];
            }else if (j == 2) {
                [ary addObject:[NSNumber numberWithInt:random() % 5]];
            }else {
                [ary addObject:[NSString stringWithFormat:@"column %d %d", i, j]];
            }
        }
        [twoR addObject:ary];
    }
    [rightTableData addObject:twoR];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - XCMultiTableViewDataSource


- (NSArray *)arrayDataForTopHeaderInTableView:(XCMultiTableView *)tableView {
    return [headData copy];
}
- (NSArray *)arrayDataForLeftHeaderInTableView:(XCMultiTableView *)tableView InSection:(NSUInteger)section {
    return [leftTableData objectAtIndex:section];
}

- (NSArray *)arrayDataForContentInTableView:(XCMultiTableView *)tableView InSection:(NSUInteger)section {
    return [rightTableData objectAtIndex:section];
}


- (NSUInteger)numberOfSectionsInTableView:(XCMultiTableView *)tableView {
    return [leftTableData count];
}

- (AlignHorizontalPosition)tableView:(XCMultiTableView *)tableView inColumn:(NSInteger)column {
    if (column == 0) {
        return AlignHorizontalPositionCenter;
    }else if (column == 1) {
        return AlignHorizontalPositionRight;
    }
    return AlignHorizontalPositionLeft;
}

- (CGFloat)tableView:(XCMultiTableView *)tableView contentTableCellWidth:(NSUInteger)column {
    if (column == 0) {
        return 500.0f;
    }
    return 250.0f;
}

- (CGFloat)tableView:(XCMultiTableView *)tableView cellHeightInRow:(NSUInteger)row InSection:(NSUInteger)section {
    if (section == 0) {
        return 60.0f;
    }else {
        return 30.0f;
    }
}

- (UIColor *)tableView:(XCMultiTableView *)tableView bgColorInSection:(NSUInteger)section InRow:(NSUInteger)row InColumn:(NSUInteger)column {
    if (row == 1 && section == 0) {
        return [UIColor redColor];
    }
    return [UIColor clearColor];
}
/*
- (UIColor *)tableView:(XCMultiTableView *)tableView headerBgColorInColumn:(NSUInteger)column {
    if (column == -1) {
        return [UIColor redColor];
    }else if (column == 1) {
        return [UIColor grayColor];
    }
    return [UIColor clearColor];
}
*/
- (NSString *)vertexName {
    return @"Vertex";
}

#pragma mark - XCMultiTableViewDelegate

- (void)tableViewWithType:(MultiTableViewType)tableViewType didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"tableViewType:%@, selectedIndexPath: %@", @(tableViewType), indexPath);
}


@end
