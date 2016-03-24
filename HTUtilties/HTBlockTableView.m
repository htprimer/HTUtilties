//
//  BlockTableView.m
//  KKDai
//
//  Created by 江海天 on 16/2/29.
//  Copyright © 2016年 zhaoyuguang. All rights reserved.
//

#import "HTBlockTableView.h"

@interface HTBlockTableView ()<UITableViewDataSource, UITableViewDelegate>

@end

@implementation HTBlockTableView

+ (instancetype)tableViewWithCellIdentifier:(NSString *)cellIdentifier rowCount:(NSInteger)rowCount configCellBlock:(void (^)(__kindof UITableViewCell *, NSIndexPath *))configCell
{
	HTBlockTableView *tableView = [[HTBlockTableView alloc] init];
	tableView.cellIdentifier = cellIdentifier;
	tableView.rowCount = rowCount;
	tableView.configCell = configCell;
	return tableView;
}

- (instancetype)init
{
	if (self = [super init]) {
		self.delegate = self;
		self.dataSource = self;
	}
	return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
        self.delegate = self;
        self.dataSource = self;
    }
    return self;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:self.cellIdentifier forIndexPath:indexPath];
	if (self.configCell) {
		self.configCell(cell, indexPath);
	}
	return cell;
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return self.rowCount;
}

@end
