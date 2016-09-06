//
//  HTPerformanceTests.m
//  HTUtilties
//
//  Created by John on 16/8/19.
//  Copyright © 2016年 江海天. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface HTPerformanceModel : NSObject

@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) NSDictionary *dict;

@property (nonatomic, copy) NSArray *array;

@property (nonatomic, strong) NSObject *object;

@property (nonatomic, assign) float height;

@end

@implementation HTPerformanceModel

@end


@interface HTPerformanceModelB : NSObject
{
	@public
	NSString *name;

	NSDictionary *dict;

	NSArray *array;

	NSObject *object;

	float height;
}
@end

@implementation HTPerformanceModelB

@end


@interface HTPerformanceTests : XCTestCase

@end

@implementation HTPerformanceTests

- (void)setUp {
    [super setUp];
	
}

- (void)tearDown {
	
    [super tearDown];
}


- (void)testKVCPerformance {

	HTPerformanceModel *model = [HTPerformanceModel new];
	
    [self measureBlock:^{
		// average 1.68 second without boxing 1.4 second
		for (int count = 0; count < 1*1000*1000; count++) {
			[model setValue:@"model" forKey:@"name"];
			[model setValue:@{@"key":@"value"} forKey:@"dict"];
			[model setValue:@[@"element"] forKey:@"array"];
			[model setValue:[NSObject new] forKey:@"object"];
			//[model setValue:@(37.21) forKey:@"height"];
		}
    }];
}

- (void)testSetterPerformance {
	
	HTPerformanceModel *model = [HTPerformanceModel new];
	
	[self measureBlock:^{
		// one million times 5 type setter call  average: 1 second  (1us per loop, aka 250ns per set)
		for (int count = 0; count < 1*1000*1000; count++) {
			model.name = @"model";
			model.dict = @{@"key":@"value"};
			model.array = @[@"element"];
			model.object = [NSObject new];
			//model.height = 37.21;
		}
	}];
}

- (void)testPointerPerformance {
	
	HTPerformanceModelB *model = [HTPerformanceModelB new];
	
	[self measureBlock:^{
		//average 0.87 second
		for (int count = 0; count < 1*1000*1000; count++) {
			model->name = @"model";
			model->dict = @{@"key":@"value"};
			model->array = @[@"element"];
			model->object = [NSObject new];
			//model.height = 37.21;
		}
	}];
}


@end
