//
//  UIView+HTStyle.h
//  HTUtilties
//
//  Created by John on 2017/5/7.
//  Copyright © 2017年 John. All rights reserved.
//

#import <UIKit/UIKit.h>

#define HTBaseStyle(Type)     \
\
@property (nonatomic, readonly) Type (^parent)(UIView *);			\
\
@property (nonatomic, readonly) Type (^bgColor)(UIColor *);			\
\
@property (nonatomic, readonly) Type (^corner)(CGFloat);			\
\
@property (nonatomic, readonly) Type (^bdColor)(UIColor *);			\
\
@property (nonatomic, readonly) Type (^bdWidth)(CGFloat);			\
\
@property (nonatomic, readonly) Type (^tag)(NSInteger);				\
\
@property (nonatomic, readonly) Type (^alpha)(CGFloat);				\
\
@property (nonatomic, readonly) Type (^tint)(UIColor *);			\
\
@property (nonatomic, readonly) Type (^mode)(UIViewContentMode);	\

@class HTViewStyle, HTLabelStyle, HTImageViewStyle, HTButtonStyle;

@interface UIView (HTStyle)
@property (nonatomic, readonly) HTViewStyle *htStyle;
@end

@interface UILabel (HTStyle)
@property (nonatomic, readonly) HTLabelStyle *htStyle;
@end

@interface UIImageView (HTStyle)
@property (nonatomic, readonly) HTImageViewStyle *htStyle;
@end

@interface UIButton (HTStyle)

/**
 return a custom type button
 */
@property (nonatomic, readonly, class) UIButton *newButton;
@property (nonatomic, readonly) HTButtonStyle *htStyle;
@end


@interface HTViewStyle : NSObject

HTBaseStyle(HTViewStyle *)

@property (nonatomic, weak) __kindof UIView *owner;

@end



@interface HTLabelStyle : HTViewStyle

HTBaseStyle(HTLabelStyle *)

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
 set font with font size and weight
 */
@property (nonatomic, readonly) HTLabelStyle *(^weightFont)(CGFloat weight, CGFloat size);

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

HTBaseStyle(HTImageViewStyle *)

/**
 set image
 */
@property (nonatomic, readonly) HTImageViewStyle *(^image)(UIImage *);

@end



@interface HTButtonStyle : HTViewStyle

HTBaseStyle(HTButtonStyle *)

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
 set titleLabel font with size and weight
 */
@property (nonatomic, readonly) HTButtonStyle *(^weightFont)(CGFloat weight, CGFloat size);

/**
 add target for UIControlEventTouchUpInside
 */
@property (nonatomic, readonly) HTButtonStyle *(^onClick)(id, SEL);

/**
 add callback block for UIControlEventTouchUpInside
 */
@property (nonatomic, readonly) HTButtonStyle *(^clickBlock)(void (^)(UIButton *sender));

@end






