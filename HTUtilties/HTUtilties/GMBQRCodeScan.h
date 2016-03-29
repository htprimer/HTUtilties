//
//  GMBQRCodeScanView.h
//  HTUtilties
//
//  Created by 江海天 on 16/3/29.
//  Copyright © 2016年 江海天. All rights reserved.
//

#import <UIKit/UIKit.h>

IBInspectable
@interface GMBQRCodeScan : UIControl

@property (nonatomic, copy) void (^resultHandler)(NSString *result);

//扫描精度 AVCaptureSessionPreset 
@property (nonatomic, copy) NSString *presetLevel;

@property (nonatomic, readonly) NSString *result;

+ (instancetype)scanViewWithResultHandler:(void (^)(NSString *result))resultHandler;

- (BOOL)startScan;

- (void)stopScan;

@end
