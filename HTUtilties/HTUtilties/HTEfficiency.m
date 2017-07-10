//
//  HTCode.m
//  HTUtilties
//
//  Created by John on 2017/6/8.
//  Copyright © 2017年 江海天. All rights reserved.
//

#import "HTEfficiency.h"

inline void HTDispatchAsyncMain(dispatch_block_t block)
{
	dispatch_async(dispatch_get_main_queue(), block);
}

inline void HTDispatchAsyncGlobal(dispatch_block_t block)
{
	dispatch_async(dispatch_get_global_queue(0, 0), block);
}

void HTDispatchSyncSerial(dispatch_block_t block)
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
	NSArray<NSString *> *stringArray = nil;
	[stringArray ht_mapWithBlock:^id(NSString *obj) {
		return nil;
	}];
	
	HTDispatchAsyncMain(^{
		NSLog(@"%@", @"perform in main queue");
	});
	
	HTDispatchAsyncGlobal(^{
		NSLog(@"%@", @"perform in global queue");
	});
	
	HTDispatchAfter(3, ^{
		NSLog(@"%@", @"perfrom atfer");
	});
}

@end
