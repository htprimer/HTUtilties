//
//  HTTestModel.m
//  HTUtilties
//
//  Created by 江海天 on 16/6/3.
//  Copyright © 2016年 江海天. All rights reserved.
//

#import "HTTestModel.h"
#import "HTBetaModel.h"

@implementation HTTestModel

+ (NSDictionary *)keyMapper
{
	return @{@"name":@"extraKey"};
}

+ (NSDictionary *)arrayMapper
{
	return @{@"array":[HTBetaModel class]};
}

@end
