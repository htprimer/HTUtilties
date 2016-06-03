//
//  UIView+HTDebug.m
//  HTUtilties
//
//  Created by 江海天 on 16/4/21.
//  Copyright © 2016年 江海天. All rights reserved.
//

#import "UIView+HTDebug.h"
#import <objc/runtime.h>

@implementation UIView (HTDebug)

static int objectCount = 0;

+ (void)load
{
//	Method alloc = class_getClassMethod([self class], @selector(alloc));
//	Method debugAlloc = class_getClassMethod([self class], @selector(DebugAlloc));
//	method_exchangeImplementations(alloc, debugAlloc);
	
	//Method alloc2 = class_getInstanceMethod(object_getClass(self), @selector(alloc));
	
	Method dealloc = class_getInstanceMethod([self class], NSSelectorFromString(@"dealloc"));
	Method debugDealloc = class_getInstanceMethod([self class], @selector(debugDealloc));
	
	method_exchangeImplementations(dealloc, debugDealloc);
}

+ (instancetype)alloc
{
	objectCount++;
	//object.objectCount = objectCount;
	
	NSLog(@"alloc %@ count:%d", [self class], objectCount);
	return [super alloc];
}


void invokePrimaryMethod(id self, SEL selecotr)
{
	//1. 根据self，获取class
	Class class = object_getClass(self);
	
	//2. 获取方法列表
	uint count;
	Method *methodList = class_copyMethodList(class, &count);
	
	//3. 遍历方法列表
	for (int i = 0; i < count; i++) {
		Method method = methodList[i];
		//4. 根据SEL查找方法
		if (!sel_isEqual(selecotr, method_getName(method))) {
			continue;
		}
		
		//5. 获取方法的实现
		IMP implement = method_getImplementation(method);
		
		//6. 直接调用方法的实现
		((void(*)(id,SEL))implement)(self, selecotr);
	}
}

- (void)debugDealloc
{
	objectCount--;
	@try {
		NSLog(@"dealloc %@", [self class]);
	} @catch (NSException *exception) {
		NSLog(@"dealloc exception %@", exception);
	}
	[self debugDealloc];
	//NSLog(@"dealloc	%@	address:%d", [self class], (int)self);
	//printf("count %s %d", [[self class] description].cString, objectCount);
}

- (NSInteger)objectCount
{
	NSNumber *count = objc_getAssociatedObject(self, "ObjectCount");
	return count.integerValue;
}

- (void)setObjectCount:(NSInteger)objectCount
{
	objc_setAssociatedObject(self, "ObjectCount", @(objectCount), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
