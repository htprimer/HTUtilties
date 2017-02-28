//
//  HTTestModel.h
//  HTUtilties
//
//  Created by 江海天 on 16/6/3.
//  Copyright © 2016年 江海天. All rights reserved.
//

#import "HTModel.h"

@interface HTTestModel : HTModel

@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) NSDictionary *dict;

@property (nonatomic, copy) NSArray *array;

@property (nonatomic, strong) NSObject *object;

@property (nonatomic, strong) HTTestModel *model;

@property (nonatomic, assign) float height;

@property (nonatomic, assign) long long longProperty;


@end
