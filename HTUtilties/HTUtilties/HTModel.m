//
//  HTModel.m
//  HTUtilties
//
//  Created by 江海天 on 16/6/3.
//  Copyright © 2016年 江海天. All rights reserved.
//

#import "HTModel.h"
#import <objc/runtime.h>

static NSArray *_propertyNameArray = nil;

@implementation HTModel

+ (NSArray *)propertyNameArray
{
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		NSMutableArray *propertyNameArray = [NSMutableArray array];
		
		unsigned count;
		objc_property_t *propertyArray = class_copyPropertyList([self class], &count);
		for (int i = 0; i < count; i++) {
			const char *name = property_getName(propertyArray[i]);
			NSString *nameStr = @(name);
			[propertyNameArray addObject:nameStr];
		}
		free(propertyArray);
		
		_propertyNameArray = [propertyNameArray copy];
	});
	return _propertyNameArray;
}

- (NSString *)readableString
{
	NSDictionary *propertyDict = [self dictionaryWithValuesForKeys:[[self class] propertyNameArray]];  //[HTModel propertyNameArray] 这返回父类的property
	
	NSMutableString *content = [NSMutableString stringWithFormat:@"\n%@:\n", [self class]];
	
	for (NSString *key in propertyDict) {
		NSString *keyValue = [NSString stringWithFormat:@"%@ = %@", key, propertyDict[key]];
		
		NSArray *array = [keyValue componentsSeparatedByString:@"\n"];
		NSMutableArray *mutableArray = [NSMutableArray array];
		for (NSString *str in array) {
			NSString *lineString = [@"\t" stringByAppendingString:str];
			[mutableArray addObject:lineString];
		}
		keyValue = [mutableArray componentsJoinedByString:@"\n"];
		
		if (propertyDict.allKeys.lastObject == key) {   //not thread safe
			[content appendFormat:@"%@\n", keyValue];
		} else {
			[content appendFormat:@"%@,\n", keyValue];
		}
	}
	return [content copy];
}

- (NSString *)description
{
	return [self readableString];
}

- (NSString *)debugDescription
{
	return [self readableString];
}

@end
