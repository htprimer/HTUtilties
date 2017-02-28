//
//  UIAlertView+HTBlock.h
//  GMBuy
//
//  Created by John on 16/10/15.
//  Copyright © 2016年 cn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIAlertView (HTBlock)

+ (void)showAlertWithTitle:(NSString *)title
				   message:(NSString *)message
			  buttonTitles:(NSArray *)buttonTitles
				   handler:(void (^)(NSInteger index))handler;

@end
