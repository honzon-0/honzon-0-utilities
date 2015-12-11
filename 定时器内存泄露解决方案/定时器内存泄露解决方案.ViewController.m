//
//  ViewController.m
//  定时器内存泄露解决方案
//
//  Created by Honzon-0 on 15/12/11.
//  Copyright © 2015年 Honzon. All rights reserved.
//

#import "ViewController.h"
#import "HZViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.title = @"首页";
    UIButton *bnt = [UIButton buttonWithType:UIButtonTypeCustom];
    bnt.center = self.view.center;
    bnt.bounds = CGRectMake(0, 0, 100, 40);
    bnt.backgroundColor = [UIColor redColor];
    [bnt setTitle:@"定时器" forState:UIControlStateNormal];
    [bnt addTarget:self action:@selector(push) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:bnt];
}

- (void)push{
    HZViewController *vcl = [[HZViewController alloc] init];
    [self.navigationController pushViewController:vcl animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
