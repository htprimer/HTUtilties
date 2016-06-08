//
//  HTUtiltiesTests.m
//  HTUtiltiesTests
//
//  Created by 江海天 on 16/3/22.
//  Copyright © 2016年 江海天. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "HTModel.h"
#import "HTTestModel.h"
#import "HTBetaModel.h"

@interface HTUtiltiesTests : XCTestCase

@end

@implementation HTUtiltiesTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testModel
{
	NSMutableDictionary *dict1 = [NSMutableDictionary dictionary];
	[dict1 setValue:@"model1" forKey:@"name"];
	[dict1 setValue:@(10.2) forKey:@"height"];
	[dict1 setValue:@"extraValue" forKey:@"extraKey"];
	
	NSMutableDictionary *dict2 = [NSMutableDictionary dictionary];
	[dict2 setValue:@"model2" forKey:@"name"];
	[dict2 setValue:@(10.2) forKey:@"height"];
	[dict2 setValue:dict1 forKey:@"model"];
	
	HTTestModel *model1 = [[HTTestModel alloc] initWithDict:dict1];
	HTTestModel *model2 = [[HTTestModel alloc] initWithDict:dict2];
	NSLog(@"%@", model1);
	NSLog(@"%@", model2);
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
