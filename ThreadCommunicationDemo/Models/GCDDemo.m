//
//  GCDDemo.m
//  ThreadCommunicationDemo
//
//  Created by PFei_He on 15/9/2.
//  Copyright (c) 2015年 PF-Lib. All rights reserved.
//

#import "GCDDemo.h"

@implementation GCDDemo

#pragma mark - GCD

///开始执行线程
- (void)start
{
    //创建线程一
    dispatch_queue_t queue = dispatch_queue_create("com.PF-Lib.gcd.queue1", 0);
    
    dispatch_async(queue, ^{//线程一
        NSLog(@"%d, %@", [NSThread isMainThread], [NSThread currentThread]);
        for (int i = 0; i < 100000000; i++) {
            //为使效果更加明显，这里做一个多次循环以增加线程运行时间
        }
        dispatch_async(dispatch_get_main_queue(), ^{//主线程
            NSLog(@"%d, %@", [NSThread isMainThread], [NSThread currentThread]);
            UILabel *label = (UILabel *)[self.view viewWithTag:1];
            label.text = @"This is thread 1 (GCD)";
            
            //创建线程二
            dispatch_queue_t queue = dispatch_queue_create("com.PF-Lib.gcd.queue2", 0);
            
            dispatch_async(queue, ^{
                NSLog(@"%d, %@", [NSThread isMainThread], [NSThread currentThread]);
                for (int i = 0; i < 100000000; i++) {//线程二
                    //为使效果更加明显，这里做一个多次循环以增加线程运行时间
                }
                dispatch_async(dispatch_get_main_queue(), ^{//主线程
                    NSLog(@"%d, %@", [NSThread isMainThread], [NSThread currentThread]);
                    UILabel *label = (UILabel *)[self.view viewWithTag:2];
                    label.text = @"This is thread 2 (GCD)";
                });
            });
        });
    });
}

@end
