//
//  UIView+HTStyle.h
//  HTUtilties
//
//  Created by John on 2017/5/7.
//  Copyright © 2017年 John. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (HTStyle)

/**
 set superView, aka [superView addSubview self]
 */
- (UIView *(^)(UIView *))parent;

/**
 set backgroundColor
 */
- (UIView *(^)(UIColor *))bgColor;

/**
 set layer cornerRadius
 */
- (UIView *(^)(CGFloat))corner;

/**
 set layer borderColor
 */
- (UIView *(^)(UIColor *))bdColor;

/**
 set layer borderWidth
 */
- (UIView *(^)(CGFloat))bdWidth;

/**
 set tag
 */
- (UIView *(^)(NSInteger))tag;

/**
 set alpha
 */
- (UIView *(^)(CGFloat))alpha;

/**
 set tintColor
 */
- (UIView *(^)(UIColor *))tint;

/**
 set conent mode
 */
- (UIView *(^)(UIViewContentMode))mode;

@end



@interface UILabel (HTStyle)

/**
 set text
 */
- (UILabel *(^)(NSString *))text;

/**
 set attributedString
 */
- (UILabel *(^)(NSAttributedString *))attrText;

/**
 set font
 */
- (UILabel *(^)(UIFont *))font;

/**
 set textColor
 */
- (UILabel *(^)(UIColor *))textColor;

/**
 set numberOfLines
 */
- (UILabel *(^)(NSUInteger))lines;

/**
 set text alignment
 */
- (UILabel *(^)(NSTextAlignment))align;

@end



@interface UIImageView (HTStyle)

/**
 set image
 */
- (UIImageView *(^)(UIImage *))image;

@end



@interface UIButton (HTStyle)

/**
 set image for specific state
 */
- (UIButton *(^)(UIImage *, UIControlState))image;

/**
 set backgroundImage for specific state
 */
- (UIButton *(^)(UIImage *, UIControlState))bgImage;

/**
 set title for specific state
 */
- (UIButton *(^)(NSString *, UIControlState))title;

/**
 set titleColor for specific state
 */
- (UIButton *(^)(UIColor *, UIControlState))titleColor;

/**
 set titleLabel font
 */
- (UIButton *(^)(UIFont *))font;

/**
 add target for UIControlEventTouchUpInside
 */
- (UIButton *(^)(id, SEL))onClick;

/**
 add callback block for UIControlEventTouchUpInside
 */
- (UIButton *(^)(void (^)(UIButton *)))clickBlock;

@end



























