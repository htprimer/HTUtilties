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

@property (nonatomic, copy) void (^denyHandler)();

//扫描精度 AVCaptureSessionPreset 
@property (nonatomic, copy) NSString *presetLevel;

@property (nonatomic, readonly) NSString *result;

+ (instancetype)scanViewWithResultHandler:(void (^)(NSString *result))resultHandler;

//扫描图片中的二维码 iOS8以上才支持
+ (NSString *)scanQRCodeInPicture:(UIImage *)image;

- (BOOL)startScan;

- (void)stopScan;



@end
