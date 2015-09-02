//
//  NSInvocationOperationDemo.m
//  ThreadCommunicationDemo
//
//  Created by PFei_He on 15/9/2.
//  Copyright (c) 2015年 PF-Lib. All rights reserved.
//

#import "NSInvocationOperationDemo.h"

@implementation NSInvocationOperationDemo

#pragma mark - NSOperation (NSInvocationOperation)

///开始执行线程
- (void)start
{
    //创建线程一
    NSInvocationOperation *invocationOperation = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(invocationOperation1:) object:@"This is thread 1 (NSInvocationOperation)"];
    
    //运行在当前线程中
//    [invocationOperation start];
    
    //创建队列（新建线程执行）
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    [queue addOperation:invocationOperation];
}

///线程一执行的方法
- (void)invocationOperation1:(NSString *)string
{
    NSLog(@"%d, %@", [NSThread isMainThread], [NSThread currentThread]);
    for (int i = 0; i < 100000000; i++) {
        //为使效果更加明显，这里做一个多次循环以增加线程运行时间
    }
    
    //主线程
    [self performSelectorOnMainThread:@selector(mainThread1:) withObject:string waitUntilDone:NO];
}

///主线程执行的方法
- (void)mainThread1:(NSString *)string
{
    NSLog(@"%d, %@", [NSThread isMainThread], [NSThread currentThread]);
    UILabel *label = (UILabel *)[self.view viewWithTag:1];
    label.text = string;
    
    //创建线程二
    NSInvocationOperation *invocationOperation = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(invocationOperation2:) object:@"This is thread 2 (NSInvocationOperation)"];
    
    //运行在当前线程中
//    [invocationOperation start];
    
    //新建线程执行
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    [queue addOperation:invocationOperation];
}

///线程二执行的方法
- (void)invocationOperation2:(NSString *)string
{
    NSLog(@"%d, %@", [NSThread isMainThread], [NSThread currentThread]);
    for (int i = 0; i < 100000000; i++) {
        //为使效果更加明显，这里做一个多次循环以增加线程运行时间
    }
    
    //主线程
    [self performSelectorOnMainThread:@selector(mainThread2:) withObject:string waitUntilDone:NO];
}

///主线程执行的方法
- (void)mainThread2:(NSString *)string
{
    NSLog(@"%d, %@", [NSThread isMainThread], [NSThread currentThread]);
    UILabel *label = (UILabel *)[self.view viewWithTag:2];
    label.text = string;
}

@end
