//
//  HTModel.h
//  HTUtilties
//
//  Created by 江海天 on 16/6/3.
//  Copyright © 2016年 江海天. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HTModel : NSObject

- (instancetype)initWithDict:(NSDictionary *)dict;

- (NSDictionary *)propertyDict;

@end
