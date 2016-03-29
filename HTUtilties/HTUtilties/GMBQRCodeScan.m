//
//  GMBQRCodeScanView.m
//  HTUtilties
//
//  Created by 江海天 on 16/3/29.
//  Copyright © 2016年 江海天. All rights reserved.
//

#import "GMBQRCodeScan.h"
#import <AVFoundation/AVFoundation.h>

@interface GMBQRCodeScan ()<AVCaptureMetadataOutputObjectsDelegate>

@end

@implementation GMBQRCodeScan
{
    AVCaptureSession *_captureSession;
    AVCaptureVideoPreviewLayer *_previewLayer;
    
    AVCaptureDeviceInput *_input;
    AVCaptureMetadataOutput *_output;
}

+ (instancetype)scanViewWithResultHandler:(void (^)(NSString *))resultHandler
{
    GMBQRCodeScan *scanView = [[GMBQRCodeScan alloc] init];
    [scanView setResultHandler:resultHandler];
    return scanView;
}

- (void)commonInit
{
    _captureSession = [[AVCaptureSession alloc] init];
    
    _previewLayer = [AVCaptureVideoPreviewLayer layerWithSession:_captureSession];
    [_previewLayer setVideoGravity:AVLayerVideoGravityResizeAspectFill];
    
    [self.layer addSublayer:_previewLayer];
}

- (instancetype)init
{
    if (self = [super init]) {
        [self commonInit];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
        [self commonInit];
    }
    return self;
}

//只会在IB中执行, 不影响实际运行
- (void)prepareForInterfaceBuilder
{
    UIImage *image = [UIImage imageNamed:@"QR_Code.jpg"
                                inBundle:[NSBundle bundleForClass:[self class]]
           compatibleWithTraitCollection:self.traitCollection];
    self.layer.contents = (id)image.CGImage;
}

- (void)layoutSubviews
{
    _previewLayer.frame = self.bounds;
}

- (BOOL)startScan
{
    AVCaptureDevice *device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
     _input = [AVCaptureDeviceInput deviceInputWithDevice:device error:nil];
    
    if (!_input) {
        return NO;
    }
    [_captureSession addInput:_input];
    
    _output = [[AVCaptureMetadataOutput alloc] init];
    [_captureSession addOutput:_output];
    
    //output 和 input 都添加到session中才可以获取avaliableType
    for (NSString *type in [_output availableMetadataObjectTypes]) {
        if (type == AVMetadataObjectTypeQRCode) {  //可以直接比较地址
            [_output setMetadataObjectTypes:@[AVMetadataObjectTypeQRCode]];
        }
    }
    //在主线程中回调
    [_output setMetadataObjectsDelegate:self queue:dispatch_get_main_queue()];
    
    if (self.presetLevel) {
        _captureSession.sessionPreset = self.presetLevel;
    }
    
    [_captureSession  startRunning];
    
    return YES;
}

- (void)stopScan
{
    [_captureSession stopRunning];
    [_captureSession removeInput:_input];
    [_captureSession removeOutput:_output];
}

- (void)captureOutput:(AVCaptureOutput *)captureOutput didOutputMetadataObjects:(NSArray *)metadataObjects fromConnection:(AVCaptureConnection *)connection
{
    if ([metadataObjects count]) {
        AVMetadataMachineReadableCodeObject *metadataObj = [metadataObjects objectAtIndex:0];
        _result = metadataObj.stringValue;
        if (_resultHandler) {
            _resultHandler(_result);
        }
        [self sendActionsForControlEvents:UIControlEventValueChanged];
    }
    else {
        _result = nil;
        if (_resultHandler) {
            _resultHandler(nil);
        }
        [self sendActionsForControlEvents:UIControlEventValueChanged];
        NSLog(@"无输出");
    }
    [self stopScan];
}

- (void)dealloc
{
    [self stopScan];
}

@end
