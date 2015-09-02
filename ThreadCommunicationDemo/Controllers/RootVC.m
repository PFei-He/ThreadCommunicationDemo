//
//  RootVC.m
//  ThreadCommunicationDemo
//
//  Created by PFei_He on 15/9/2.
//  Copyright (c) 2015年 PF-Lib. All rights reserved.
//

#import "RootVC.h"
#import "NSThreadDemo.h"
#import "NSInvocationOperationDemo.h"
#import "NSBlockOperationDemo.h"
#import "GCDDmeo.h"

@interface RootVC ()

@end

@implementation RootVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.frame = CGRectMake(self.view.center.x - 50, 100, 100, 100);
    [button setTitle:@"TOUCH" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonTouch) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    UILabel *label1 = [[UILabel alloc] initWithFrame:CGRectMake(0, 200, self.view.frame.size.width, 100)];
    label1.text = @"No Thread";
    label1.tag = 1;
    label1.textAlignment = 1;
    [self.view addSubview:label1];
    
    UILabel *label2 = [[UILabel alloc] initWithFrame:CGRectMake(0, 300, self.view.frame.size.width, 100)];
    label2.text = @"No Thread";
    label2.tag = 2;
    label2.textAlignment = 1;
    [self.view addSubview:label2];
}

///按钮点击事件
- (void)buttonTouch
{
//    NSThreadDemo *demo = [[NSThreadDemo alloc] init];
//    NSInvocationOperationDemo *demo = [[NSInvocationOperationDemo alloc] init];
//    NSBlockOperationDemo *demo = [[NSBlockOperationDemo alloc] init];
    GCDDmeo *demo = [[GCDDmeo alloc] init];
    demo.view = self.view;
    [demo start];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
