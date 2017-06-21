//
//  HTCache.m
//  HTUtilties
//
//  Created by John on 2017/6/21.
//  Copyright © 2017年 江海天. All rights reserved.
//

#import "HTCache.h"

@interface HTCache ()

@property (nonatomic) NSLock *lock;
@property (nonatomic) NSMutableDictionary *dict;

@end

@implementation HTCache

- (instancetype)init
{
	if (self = [super init]) {
		self.lock = [NSLock new];
		self.dict = [NSMutableDictionary new];
	}
	return self;
}

- (void)setObject:(id)obj forKeyedSubscript:(id<NSCopying>)key
{
	[self.lock lock];
	self.dict[key] = obj;
	[self.lock unlock];
}

- (id)objectForKeyedSubscript:(id)key
{
	[self.lock lock];
	id value = self.dict[key];
	[self.lock unlock];
	return value;
}

- (NSArray *)allValues
{
	[self.lock lock];
	NSArray *allValues = self.dict.allValues;
	[self.lock unlock];
	return allValues;
}

- (NSDictionary *)allKeyValues
{
	[self.lock lock];
	NSDictionary *dict = [self.dict copy];
	[self.lock unlock];
	return dict;
}

@end
