//
//  UIControl+HTBlock.h
//  HTUtilties
//
//  Created by John on 16/7/26.
//  Copyright © 2016年 江海天. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIControl (HTBlock)

//  add only one block, the new block will replace tho old one
- (void)addHandler:(void (^)(UIControl *sender))handler forEvent:(UIControlEvents)event;

@end
