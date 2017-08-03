//
//  HTCode.h
//  HTUtilties
//
//  Created by John on 2017/6/8.
//  Copyright © 2017年 江海天. All rights reserved.
//

#import <Foundation/Foundation.h>

void HTDispatchAsyncMain(dispatch_block_t block);
void HTDispatchAsyncGlobal(dispatch_block_t block);
void HTDispatchAsyncSerial(dispatch_block_t block);
void HTDispatchAfter(float sec, dispatch_block_t block);
void HTDispatchGlobalThenMain(dispatch_block_t globalBlock, dispatch_block_t mainBlock);
id HTGetAssociatedObject(id obj, NSString *key, id (^genBlock)());

@interface HTEfficiency : NSObject

@end


@interface NSArray<__covariant ObjectType> (HTEfficiency)

- (NSMutableArray<ObjectType> *)ht_filterWithBlock:(BOOL (^)(ObjectType ele))block;

- (NSMutableArray *)ht_mapWithBlock:(id (^)(ObjectType ele))block;

@end
