//
//  HTCode.h
//  HTUtilties
//
//  Created by John on 2017/6/8.
//  Copyright © 2017年 江海天. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HTEfficiency : NSObject

@end


@interface NSArray<__covariant ObjectType> (HTEfficiency)

- (NSMutableArray *)ht_filterWithBlock:(BOOL (^)(ObjectType obj))block;

- (NSMutableArray *)ht_mapWithBlock:(id (^)(ObjectType obj))block;

@end
