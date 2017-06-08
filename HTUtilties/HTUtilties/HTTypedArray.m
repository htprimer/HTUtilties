//
//  HTTypedArray.m
//  HTUtilties
//
//  Created by John on 2017/5/15.
//  Copyright © 2017年 江海天. All rights reserved.
//

#import "HTTypedArray.h"
#import "HTModel.h"
#import <objc/runtime.h>

@implementation HTTypedArray

+ (NSDictionary *)propertyMeta
{
	NSMutableDictionary *propertyMeta = [NSMutableDictionary new];
	
	unsigned count;
	objc_property_t *propertyArray = class_copyPropertyList(self, &count);
	for (int i = 0; i < count; i++) {
		
		HTPropertyAttributes *attribute = [HTPropertyAttributes new];
		unsigned int attrCount;
		objc_property_attribute_t *attrs = property_copyAttributeList(propertyArray[i], &attrCount);
		if (attrs[0].name[0] == 'T' && attrs[0].value[0] == '@') {
			unsigned long len = strlen(attrs[0].value);
			if (len > 3) {
				char className[len - 2];
				className[len - 3] = '\0';
				memcpy(className, attrs[0].value + 2, len - 3);
				attribute.cls = objc_getClass(className);
				UIView
			}
		}
		free(attrs);
		
		const char *name = property_getName(propertyArray[i]);
		propertyMeta[@(name)] = attribute;
	}
	free(propertyArray);
	
	return [propertyMeta copy];
}

- (Class)eleType
{
	HTPropertyAttributes *attri = [HTTypedArray propertyMeta][@"obj"];
	return attri.class;
}

@end
