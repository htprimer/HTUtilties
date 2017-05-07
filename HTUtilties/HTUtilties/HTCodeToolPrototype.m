//
//  HTCodeToolPrototype.m
//  HTUtilties
//
//  Created by John on 17/3/17.
//  Copyright © 2017年 江海天. All rights reserved.
//

#import "HTCodeToolPrototype.h"

@interface HTCodeToolPrototype ()

@property (nonatomic) NSMutableArray *blockArray;

@end

@implementation HTCodeToolPrototype

- (instancetype)performBLock:(SimpleBlock)block delay:(NSInteger)delay
{
	Block linkedBlock = [HTCodeToolPrototype convertSimpleBlock:block];
	dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delay * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
		linkedBlock(self.blockArray.firstObject);
	});
	return self;
}

+ (Block)convertSimpleBlock:(SimpleBlock)simpleBlock
{
	Block block = ^id (Block nextTask){
		simpleBlock();
		nextTask(nil);
		return nil;
	};
	return block;
}


- (Block)combineBlock:(NSArray<Block> *)blocks
{
	Block (^combine)(Block caller, Block callee) = ^ Block (Block caller, Block callee) {
		Block block = ^ id (id obj) {
			return caller(callee);
		};
		return block;
	};
	
	Block resultBlock = nil;
	for (NSInteger i = blocks.count-1; i >= 0; i--) {
		resultBlock = combine(blocks[i], resultBlock);
	}
	return resultBlock;
}

- (Block)processBlock:(Block)block
{
	return nil;
}

- (TaskBlock)then
{
	return ^HTCodeToolPrototype *(SimpleBlock obj) {
		[self.blockArray addObject:obj];
		return self;
	};
}

@end
