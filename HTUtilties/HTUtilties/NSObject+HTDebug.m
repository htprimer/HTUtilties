
//
//  NSObject+HTDebug.m
//  GMBuy
//
//  Created by John on 16/9/6.
//  Copyright © 2016年 cn. All rights reserved.
//

#import "NSObject+HTDebug.h"
#import <objc/runtime.h>
#import <objc/objc.h>

#define DebugBlockKey @"DebugBlock"

@implementation NSObject (HTDebug)

#if 0
+ (void)load
{
	Method deallocMethod = class_getInstanceMethod([self class], NSSelectorFromString(@"dealloc"));
	Method debugDeallocMethod = class_getInstanceMethod([self class], @selector(debugDealloc));
	
	method_exchangeImplementations(deallocMethod, debugDeallocMethod);
}
#endif

- (void)setHt_debugBlock:(void (^)(NSObject *obj))ht_debugBlock
{
	objc_setAssociatedObject(self, DebugBlockKey, ht_debugBlock, OBJC_ASSOCIATION_COPY);
}

- (void (^)(NSObject *obj))ht_debugBlock
{
	void (^block)() = objc_getAssociatedObject(self, DebugBlockKey);
	return block;
}

- (void)debugDealloc
{
	if (self.ht_debugBlock) {
		self.ht_debugBlock(self);
	}
	[self debugDealloc];
}

- (void)changeClassName:(NSString *)name
{
	Class cls = objc_allocateClassPair([self class], [name cStringUsingEncoding:NSUTF8StringEncoding], 0);
	objc_registerClassPair(cls);
	object_setClass(self, cls);
}

@end
