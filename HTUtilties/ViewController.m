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
#import "UIControl+HTBlock.h"
#import "HTPickerView.h"
#import "NSObject+HTDebug.h"

@interface ViewController ()

@property (nonatomic, weak) UIViewController *viewController;

@property (weak, nonatomic) IBOutlet UIControl *testControl;
@property (weak, nonatomic) IBOutlet UIButton *scanButton;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	
	UIView *view = [UIView new];
	[view changeClassName:@"NewClassName"];
	
	[self.scanButton addHandler:^{
		NSLog(@"%@", @"scanButton clicked");
	} forEvent:UIControlEventTouchUpInside];
	
	[self.testControl addHandler:^{
		NSLog(@"%@", @"control clicked");
	} forEvent:UIControlEventTouchUpInside];
}

- (IBAction)pushScanVC:(id)sender {
	
	HTPickerView *view = [HTPickerView new];
	[view setConfirmHandler:^(NSString *value) {
		NSLog(@"%@", value);;
	}];
	view.dataArray = @[@"1", @"2", @"3", @"4", @"5"];
	[view show];
	//LeakViewController *vc = [[LeakViewController alloc] init];
	//[self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)testUIControlBlock:(id)sender {
	NSLog(@"%@", @"scanButton clicked via delegate");
}

- (IBAction)controlglock:(id)sender {
		NSLog(@"%@", @"control clicked via delegate");
}


@end
