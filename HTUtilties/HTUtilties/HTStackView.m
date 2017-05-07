//
//  HTStackView.m
//  HTUtilties
//
//  Created by John on 16/9/1.
//  Copyright © 2016年 江海天. All rights reserved.
//

#import "HTStackView.h"
#import <Masonry.h>

@interface HTStackView ()

@end

@implementation HTStackView

- (instancetype)init
{
	self = [super init];
	if (self) {
		[self initialize];
	}
	return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super initWithCoder:aDecoder];
	if (self) {
		[self initialize];
	}
	return self;
}

- (void)initialize
{
	self.backgroundColor = [UIColor whiteColor];
	self.clipsToBounds = YES;
	_scrollView = [UIScrollView new];
	self.scrollView.showsVerticalScrollIndicator = NO;
	self.scrollView.showsHorizontalScrollIndicator = NO;
	[self addSubview:self.scrollView];
	[self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
		make.edges.equalTo(self);
	}];
}

- (void)setItemArray:(NSArray<UIView *> *)itemArray
{
	[_itemArray makeObjectsPerformSelector:@selector(removeFromSuperview)];
	_itemArray = [itemArray copy];
	
	UIView *lastView = nil;
	for (UIView *view in itemArray) {
		[self.scrollView addSubview:view];
		[view mas_remakeConstraints:^(MASConstraintMaker *make) {
			
			if (self.layoutDirection == HTStackViewLayoutDirectionHorizontal) {
				if (lastView) {
					make.leading.equalTo(lastView.mas_trailing).offset(self.itemSpacing);
				} else {
					make.leading.equalTo(self.scrollView).offset(self.itemInset.left);
				}
				if (view == itemArray.lastObject) {
					make.trailing.equalTo(self.scrollView).offset(-self.itemInset.right);
				}
				make.top.equalTo(self.scrollView).offset(self.itemInset.top);
				make.bottom.equalTo(self.scrollView).offset(-self.itemInset.bottom);
			} else if (self.layoutDirection == HTStackViewLayoutDirectionVertical) {
				if (lastView) {
					make.top.equalTo(lastView.mas_bottom).offset(self.itemSpacing);
				} else {
					make.top.equalTo(self).offset(self.itemInset.top);
				}
				if (view == itemArray.lastObject) {
					make.bottom.equalTo(self.scrollView).offset(-self.itemInset.bottom);
				}
				make.leading.equalTo(self).offset(self.itemInset.left);
				make.trailing.equalTo(self).offset(-self.itemInset.right);
			}
			make.size.mas_equalTo(self.itemSize);
		}];
		lastView = view;
	}
}

- (void)deleteItem:(UIView *)view
{
	if ([self.itemArray containsObject:view]) {
		NSUInteger index = [self.itemArray indexOfObject:view];
		[self deleteItemAtIndex:index];
	}
}

- (void)deleteItemAtIndex:(NSUInteger)index
{
	if (index >= self.itemArray.count) {
		return;
	}
	UIView *deleteView = self.itemArray[index];
	UIView *lastView = nil;
	UIView *afterView = nil;
	
	if (deleteView != self.itemArray.firstObject) {
		lastView = self.itemArray[index-1];
	}
	if (deleteView != self.itemArray.lastObject) {
		afterView = self.itemArray[index+1];
	}
	
	NSMutableArray *newArray = [self.itemArray mutableCopy];
	[newArray removeObjectAtIndex:index];
	_itemArray = [newArray copy];
	[deleteView removeFromSuperview];
	
	if (lastView == nil && afterView == nil) {
		return;
	}
	
	if (afterView == nil) {
		[lastView mas_makeConstraints:^(MASConstraintMaker *make) {
			if (self.layoutDirection == HTStackViewLayoutDirectionHorizontal) {

				make.trailing.equalTo(self.scrollView).offset(-self.itemInset.right);

			} else if (self.layoutDirection == HTStackViewLayoutDirectionVertical) {
			
				make.bottom.equalTo(self.scrollView).offset(-self.itemInset.bottom);
			}
		}];
		
		return;
	}
	
	[afterView mas_makeConstraints:^(MASConstraintMaker *make) {
		if (self.layoutDirection == HTStackViewLayoutDirectionHorizontal) {
			if (lastView) {
				make.leading.equalTo(lastView.mas_trailing).offset(self.itemSpacing);
			} else {
				make.leading.equalTo(self.scrollView).offset(self.itemInset.left);
			}
		} else if (self.layoutDirection == HTStackViewLayoutDirectionVertical) {
			if (lastView) {
				make.top.equalTo(lastView.mas_bottom).offset(self.itemSpacing);
			} else {
				make.top.equalTo(self).offset(self.itemInset.top);
			}
		}
	}];
	[UIView animateWithDuration:0.25 animations:^{
		[self.scrollView layoutIfNeeded];
	}];
}

@end
