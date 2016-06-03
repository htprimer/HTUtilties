//
//  AppDelegate.m
//  HTUtilties
//
//  Created by 江海天 on 16/3/22.
//  Copyright © 2016年 江海天. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "HTTestModel.h"

@interface AppDelegate ()

@property (nonatomic, copy)  void (^testBlock)(id obj);

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
	
	HTTestModel *model1 = [[HTTestModel alloc] init];
	model1.name = @"model1模型1";
	model1.array = @[@"ele1", @"ele2", @"ele3"];
	model1.dict = @{@"key1":@"value1", @"key2":@"value2", @"key3":@"value3"};
	
	NSLog(@"%@", model1);
	
	HTTestModel *model2 = [[HTTestModel alloc] init];
	model2.name = @"model2模型2";
	model2.model = model1;
	
	NSLog(@"%@", model2);
	
//	NSMutableDictionary *dict = @{@"nil":obj};
	
//	[dict setValue:nil forKey:nil]
	
//	NSMutableArray *array = [NSMutableArray array];
//	
//	[array addObject:@"海天"];
//	[array addObject:@"john"];
//	[array addObject:@5];
//	
//	NSMutableArray *bigArray = [NSMutableArray array];
//	[bigArray addObject:array];
//	
//	NSLog(@"%@", array);
//	NSLog(@"%@", bigArray);
//	
//	NSDictionary *dict = @{@"name":@"江海天"};
//	
//	NSMutableDictionary *bigDict = [NSMutableDictionary dictionary];
//	bigDict[@"dict"] = dict;
//	bigDict[@"array"] = bigArray;
//	
//	NSLog(@"%@", dict);
//	NSLog(@"%@", bigDict);
//	
//	ViewController *vc = [[ViewController alloc] init];
//	
//	for (id obj in vc.testArray) {
//		NSLog([obj description]);
//	}
	
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
