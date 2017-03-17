//
//  ViewController.m
//  HTUtilties
//
//  Created by 江海天 on 16/3/22.
//  Copyright © 2016年 江海天. All rights reserved.
//

#import "ViewController.h"
#import "GMBQRCodeScan.h"
#import "NSObject+HTDebug.h"
#import "UIControl+HTBlock.h"
#import "HTPickerView.h"
#import "NSObject+HTDebug.h"
#import <Masonry.h>

@interface ViewController ()

@property (nonatomic, weak) UIViewController *viewController;

@property (nonatomic) UIView *testMasonryView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	self.navigationController.navigationBarHidden = YES;
	
	self.testMasonryView = [UIView new];
	HTVarNameDesc(self.testMasonryView);
	self.testMasonryView.backgroundColor = [UIColor orangeColor];
	[self.view addSubview:self.testMasonryView];
	[self.testMasonryView mas_makeConstraints:^(MASConstraintMaker *make) {
		make.width.height.equalTo(@50);
		make.center.equalTo(self.view);
	}];
	[self.testMasonryView removeFromSuperview];
	
	dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
		[self.view addSubview:self.testMasonryView];
	});
}

@end
