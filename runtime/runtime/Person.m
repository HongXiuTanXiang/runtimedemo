//
//  Person.m
//  runtime
//
//  Created by lihe on 2017/8/16.
//  Copyright © 2017年 lihe. All rights reserved.
//

#import "Person.h"
#import <objc/message.h>

@implementation Person

void person_rum(id self,SEL sel){
    NSLog(@"动态添加run方法");
}

void person_smile(id self,SEL sel,id argument){
    NSLog(@"动态添加smile方法");
}

void person_eat(id self,SEL sel){
    NSLog(@"动态添加eat方法");
}


/**
 如果类或者对象调用方法的时候,发现没有实现这个方法,会崩溃,但是,我们可以利用运行时动态添加方法
 这样,我们就可以现在类里面用c语言格式写好很多待调用的方法,然后,外面传过来字符串,根据字符串来动态
 调用方法,这样就实现了动态处理
 */
+(BOOL)resolveInstanceMethod:(SEL)sel{
    if (sel == NSSelectorFromString(@"run")) {
        class_addMethod(self, sel, (IMP)person_rum, "v@:");
    }else if (sel == NSSelectorFromString(@"smile")){
        //v == void 返回值,@ == self,: == sel,@ == id
        class_addMethod(self, sel,(IMP)person_smile, "v@:@");
    }
    return [super resolveInstanceMethod:sel];
}


+(BOOL)resolveClassMethod:(SEL)sel{
    if (sel == NSSelectorFromString(@"eat")) {
        
        class_addMethod(self, sel, (IMP) person_eat, "v@:");
    }
    return [super resolveClassMethod:sel];
}

//上面两个方法不能确定方法的实现时候就会来到这里,这个返回值id不能是self
//这个方法主要是把消息转发给一个能够处理这个消息的对象
//hook功能就是用这个入口来实现的
- (id)forwardingTargetForSelector:(SEL)aSelector{
    return nil;
}

//如果上面这个方法返回的是nil那么就会来到这个方法
- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector
{
    if ([NSStringFromSelector(aSelector) isEqualToString:@"rum"]){
        return [NSMethodSignature signatureWithObjCTypes:"v@:"];
    }
    return [super methodSignatureForSelector: aSelector];
}

//如果实现了上面的方法,最后会来到这里
- (void)forwardInvovation:(NSInvocation*)anInvocation
{
    [anInvocation setSelector:@selector(run)];
    [anInvocation invokeWithTarget:self];
}





@end
