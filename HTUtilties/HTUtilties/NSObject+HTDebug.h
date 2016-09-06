//
//  NSObject+HTDebug.h
//  GMBuy
//
//  Created by John on 16/9/6.
//  Copyright © 2016年 cn. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (HTDebug)

#ifdef DEBUG
@property (nonatomic, copy) void (^ht_debugBlock)(NSObject *obj);
#endif

@end
