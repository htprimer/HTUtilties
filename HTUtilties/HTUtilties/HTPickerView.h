//
//  HTPickerView.h
//  HTUtilties
//
//  Created by 江海天 on 16/6/15.
//  Copyright © 2016年 江海天. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HTPickerView : UIView

@property (nonatomic, strong) NSArray<NSString *> *dataArray;

@property (nonatomic, copy) void (^confirmHandler)(NSString *value);

@property (nonatomic, copy) void (^dismissHandler)();

- (void)show;

@end
