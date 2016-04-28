//
//  UIControl+HTDebug.m
//  HTUtilties
//
//  Created by 江海天 on 16/4/27.
//  Copyright © 2016年 江海天. All rights reserved.
//

#import "UIControl+HTDebug.h"
#import <objc/runtime.h>

@implementation UIControl (HTDebug)

#if EnableHTDebugControl
+ (void)load
{
	Method sendAction = class_getInstanceMethod([self class], @selector(sendAction:to:forEvent:));
	Method debugSendAction = class_getInstanceMethod([self class], @selector(debugSendAction:to:forEvent:));
	
	method_exchangeImplementations(sendAction, debugSendAction);
}
#endif

- (void)debugSendAction:(SEL)action to:(id)target forEvent:(UIEvent *)event
{
	NSLog(@"[%@ %@] via %@", [target class], NSStringFromSelector(action), [self class]);
	[self debugSendAction:action to:target forEvent:event];
}

@end
