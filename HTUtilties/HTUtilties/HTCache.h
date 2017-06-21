//
//  HTCache.h
//  HTUtilties
//
//  Created by John on 2017/6/21.
//  Copyright © 2017年 江海天. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
	a thread-safe mutableDictionary
 */
@interface HTCache<KeyType, ObjectType> : NSObject

//get value like that cache[key]
- (nullable ObjectType)objectForKeyedSubscript:(nullable KeyType)key;

//set value like that cache[value] = key;
- (void)setObject:(nullable ObjectType)obj forKeyedSubscript:(nonnull KeyType <NSCopying>)key;

- (nonnull NSArray<ObjectType> *)allValues;

- (nonnull NSDictionary<KeyType, ObjectType> *)allKeyValues;

@end
