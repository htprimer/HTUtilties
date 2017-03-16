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

#define HTVarNameDesc(var) var.ht_tempDescription = @__STRING(var)

@property (nonatomic, copy) void (^ht_debugBlock)(NSObject *obj);
@property (nonatomic, copy) NSString *ht_tempDescription;

#endif

- (void)changeClassName:(NSString *)name;

@end
