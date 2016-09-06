//
//  HTStackView.h
//  HTUtilties
//
//  Created by John on 16/9/1.
//  Copyright © 2016年 江海天. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, HTStackViewLayoutDirection) {
	HTStackViewLayoutDirectionVertical,
	HTStackViewLayoutDirectionHorizontal
};

@interface HTStackView : UIView<UIScrollViewDelegate>

@property (nonatomic, readonly) UIScrollView *scrollView;

@property (nonatomic, assign) UIEdgeInsets itemInset;

@property (nonatomic, assign) CGFloat itemSpacing;

@property (nonatomic, assign) CGSize itemSize;

@property (nonatomic, assign) HTStackViewLayoutDirection layoutDirection;

@property (nonatomic, copy) NSArray<UIView *> *itemArray;

//delete item with animation
- (void)deleteItemAtIndex:(NSUInteger)index;

- (void)deleteItem:(UIView *)view;

@end
