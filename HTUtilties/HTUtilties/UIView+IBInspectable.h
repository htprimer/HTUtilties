//
//  UIView+IBInspectable.h
//  HTUtilties
//
//  Created by 江海天 on 16/3/22.
//  Copyright © 2016年 江海天. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (IBInspectable)

@property (assign, nonatomic) IBInspectable NSInteger cornerRadius;
@property (assign, nonatomic) IBInspectable NSInteger borderWidth;
@property (strong, nonatomic) IBInspectable UIColor *borderColor;

@end
