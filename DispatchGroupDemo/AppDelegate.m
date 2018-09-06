//
//  AppDelegate.m
//  DispatchGroupDemo
//
//  Created by hu ping kang on 2018/9/6.
//  Copyright © 2018年 hu ping kang. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [self dispatch_group_test];
    
    return YES;
}


-(void)dispatch_group_test{
    
    dispatch_group_t group = dispatch_group_create();
    dispatch_queue_t queue = dispatch_queue_create("com.gcd-group.www", DISPATCH_QUEUE_CONCURRENT);
    dispatch_group_enter(group);
    dispatch_group_async(group, queue, ^{
        NSLog(@"xxxxx");
        dispatch_group_leave(group);
    });
    dispatch_group_enter(group);
    dispatch_group_async(group, queue, ^{
        NSLog(@"=====");
        dispatch_group_leave(group);
    });
    dispatch_group_enter(group);
    dispatch_group_async(group, queue, ^{
        NSLog(@"-----");
        dispatch_group_leave(group);
    });
    dispatch_group_notify(group, queue, ^{
        NSLog(@"结束了");
    });
    
    
}
@end
