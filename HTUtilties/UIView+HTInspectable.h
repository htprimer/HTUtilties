//
//  UIView+HTInspectable.h
//  HTUtilties
//
//  Created by 江海天 on 16/3/22.
//  Copyright © 2016年 江海天. All rights reserved.
//

#import <UIKit/UIKit.h>

IB_DESIGNABLE
@interface UIView (HTInspectable)

@property (assign, nonatomic) IBInspectable NSInteger cornerRadius;
@property (assign, nonatomic) IBInspectable NSInteger borderWidth;
@property (strong, nonatomic) IBInspectable UIColor *borderColor;

@end
