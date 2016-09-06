//
//  HTPickerView.m
//  HTUtilties
//
//  Created by 江海天 on 16/6/15.
//  Copyright © 2016年 江海天. All rights reserved.
//

#import "HTPickerView.h"
#import "UIView+Frame.h"
#import "Masonry.h"

#define PickerViewHeight 250

@interface HTPickerView ()<UIPickerViewDelegate, UIPickerViewDataSource>
{
	UIPickerView *_pickerView;
	UIButton *_cancelButton;
	UIButton *_confirmButton;
}
@end

@implementation HTPickerView

- (instancetype)init
{
	self = [super init];
	if (self) {
		_pickerView = [[UIPickerView alloc] init];
		_pickerView.delegate = self;
		_pickerView.backgroundColor = [UIColor whiteColor];
		[self addSubview:_pickerView];
		[_pickerView mas_makeConstraints:^(MASConstraintMaker *make) {
			make.leading.equalTo(self);
			make.trailing.equalTo(self);
			make.bottom.equalTo(self);
			//make.height.mas_equalTo(PickerViewHeight);
		}];
		
		_cancelButton = [UIButton buttonWithType:UIButtonTypeSystem];
		[_cancelButton setTitle:@"取消" forState:UIControlStateNormal];
		_cancelButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
		[_cancelButton addTarget:self action:@selector(onClicked:) forControlEvents:UIControlEventTouchUpInside];
		[self addSubview:_cancelButton];
		[_cancelButton mas_makeConstraints:^(MASConstraintMaker *make) {
			make.leading.equalTo(self).offset(8);
			make.top.equalTo(_pickerView).offset(4);
			make.width.mas_equalTo(80);
		}];
		
		_confirmButton = [UIButton buttonWithType:UIButtonTypeSystem];
		[_confirmButton setTitle:@"确定" forState:UIControlStateNormal];
		_confirmButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
		[_confirmButton addTarget:self action:@selector(onClicked:) forControlEvents:UIControlEventTouchUpInside];
		[self addSubview:_confirmButton];
		[_confirmButton mas_makeConstraints:^(MASConstraintMaker *make) {
			make.trailing.equalTo(self).offset(-8);
			make.top.equalTo(_pickerView).offset(4);
			make.width.mas_equalTo(80);
		}];
	}
	return self;
}

- (void)onClicked:(UIButton *)sender
{
	[self hide];
	if (sender == _confirmButton) {
		if (self.confirmHandler) {
			NSInteger index = [_pickerView selectedRowInComponent:0];
			self.confirmHandler(_dataArray[index]);
		}
	}
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
	[self hide];
}

- (void)hide
{
	if (self.dismissHandler) {
		self.dismissHandler();
	}
	[UIView animateWithDuration:0.15 animations:^{
		self.transform = CGAffineTransformMakeTranslation(0, PickerViewHeight);
		self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0];
	} completion:^(BOOL finished) {
		[self removeFromSuperview];
	}];
}

- (void)show
{
	if ([_dataArray count] == 0) {
		return;
	}
	UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
	[keyWindow addSubview:self];
	self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0];
    self.frame = CGRectMake(0, -PickerViewHeight, keyWindow.width, keyWindow.height+PickerViewHeight);
	self.transform = CGAffineTransformMakeTranslation(0, PickerViewHeight);

	[UIView animateWithDuration:0.15 animations:^{
		self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5];
		self.transform = CGAffineTransformIdentity;
	}];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
	return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
	return _dataArray.count;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
	return _dataArray[row];
}

@end
