//
//  UIView+HTStyle.h
//  HTUtilties
//
//  Created by John on 2017/5/7.
//  Copyright © 2017年 John. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HTViewStyle, HTLabelStyle, HTImageViewStyle, HTButtonStyle;

@interface UIView (HTStyle)

/**
 return a view, aka [UIView new]
 */
@property (nonatomic, readonly, class) UIView *(^newView)();
@property (nonatomic, readonly) HTViewStyle *config;
@end

@interface UILabel (HTStyle)
@property (nonatomic, readonly, class) UILabel *(^newView)();
@property (nonatomic, readonly) HTLabelStyle *config;
@end

@interface UIImageView (HTStyle)
@property (nonatomic, readonly, class) UIImageView *(^newView)();
@property (nonatomic, readonly) HTImageViewStyle *config;
@end

@interface UIButton (HTStyle)

/**
 return a custom type button
 */
@property (nonatomic, readonly, class) UIButton *(^newView)();
@property (nonatomic, readonly) HTButtonStyle *config;
@end


@interface HTViewStyle : NSObject

@property (nonatomic, weak) __kindof UIView *owner;

/**
 set superView, aka [superView addSubview self]
 */
- (HTViewStyle *(^)(UIView *))parent;

/**
 set backgroundColor
 */
- (HTViewStyle *(^)(UIColor *))bgColor;

/**
 set layer cornerRadius
 */
- (HTViewStyle *(^)(CGFloat))corner;

/**
 set layer borderColor
 */
- (HTViewStyle *(^)(UIColor *))bdColor;

/**
 set layer borderWidth
 */
- (HTViewStyle *(^)(CGFloat))bdWidth;

/**
 set tag
 */
- (HTViewStyle *(^)(NSInteger))tag;

/**
 set alpha
 */
- (HTViewStyle *(^)(CGFloat))alpha;

/**
 set tintColor
 */
- (HTViewStyle *(^)(UIColor *))tint;

/**
 set conent mode
 */
- (HTViewStyle *(^)(UIViewContentMode))mode;

@end



@interface HTLabelStyle : HTViewStyle

/**
 set text
 */
- (HTLabelStyle *(^)(NSString *))text;

/**
 set attributedString
 */
- (HTLabelStyle *(^)(NSAttributedString *))attrText;

/**
 set font
 */
- (HTLabelStyle *(^)(UIFont *))font;

/**
 set textColor
 */
- (HTLabelStyle *(^)(UIColor *))textColor;

/**
 set numberOfLines
 */
- (HTLabelStyle *(^)(NSUInteger))lines;

/**
 set text alignment
 */
- (HTLabelStyle *(^)(NSTextAlignment))align;

@end



@interface HTImageViewStyle : HTViewStyle

/**
 set image
 */
- (HTImageViewStyle *(^)(UIImage *))image;

@end



@interface HTButtonStyle : HTViewStyle

/**
 set image for specific state
 */
- (HTButtonStyle *(^)(UIImage *, UIControlState))image;

/**
 set backgroundImage for specific state
 */
- (HTButtonStyle *(^)(UIImage *, UIControlState))bgImage;

/**
 set title for specific state
 */
- (HTButtonStyle *(^)(NSString *, UIControlState))title;

/**
 set titleColor for specific state
 */
- (HTButtonStyle *(^)(UIColor *, UIControlState))titleColor;

/**
 set titleLabel font
 */
- (HTButtonStyle *(^)(UIFont *))font;

/**
 add target for UIControlEventTouchUpInside
 */
- (HTButtonStyle *(^)(id, SEL))onClick;

/**
 add callback block for UIControlEventTouchUpInside
 */
- (HTButtonStyle *(^)(void (^)(UIButton *)))clickBlock;

@end






