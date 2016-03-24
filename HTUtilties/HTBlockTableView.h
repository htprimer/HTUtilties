//
//  BlockTableView.h
//  KKDai
//
//  Created by 江海天 on 16/2/29.
//  Copyright © 2016年 zhaoyuguang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HTBlockTableView : UITableView

@property (nonatomic, copy) void (^configCell)(UITableViewCell *cell, NSIndexPath *indexPath);

@property (nonatomic, assign) NSInteger rowCount;

@property (nonatomic, copy) NSString *cellIdentifier;

+ (instancetype)tableViewWithCellIdentifier:(NSString *)cellIdentifier
								   rowCount:(NSInteger)rowCount
							configCellBlock:(void (^)(__kindof UITableViewCell *cell, NSIndexPath *indexPath))configCell;

@end
