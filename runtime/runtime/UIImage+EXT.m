//
//  UIImage+EXT.m
//  runtime
//
//  Created by lihe on 2017/8/16.
//  Copyright © 2017年 lihe. All rights reserved.
//

#import "UIImage+EXT.h"
#import <objc/message.h>

@implementation UIImage (EXT)
//Invoked whenever a class or category is added to the Objective-C runtime; implement this method to perform class-specific behavior upon loading
//当类被加载入oc runtime时候调用这个方法
+(void)load{
    
    //这种交换是对等的,如果外界调用imageWithName,那实际上是调用imageNamed
    //反之,如果调用imageNamed,实际上调用的是imageWithName
    //类方法交换
    Method m = class_getClassMethod(self, @selector(imageWithName:));
    Method mm = class_getClassMethod(self, @selector(imageNamed:));
    method_exchangeImplementations(m, mm);
    
    
    //对象方法交换
    Method m1 = class_getInstanceMethod(self, @selector(initWithMyData:));
    Method mm1 = class_getInstanceMethod(self, @selector(initWithData:));
    method_exchangeImplementations(m1, mm1);

}


-(instancetype)initWithMyData:(NSData*)data{
    UIImage *image = [self initWithMyData:data];
    
    if (data == nil) {
        NSLog(@"data == nil");
    }
    if (image == nil) {
        NSLog(@"image == nil");
    }
    
    return image;
}


+(instancetype)imageWithName:(NSString *)name{
    //这里的内存是谁来分配的呢,肯定是编译器底层自己根据判断来分配的
    UIImage *image = [self imageWithName:name];
    if (image == nil) {
        NSLog(@"image == nil");
    }
    return image;
}

@end
