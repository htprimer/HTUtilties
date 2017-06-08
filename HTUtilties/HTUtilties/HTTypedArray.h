//
//  HTTypedArray.h
//  HTUtilties
//
//  Created by John on 2017/5/15.
//  Copyright © 2017年 江海天. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HTTypedArray<ObjectType> : NSMutableArray<ObjectType>

@property (nonatomic) ObjectType obj;

@property (nonatomic) Class eleType;

@property (nonatomic) NSString *strType;

@end
