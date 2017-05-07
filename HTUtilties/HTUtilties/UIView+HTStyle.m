//
//  UIView+HTStyle.m
//  HTUtilties
//
//  Created by John on 2017/5/7.
//  Copyright © 2017年 John. All rights reserved.
//

#import "UIView+HTStyle.h"
#import <objc/runtime.h>

@implementation UIView (HTStyle)

- (UIView *(^)(UIView *))parent
{
	return ^id(UIView *parentView) {
		[parentView addSubview:self];
		return self;
	};
}

- (UIView *(^)(UIColor *))bgColor
{
	return ^id(UIColor *bgColor) {
		self.backgroundColor = bgColor;
		return self;
	};
}

- (UIView *(^)(CGFloat))corner
{
	return ^id(CGFloat radius) {
		self.layer.cornerRadius = radius;
		self.layer.masksToBounds = radius > 0;
		return self;
	};
}

- (UIView *(^)(UIColor *))bdColor
{
	return ^id(UIColor *color) {
		self.layer.borderColor = color.CGColor;
		return self;
	};
}

- (UIView *(^)(CGFloat))bdWidth
{
	return ^id(CGFloat width) {
		self.layer.borderWidth = width;
		return self;
	};
}

- (UIView *(^)(NSInteger))tag
{
	return ^id(NSInteger tag) {
		self.tag = tag;
		return self;
	};
}

- (UIView *(^)(CGFloat))alpha
{
	return ^id(CGFloat alapha) {
		self.alpha = alapha;
		return self;
	};
}

- (UIView *(^)(UIColor *))tint
{
	return ^id(UIColor *color) {
		self.tintColor = color;
		return self;
	};
}

- (UIView *(^)(UIViewContentMode))mode
{
	return ^id(UIViewContentMode mode) {
		self.contentMode = mode;
		return self;
	};
}

@end

@implementation UILabel (HTStyle)

- (UILabel *(^)(NSString *))text
{
	return ^id(NSString *text) {
		self.text = text;
		return self;
	};
}

- (UILabel *(^)(NSAttributedString *))attrText
{
	return ^id(NSAttributedString *text) {
		self.attributedText = text;
		return self;
	};
}

- (UILabel *(^)(UIFont *))font
{
	return ^id(UIFont *font) {
		self.font = font;
		return self;
	};
}

- (UILabel *(^)(UIColor *))textColor
{
	return ^id(UIColor *color) {
		self.textColor = color;
		return self;
	};
}

- (UILabel *(^)(NSUInteger))lines
{
	return ^id(NSUInteger lines) {
		self.numberOfLines = lines;
		return self;
	};
}

- (UILabel *(^)(NSTextAlignment))align
{
	return ^id(NSTextAlignment align) {
		self.textAlignment = align;
		return self;
	};
}

@end


@implementation UIImageView (HTStyle)

- (UIImageView *(^)(UIImage *))image
{
	return ^id(UIImage *image) {
		self.image = image;
		return self;
	};
}

@end


@implementation UIButton (HTStyle)

- (UIButton *(^)(UIImage *, UIControlState))image
{
	return ^id(UIImage *image, UIControlState state) {
		[self setImage:image forState:state];
		return self;
	};
}

- (UIButton *(^)(UIImage *, UIControlState))bgImage
{
	return ^id(UIImage *image, UIControlState state) {
		[self setBackgroundImage:image forState:state];
		return self;
	};
}

- (UIButton *(^)(NSString *, UIControlState))title
{
	return ^id(NSString *title, UIControlState state) {
		[self setTitle:title forState:state];
		return self;
	};
}

- (UIButton *(^)(UIColor *, UIControlState))titleColor
{
	return ^id(UIColor *color, UIControlState state) {
		[self setTitleColor:color forState:state];
		return self;
	};
}

- (UIButton *(^)(UIFont *))font
{
	return ^id(UIFont *font) {
		self.titleLabel.font = font;
		return self;
	};
}

- (UIButton *(^)(id, SEL))onClick
{
	return ^id(id target, SEL action) {
		[self addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
		return self;
	};
}

- (UIButton *(^)(void (^)(UIButton *)))clickBlock
{
	return ^id(void (^block)(UIButton *)) {
		[self addTarget:self action:@selector(onHandler) forControlEvents:UIControlEventTouchUpInside];
		objc_setAssociatedObject(self, @"HTClickBLockKey", block, OBJC_ASSOCIATION_COPY);
		return self;
	};
}

- (void)onHandler
{
	void (^block)(UIButton *) = objc_getAssociatedObject(self, @"HTClickBLockKey");
	if (block) {
		block(self);
	}
}

@end


























