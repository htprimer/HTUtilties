
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
#define TempDescKey	@"TempDesc"

@implementation NSObject (HTDebug)

#if 0
+ (void)load
{
//	Method deallocMethod = class_getInstanceMethod(self, NSSelectorFromString(@"dealloc"));
//	Method debugDeallocMethod = class_getInstanceMethod(self, @selector(debugDealloc));
//	method_exchangeImplementations(deallocMethod, debugDeallocMethod);
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

- (void)setHt_tempDescription:(NSString *)ht_tempDescription
{
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		Method descMethod = class_getInstanceMethod([self class], @selector(description));
		Method tempDescMethod = class_getInstanceMethod([self class], @selector(ht_tempDescription));
		method_exchangeImplementations(descMethod, tempDescMethod);
	});
	objc_setAssociatedObject(self, TempDescKey, ht_tempDescription, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSString *)ht_tempDescription
{
	NSString *tempDesc = objc_getAssociatedObject(self, TempDescKey);
	if (tempDesc.length) {
		return tempDesc;
	} else {
		return [self ht_tempDescription];
	}
}

@end
