//
//  QRCodeScanViewController.m
//  HTUtilties
//
//  Created by 江海天 on 16/3/29.
//  Copyright © 2016年 江海天. All rights reserved.
//

#import "QRCodeScanViewController.h"
#import "GMBQRCodeScan.h"

@interface QRCodeScanViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *scanLineImageView;

@property (weak, nonatomic) IBOutlet UIImageView *boardImageView;

@property (weak, nonatomic) IBOutlet GMBQRCodeScan *codeScanView;

@property (weak, nonatomic) IBOutlet UIView *shadowView;

@end

@implementation QRCodeScanViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"二维码";
    
    [self lineAnimate];
}

- (void)viewWillLayoutSubviews
{
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:self.shadowView.bounds];
    UIBezierPath *boardPath = [UIBezierPath bezierPathWithRect:self.boardImageView.frame];
    [path appendPath:boardPath.bezierPathByReversingPath];
    
    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    maskLayer.path = path.CGPath;
    
    self.shadowView.layer.mask = maskLayer;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.codeScanView startScan];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self.codeScanView stopScan];
}

- (IBAction)resultHandler:(GMBQRCodeScan *)sender
{
    
}

- (void)lineAnimate
{
    [UIView animateWithDuration:3 animations:^{
        self.scanLineImageView.transform = CGAffineTransformMakeTranslation(0, self.boardImageView.frame.size.height - 6);
    } completion:^(BOOL finished) {
        [self bottomLineAnimate];
    }];
}

- (void)bottomLineAnimate
{
    typeof(self) __weak weakSelf = self;
    [UIView animateWithDuration:3 animations:^{
        weakSelf.scanLineImageView.transform = CGAffineTransformIdentity;
    } completion:^(BOOL finished) {
        [weakSelf lineAnimate];
    }];
}

- (void)dealloc
{
    NSLog(@"%@ dealloc", [self class]);
}

@end
