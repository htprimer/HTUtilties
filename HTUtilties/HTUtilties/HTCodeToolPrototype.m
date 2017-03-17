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
