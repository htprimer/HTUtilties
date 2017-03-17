//
//  HTDebugTests.m
//  HTUtilties
//
//  Created by 江海天 on 17/3/1.
//  Copyright © 2017年 江海天. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSObject+HTDebug.h"
#import "HTCodeToolPrototype.h"

@interface HTDebugTests : XCTestCase

@end

@implementation HTDebugTests

- (void)setUp {
    [super setUp];
    
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    // In UI tests it is usually best to stop immediately when a failure occurs.
    self.continueAfterFailure = NO;
    // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
//    [[[XCUIApplication alloc] init] launch];

    // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testDebugDesc
{
	Block a = ^ id(id obj) {
		NSLog(@"%@", @"a");
		if (obj) {
			Block block = obj;
			block(nil);
		}
		return nil;
	};
	[a changeClassName:@"a"];
	
	Block b = ^ id(id obj) {
		NSLog(@"%@", @"b");
		if (obj) {
			Block block = obj;
			block(nil);
		}
		return nil;
	};
	[b changeClassName:@"b"];
	
	Block c = ^ id(id obj) {
		NSLog(@"%@", @"c");
		if (obj) {
			Block block = obj;
			block(nil);
		}
		return nil;
	};
	[c changeClassName:@"c"];
	
	HTCodeToolPrototype *tool = [HTCodeToolPrototype new];
	Block result = [tool combineBlock:@[a,b,c]];
	result(nil);
	
	tool.then(nil);
	
	dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
		NSLog(@"%@", @1);
		dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
			NSLog(@"%@", @2);
			dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
				NSLog(@"%@", @3);
			});
		});
	});
}

@end
