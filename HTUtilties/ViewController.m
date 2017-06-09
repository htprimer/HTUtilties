//
//  ViewController.m
//  HTUtilties
//
//  Created by 江海天 on 16/3/22.
//  Copyright © 2016年 江海天. All rights reserved.
//

#import "ViewController.h"
#import "NSObject+HTDebug.h"
#import <Masonry.h>
#import "HTViewStyle.h"
#import "UIAlertView+HTBlock.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	self.view.backgroundColor = [UIColor whiteColor];
	self.navigationController.navigationBarHidden = YES;
	
	[UIView.new.style.bgColor(UIColor.greenColor).parent(self.view).owner mas_makeConstraints:^(MASConstraintMaker *make) {
		make.center.equalTo(@0);
		make.width.height.mas_equalTo(50);
	}];
	
	[UILabel.new.style.text(@"labe+style").textColor(UIColor.blueColor).font(17).parent(self.view).owner mas_makeConstraints:^(MASConstraintMaker *make) {
		make.centerX.equalTo(@0);
		make.centerY.equalTo(@-50);
	}];
	
	[UIButton.newButton.style.font(15).title(@"style", UIControlStateNormal).titleColor(UIColor.orangeColor, UIControlStateNormal).clickBlock(^(UIButton *btn) {
		[UIAlertView showAlertWithTitle:nil message:btn.description buttonTitles:@[@"OK"] handler:nil];
	}).parent(self.view).owner mas_makeConstraints:^(MASConstraintMaker *make) {
		make.centerX.equalTo(@0);
		make.centerY.equalTo(@-100);
	}];
	
}

@end
