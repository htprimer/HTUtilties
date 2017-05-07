//
//  HTCodeToolPrototype.h
//  HTUtilties
//
//  Created by John on 17/3/17.
//  Copyright © 2017年 江海天. All rights reserved.
//

#import <Foundation/Foundation.h>

@class HTCodeToolPrototype;

typedef void (^SimpleBlock)();

typedef id (^Block)(id obj);

typedef HTCodeToolPrototype *(^TaskBlock)(SimpleBlock obj);

@interface HTCodeToolPrototype : NSObject

- (instancetype)performBLock:(SimpleBlock)block delay:(NSInteger)delay;

- (Block)combineBlock:(NSArray<Block> *)blocks;

- (Block)processBlock:(Block)block;

- (TaskBlock)then;

@end
