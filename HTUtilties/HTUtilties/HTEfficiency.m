//
//  HTCode.m
//  HTUtilties
//
//  Created by John on 2017/6/8.
//  Copyright © 2017年 John. All rights reserved.
//

#import "HTEfficiency.h"
#import <objc/runtime.h>

inline void HTDispatchAsyncMain(dispatch_block_t block)
{
	dispatch_async(dispatch_get_main_queue(), block);
}

inline void HTDispatchAsyncGlobal(dispatch_block_t block)
{
	dispatch_async(dispatch_get_global_queue(0, 0), block);
}

void HTDispatchAsyncSerial(dispatch_block_t block)
{
	static dispatch_once_t onceToken;
	static dispatch_queue_t serialQueue;
	dispatch_once(&onceToken, ^{
		serialQueue = dispatch_queue_create("HTEfficiency.serialQueue", DISPATCH_QUEUE_SERIAL);
	});
	dispatch_async(serialQueue, block);
}

inline void HTDispatchAfter(float sec, dispatch_block_t block)
{
	dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(sec * NSEC_PER_SEC)), dispatch_get_main_queue(), block);
}

inline void HTDispatchGlobalThenMain(dispatch_block_t globalBlock, dispatch_block_t mainBlock)
{
	HTDispatchAsyncGlobal(^{
		globalBlock();
		HTDispatchAsyncMain(mainBlock);
	});
}

inline id HTGetAssociatedObject(id obj, NSString *key, id (^genBlock)())
{
	id value = objc_getAssociatedObject(obj, (__bridge const void *)(key));
	if (!value && genBlock) {
		value = genBlock();
		objc_setAssociatedObject(obj, (__bridge const void *)(key), value, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
	}
	return value;
}

@implementation NSArray (HTEfficiency)

- (NSMutableArray *)ht_filterWithBlock:(BOOL (^)(id))block
{
	NSMutableArray *newArray = [NSMutableArray new];
	for (id ele in self) {
		if (block(ele)) {
			[newArray addObject:ele];
		}
	}
	return newArray;
}

- (NSMutableArray *)ht_mapWithBlock:(id (^)(id))block
{
	NSMutableArray *newArray = [NSMutableArray new];
	for (id ele in self) {
		id mappedObj = block(ele);
		if (mappedObj) {
			[newArray addObject:mappedObj];
		}
	}
	return newArray;
}

@end

@implementation HTEfficiency

#ifdef DEBUG
+ (void)load
{
	[self testMethod];
}
#endif

+ (void)testMethod
{
	
}

@end
