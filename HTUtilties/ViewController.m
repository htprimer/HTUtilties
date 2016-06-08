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
#import "HTTestModel.h"
#import "HTBetaModel.h"

@interface ViewController ()

@property (nonatomic, weak) UIViewController *viewController;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	
	HTTestModel *model1 = [[HTTestModel alloc] init];
	model1.name = @"model1";
	model1.height = 38;
	model1.dict = @{@"key":@"value"};
	NSLog(@"%@", model1);
	
	HTBetaModel *model2 = [[HTBetaModel alloc] init];
	model2.secondName = @"model2";
	NSLog(@"%@", model2);
	
	HTBetaModel *model3 = [[HTBetaModel alloc] init];
	model3.secondName = @"model3";
	NSLog(@"%@", model3);
}

- (IBAction)pushScanVC:(id)sender {
	
	LeakViewController *vc = [[LeakViewController alloc] init];
	[self.navigationController pushViewController:vc animated:YES];
}




@end
