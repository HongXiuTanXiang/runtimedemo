//
//  NSObject+property.m
//  runtime
//
//  Created by lihe on 2017/8/16.
//  Copyright © 2017年 lihe. All rights reserved.
//

#import "NSObject+property.h"
#import <objc/message.h>

static const char * key= "key";

@implementation NSObject (property)


-(void)setName:(NSString *)name{
    
    objc_setAssociatedObject(self, key, name, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(NSString *)name{
    return objc_getAssociatedObject(self, key);
}

@end
