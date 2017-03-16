
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

- (void)changeClassName:(NSString *)name
{
	Class cls = objc_allocateClassPair([self class], [name cStringUsingEncoding:NSUTF8StringEncoding], 0);
	objc_registerClassPair(cls);
	object_setClass(self, cls);
}

@end
