//
//  NSThreadDemo.m
//  ThreadCommunicationDemo
//
//  Created by PFei_He on 15/9/2.
//  Copyright (c) 2015年 PF-Lib. All rights reserved.
//

#import "NSThreadDemo.h"

@implementation NSThreadDemo

#pragma mark - NSThread

///开始执行线程
- (void)start
{
    //创建线程一
//    [NSThread detachNewThreadSelector:@selector(thread1:) toTarget:self withObject:@"This is thread 1 (First Times NSThread)"];
    NSThread *thread = [[NSThread alloc] initWithTarget:self selector:@selector(thread1:) object:@"This is thread 1 (NSThread)"];
    [thread start];
}

///线程一执行的方法
- (void)thread1:(NSString *)string
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
//    [NSThread detachNewThreadSelector:@selector(thread1:) toTarget:self withObject:@"This is thread 1 (First Times NSThread)"];
    NSThread *thread = [[NSThread alloc] initWithTarget:self selector:@selector(thread2:) object:@"This is thread 2 (NSThread)"];
    [thread start];
}

///线程二执行的方法
- (void)thread2:(NSString *)string
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
