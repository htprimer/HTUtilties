//
//  ViewController.m
//  HTUtilties
//
//  Created by 江海天 on 16/3/22.
//  Copyright © 2016年 江海天. All rights reserved.
//

#import "ViewController.h"
#import "GMBQRCodeScan.h"
#import "QRCodeScanViewController.h"
#import "LeakViewController.h"

@interface ViewController ()

@property (nonatomic, weak) UIViewController *viewController;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	
	
}

- (IBAction)pushScanVC:(id)sender {
	
	LeakViewController *vc = [[LeakViewController alloc] init];
	[self.navigationController pushViewController:vc animated:YES];
}




@end
