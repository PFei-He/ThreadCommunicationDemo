//
//  NSInvocationOperationDemo.h
//  ThreadCommunicationDemo
//
//  Created by PFei_He on 15/9/2.
//  Copyright (c) 2015年 PF-Lib. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSInvocationOperationDemo : NSObject

///主线程上的根视图
@property (nonatomic, strong) UIView *view;

/**
 *  @brief 开始执行线程
 *  @param
 *  @detail
 *  @return
 */
- (void)start;

@end
