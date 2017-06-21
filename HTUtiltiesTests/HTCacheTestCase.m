//
//  HTCacheTestCase.m
//  HTUtilties
//
//  Created by John on 2017/6/21.
//  Copyright © 2017年 江海天. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "HTCache.h"

@interface HTCacheTestCase : XCTestCase

@end

@implementation HTCacheTestCase

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testObjectSubscript
{
	HTCache<NSString *, NSNumber *> *cache = [HTCache new];
	cache[@"1"] = @1;
	cache[@"2"] = @2;
	NSLog(@"%@", cache[@"1"]);
	NSLog(@"%@", cache[@"2"]);
	NSLog(@"%@", cache[nil]);
	
	cache[@"1"] = nil;
	NSLog(@"%@", cache[@"1"]);
//	cache[nil] = @"error";
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
