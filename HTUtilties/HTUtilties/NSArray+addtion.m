//
//  NSArray+addtion.m
//  HTUtilties
//
//  Created by 江海天 on 16/4/25.
//  Copyright © 2016年 江海天. All rights reserved.
//

#import "NSArray+addtion.h"

@implementation NSArray (addtion)

//- (NSString *)description
//{
//	//NSString *content = nil;
//	NSMutableString *content = [NSMutableString stringWithFormat:@"%@[\n", [super description]];
//	
//	for (NSObject *obj in self) {
//		[content appendString:[NSString stringWithFormat:@"%@\n", obj]];
//	}
//	[content appendString:@"]"];
//	
//	return [content copy];
//}

- (NSString *)readableString
{
	NSMutableString *content = [NSMutableString stringWithFormat:@"%@[\n", [super description]];
	
	for (NSObject *obj in self) {
		[content appendString:[NSString stringWithFormat:@"\t%@,\n", obj]];
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
