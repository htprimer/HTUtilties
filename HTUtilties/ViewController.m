//
//  ViewController.m
//  HTUtilties
//
//  Created by 江海天 on 16/3/22.
//  Copyright © 2016年 江海天. All rights reserved.
//

#import "ViewController.h"
#import "GMBQRCodeScan.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet GMBQRCodeScan *scanView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.scanView startScan];

}

- (IBAction)back:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)resultHandle:(GMBQRCodeScan *)sender {
    NSLog(@"%@", sender.result);
}


@end
