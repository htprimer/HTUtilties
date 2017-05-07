//
//  NSObject+HTDSL.m
//  HTUtilties
//
//  Created by 江海天 on 2017/5/1.
//  Copyright © 2017年 江海天. All rights reserved.
//

#import "NSObject+HTDSL.h"

@implementation NSObject (HTDSL)

+ (instancetype (^)())newObject
{
	return ^ id {
		return [self new];
	};
}

@end
