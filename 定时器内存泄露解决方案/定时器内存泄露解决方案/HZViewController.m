//
//  HZViewController.m
//  定时器内存泄露解决方案
//
//  Created by Honzon-0 on 15/12/10.
//  Copyright © 2015年 Honzon-0. All rights reserved.
//

#import "HZViewController.h"
#import "HZTimer.h"
@interface HZViewController ()
@property (nonatomic, strong)HZTimer *hzTimer;
@end



@implementation HZViewController

-(void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blueColor];
    self.title = @"定时器";
//    _hzTimer = [HZTimer hzScheduledTimerWithTimeInterval:1.0 target:self selector:@selector(action) userInfo:nil repeats:YES];
  
    _hzTimer = [HZTimer hzTimerWithTimeInterval:1.0 target:self selector:@selector(action) userInfo:nil repeats:YES];
    
    UIButton *startBnt = [UIButton buttonWithType:UIButtonTypeCustom];
    startBnt.frame =  CGRectMake(self.view.center.x-50, 100, 100, 40);
    startBnt.backgroundColor = [UIColor redColor];
    [startBnt setTitle:@"start" forState:UIControlStateNormal];
    [startBnt addTarget:self action:@selector(start) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:startBnt];
    
    
    UIButton *stopBnt = [UIButton buttonWithType:UIButtonTypeCustom];
    stopBnt.center = self.view.center;
    stopBnt.bounds = CGRectMake(self.view.center.x-50, 300, 100, 40);
    stopBnt.backgroundColor = [UIColor redColor];
    [stopBnt setTitle:@"stop" forState:UIControlStateNormal];
    [stopBnt addTarget:self action:@selector(stop) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:stopBnt];
    
    
    
}


- (void)stop{
    NSLog(@"HZTimer stop");
    [self.hzTimer invalidate];
}

- (void)start{
    NSLog(@"HZTimer start");
    [self.hzTimer fire];
}

- (void)action{
    NSLog(@"HZTimer action");
     NSLog(@"%f",self.hzTimer.timeInterval);
}


@end
