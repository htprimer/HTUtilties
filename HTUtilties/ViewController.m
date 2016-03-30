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

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (IBAction)pushScanVC:(id)sender {
    QRCodeScanViewController *vc = [[QRCodeScanViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}


@end
