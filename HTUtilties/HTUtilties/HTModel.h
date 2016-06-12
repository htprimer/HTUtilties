//
//  HTModel.h
//  HTUtilties
//
//  Created by 江海天 on 16/6/3.
//  Copyright © 2016年 江海天. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HTModel : NSObject

- (instancetype)initWithDict:(NSDictionary *)dict;

//convert to dict;
- (NSDictionary *)propertyDict;

// overwrite this method
// if your property names don't match keys in dict
// @{ propertyName : key }
+ (NSDictionary *)keyMapper;

@end
