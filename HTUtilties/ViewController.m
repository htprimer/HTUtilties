//
//  ViewController.m
//  HTUtilties
//
//  Created by 江海天 on 16/3/22.
//  Copyright © 2016年 江海天. All rights reserved.
//

#import "ViewController.h"
#import "NSObject+HTDebug.h"
#import "NSObject+HTDSL.h"
#import <Masonry.h>
#import "UIView+HTStyle.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	self.navigationController.navigationBarHidden = YES;
	
	[[UIView new].bgColor([UIColor greenColor]).parent(self.view) mas_makeConstraints:^(MASConstraintMaker *make) {
		make.center.equalTo(@0);
		make.width.height.mas_equalTo(50);
	}];
}

@end
