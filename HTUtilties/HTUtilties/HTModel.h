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

//convert to dict without NSNull 
- (NSDictionary *)propertyDict;

// convert dict array to model array
+ (NSArray<__kindof HTModel *> *)modelArrayWithDictArray:(NSArray<NSDictionary *> *)array;

// convert model array to dict array
+ (NSArray<NSDictionary *> *)dictArrayWithModelArray:(NSArray<__kindof HTModel *> *)array;

// overwrite this method
// if your property names don't match keys in dict
// @{ propertyName : dictKey }
+ (NSDictionary *)keyMapper;

// overwrite this method to tell the class of element in NSArray
// if your property is kind of NSArray
// @{ propertyName : class }
+ (NSDictionary *)arrayMapper;

@end
