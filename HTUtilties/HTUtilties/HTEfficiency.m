//
//  HTCode.m
//  HTUtilties
//
//  Created by John on 2017/6/8.
//  Copyright © 2017年 江海天. All rights reserved.
//

#import "HTEfficiency.h"

@implementation NSArray (HTEfficiency)

- (NSMutableArray *)ht_filterWithBlock:(BOOL (^)(id))block
{
	NSMutableArray *newArray = [NSMutableArray new];
	for (id obj in self) {
		if (block(obj)) {
			[newArray addObject:obj];
		}
	}
	return newArray;
}

- (NSMutableArray *)ht_mapWithBlock:(id (^)(id))block
{
	NSMutableArray *newArray = [NSMutableArray new];
	for (id obj in self) {
		id mappedObj = block(obj);
		if (mappedObj) {
			[newArray addObject:mappedObj];
		}
	}
	return newArray;
}

@end

@implementation HTEfficiency

+ (void)testMethod
{
	NSArray<NSString *> *stringArray = nil;
	[stringArray enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
		
	}];
	[stringArray ht_mapWithBlock:^id(NSString *obj) {
		return nil;
	}];
}

@end
