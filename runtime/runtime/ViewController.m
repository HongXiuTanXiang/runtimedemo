//
//  ViewController.m
//  runtime
//
//  Created by lihe on 2017/8/16.
//  Copyright © 2017年 lihe. All rights reserved.
//

#import "ViewController.h"
#import "UIImage+EXT.h"
#import "Person.h"
#import <objc/message.h>
#import "NSObject+property.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    
}



/**
 在分类中添加属性
 */
- (void)test2 {
    NSObject *ob = [NSObject new];
    ob.name = @"haha";
    NSLog(@"%@",ob.name);

}

/**
 动态添加方法
 */
- (void)test1 {
    Person *p = [Person new];
    objc_msgSend(p,@selector(run));
    [p performSelector:@selector(run)];
}

/**
 方法交换
 */
- (void)test0 {
    UIImage *mm = [UIImage imageNamed:@"icon104.png"];
    NSLog(@"%@",mm);
    
    UIImage *mm1 = [[UIImage alloc]initWithData:[NSData data]];
    NSLog(@"%@",mm1);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
