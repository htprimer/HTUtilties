//
//  NSDictionary+HTDebug.m
//  HTUtilties
//
//  Created by 江海天 on 16/4/28.
//  Copyright © 2016年 江海天. All rights reserved.
//

#import "NSDictionary+HTDebug.h"

@implementation NSDictionary (HTDebug)

- (NSString *)readableString
{
	NSMutableString *content = [NSMutableString stringWithFormat:@"%@ {\n", [self class]];
	
	for (NSString *key in self) {
		NSString *keyValue = [NSString stringWithFormat:@"%@ : %@", key, self[key]];
		
		NSArray *array = [keyValue componentsSeparatedByString:@"\n"];
		NSMutableArray *mutableArray = [NSMutableArray new];
		for (NSString *str in array) {
			NSString *lineString = [@"\t" stringByAppendingString:str];
			[mutableArray addObject:lineString];
		}
		keyValue = [mutableArray componentsJoinedByString:@"\n"];
		
		if (self.allKeys.lastObject == key) {   //not thread safe
			[content appendFormat:@"%@\n", keyValue];
		} else {
			[content appendFormat:@"%@,\n", keyValue];
		}
	}
	[content appendString:@"}"];
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
