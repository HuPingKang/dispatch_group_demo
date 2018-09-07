# dispatch_group_demo
description how to use dispatch_group;


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
