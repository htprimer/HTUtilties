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
@property (nonatomic, readonly) HTViewStyle *(^parent)(UIView *);

/**
 set backgroundColor
 */
@property (nonatomic, readonly) HTViewStyle *(^bgColor)(UIColor *);

/**
 set layer cornerRadius
 */
@property (nonatomic, readonly) HTViewStyle *(^corner)(CGFloat);

/**
 set layer borderColor
 */
@property (nonatomic, readonly) HTViewStyle *(^bdColor)(UIColor *);

/**
 set layer borderWidth
 */
@property (nonatomic, readonly) HTViewStyle *(^bdWidth)(CGFloat);

/**
 set tag
 */
@property (nonatomic, readonly) HTViewStyle *(^tag)(NSInteger);

/**
 set alpha
 */
@property (nonatomic, readonly) HTViewStyle *(^alpha)(CGFloat);

/**
 set tintColor
 */
@property (nonatomic, readonly) HTViewStyle *(^tint)(UIColor *);

/**
 set conent mode
 */
@property (nonatomic, readonly) HTViewStyle *(^mode)(UIViewContentMode);

@end



@interface HTLabelStyle : HTViewStyle

/**
 set text
 */
@property (nonatomic, readonly) HTLabelStyle *(^text)(NSString *);

/**
 set attributedString
 */
@property (nonatomic, readonly) HTLabelStyle *(^attrText)(NSAttributedString *);

/**
 set font with font size
 */
@property (nonatomic, readonly) HTLabelStyle *(^font)(CGFloat size);

/**
 set textColor
 */
@property (nonatomic, readonly) HTLabelStyle *(^textColor)(UIColor *);

/**
 set numberOfLines
 */
@property (nonatomic, readonly) HTLabelStyle *(^lines)(NSUInteger);

/**
 set text alignment
 */
@property (nonatomic, readonly) HTLabelStyle *(^align)(NSTextAlignment);

@end



@interface HTImageViewStyle : HTViewStyle

/**
 set image
 */
@property (nonatomic, readonly) HTImageViewStyle *(^image)(UIImage *);

@end



@interface HTButtonStyle : HTViewStyle

/**
 set image for specific state
 */
@property (nonatomic, readonly) HTButtonStyle *(^image)(UIImage *, UIControlState);

/**
 set backgroundImage for specific state
 */
@property (nonatomic, readonly) HTButtonStyle *(^bgImage)(UIImage *, UIControlState);

/**
 set title for specific state
 */
@property (nonatomic, readonly) HTButtonStyle *(^title)(NSString *, UIControlState);

/**
 set titleColor for specific state
 */
@property (nonatomic, readonly) HTButtonStyle *(^titleColor)(UIColor *, UIControlState);

/**
 set titleLabel font with font size
 */
@property (nonatomic, readonly) HTButtonStyle *(^font)(CGFloat size);

/**
 add target for UIControlEventTouchUpInside
 */
@property (nonatomic, readonly) HTButtonStyle *(^onClick)(id, SEL);

/**
 add callback block for UIControlEventTouchUpInside
 */
@property (nonatomic, readonly) HTButtonStyle *(^clickBlock)(void (^)(UIButton *));

@end






