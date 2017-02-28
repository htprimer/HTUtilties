//
//  UIAlertView+HTBlock.m
//  GMBuy
//
//  Created by John on 16/10/15.
//  Copyright © 2016年 cn. All rights reserved.
//

#import "UIAlertView+HTBlock.h"
#import <objc/runtime.h>

#define HandlerKey @"handlerKey"

@implementation UIAlertView (HTBlock)

+ (void)showAlertWithTitle:(NSString *)title
				   message:(NSString *)message
			  buttonTitles:(NSArray *)buttonTitles
				   handler:(void (^)(NSInteger index))handler
{
	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title message:message delegate:nil cancelButtonTitle:nil otherButtonTitles:nil];
	alert.delegate = alert;
	objc_setAssociatedObject(alert, HandlerKey, handler, OBJC_ASSOCIATION_COPY);
	for (NSString *buttonTitle in buttonTitles) {
		[alert addButtonWithTitle:buttonTitle];
	}
	[alert show];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
	void (^handler)(NSInteger) = objc_getAssociatedObject(self, HandlerKey);
	if (handler) {
		handler(buttonIndex);
	}
}

@end
