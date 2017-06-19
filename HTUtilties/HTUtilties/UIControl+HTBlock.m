//
//  UIControl+HTBlock.m
//  HTUtilties
//
//  Created by John on 16/7/26.
//  Copyright © 2016年 江海天. All rights reserved.
//

#import "UIControl+HTBlock.h"
#import <objc/runtime.h>

#define HandlerKey @"HandlerKey"

@implementation UIControl (HTBlock)

- (void)addHandler:(void (^)(__kindof UIControl *))handler forEvent:(UIControlEvents)event
{
	[self removeTarget:self action:@selector(OnHandler) forControlEvents:event];
	[self addTarget:self action:@selector(OnHandler) forControlEvents:event];
	objc_setAssociatedObject(self, HandlerKey, handler, OBJC_ASSOCIATION_COPY);
}

- (void)OnHandler
{
	void (^handler)(UIControl *) = objc_getAssociatedObject(self, HandlerKey);
	if (handler) {
		handler(self);
	}
}

@end
