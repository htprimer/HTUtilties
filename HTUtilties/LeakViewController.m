//
//  LeakViewController.m
//  HTUtilties
//
//  Created by 江海天 on 16/6/6.
//  Copyright © 2016年 江海天. All rights reserved.
//

#import "LeakViewController.h"
#import "UIView+Frame.h"

#define notificationName @"notificationName"

@interface LeakViewController ()

@property (nonatomic, strong) UIViewController *strongSelf;

@end

@implementation LeakViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	self.view.backgroundColor = [UIColor whiteColor];
	
	self.strongSelf = self;
	
	UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
	button.center = self.view.center;
	button.size = CGSizeMake(80, 30);
	[button setTitle:@"post" forState:UIControlStateNormal];
	[button addTarget:self action:@selector(postNotification) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:button];
	
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didReceiveNotification:) name:notificationName object:nil];
}

- (void)postNotification
{
	[[NSNotificationCenter defaultCenter] postNotificationName:notificationName object:nil];
}

- (void)didReceiveNotification:(NSNotification *)noti
{
	NSLog(@"%@ %@", noti, self);
}

- (void)dealloc
{
	NSLog(@"%s", __FUNCTION__);
}

@end
