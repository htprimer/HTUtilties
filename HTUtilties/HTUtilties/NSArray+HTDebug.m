//
//  NSArray+addtion.m
//  HTUtilties
//
//  Created by 江海天 on 16/4/25.
//  Copyright © 2016年 江海天. All rights reserved.
//

#import "NSArray+HTDebug.h"

@implementation NSArray (HTDebug)

- (NSString *)readableString
{
	NSMutableString *content = [NSMutableString stringWithFormat:@"%@ [\n", [self class]];
	
	for (NSObject *obj in self) {
		
		NSArray *array = [obj.debugDescription componentsSeparatedByString:@"\n"];
		NSMutableArray *mutableArray = [NSMutableArray new];
		
		for (NSString *str in array) {
			NSString *lineString = [@"\t" stringByAppendingString:str];
			[mutableArray addObject:lineString];
		}
		
		NSString *contentString = [mutableArray componentsJoinedByString:@"\n"];
		if (obj == self.lastObject) {   // not thread safe
			[content appendString:[NSString stringWithFormat:@"%@\n", contentString]];
		} else {
			[content appendString:[NSString stringWithFormat:@"%@,\n", contentString]];
		}
	}
	[content appendString:@"]"];
	
	return [content copy];
}

- (NSString *)debugDescription
{
	return [self readableString];
}

- (NSString *)descriptionWithLocale:(id)locale
{
	return [self readableString];
}

@end
