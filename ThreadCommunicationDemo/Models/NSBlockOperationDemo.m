//
//  NSBlockOperationDemo.m
//  ThreadCommunicationDemo
//
//  Created by PFei_He on 15/9/2.
//  Copyright (c) 2015年 PF-Lib. All rights reserved.
//

#import "NSBlockOperationDemo.h"

@implementation NSBlockOperationDemo

#pragma mark - NSOperation (NSBlockOperation)

///开始执行线程
- (void)start
{
    //创建线程一
    NSBlockOperation *blockOperation = [NSBlockOperation blockOperationWithBlock:^{//线程一
        NSLog(@"%d, %@", [NSThread isMainThread], [NSThread currentThread]);
        for (int i = 0; i < 100000000; i++) {
            //为使效果更加明显，这里做一个多次循环以增加线程运行时间
        }
        
        //主线程
        [self performSelectorOnMainThread:@selector(mainThread1:) withObject:@"This is thread 1 (NSBlockOperation)" waitUntilDone:NO];
    }];
    
    //创建队列
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    [queue addOperation:blockOperation];
}

///线程一执行的方法
- (void)mainThread1:(NSString *)string
{
    NSLog(@"%d, %@", [NSThread isMainThread], [NSThread currentThread]);
    UILabel *label = (UILabel *)[self.view viewWithTag:1];
    label.text = string;
    
    //创建线程二
    NSBlockOperation *blockOperation = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"%d, %@", [NSThread isMainThread], [NSThread currentThread]);
        for (int i = 0; i < 100000000; i++) {
            //为使效果更加明显，这里做一个多次循环以增加线程运行时间
        }
        
        //主线程
        [self performSelectorOnMainThread:@selector(mainThread2:) withObject:@"This is thread 2 (NSBlockOperation)" waitUntilDone:NO];
    }];
    
    //创建队列
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    [queue addOperation:blockOperation];
}

///线程二执行的方法
- (void)mainThread2:(NSString *)string
{
    NSLog(@"%d, %@", [NSThread isMainThread], [NSThread currentThread]);
    UILabel *label = (UILabel *)[self.view viewWithTag:2];
    label.text = string;
}

#pragma mark - Extra

///并发执行的线程
- (void)extra
{
    //创建线程
    NSBlockOperation *blockOperation = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"%d, %@", [NSThread isMainThread], [NSThread currentThread]);
    }];
    
    //添加并发任务
    [blockOperation addExecutionBlock:^{
        NSLog(@"%d, %@", [NSThread isMainThread], [NSThread currentThread]);
        UILabel *label = (UILabel *)[self.view viewWithTag:1];
        label.text = @"This is thread 1 (NSBlockOperation)";
    }];
    
    //添加并发任务
    [blockOperation addExecutionBlock:^{
        NSLog(@"%d, %@", [NSThread isMainThread], [NSThread currentThread]);
        UILabel *label = (UILabel *)[self.view viewWithTag:2];
        label.text = @"This is thread 2 (NSBlockOperation)";
    }];
    
    //执行
    [blockOperation start];
}

@end
