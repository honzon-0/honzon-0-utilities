//
//  ViewController.m
//  按钮按下时改变背景颜色
//
//  Created by Honzon-0 on 15/12/1.
//  Copyright © 2015年 Honzon-0. All rights reserved.
//

#define KSCREEN_WIDTH  ([UIScreen mainScreen].bounds.size.width)
#define KSCREEN_HEIGHT  ([UIScreen mainScreen].bounds.size.height)


#import "ViewController.h"
#import "UIButton+Honzon.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIButton *highhlightedButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [highhlightedButton setTitle:@"highhlighted" forState:UIControlStateNormal];
    highhlightedButton.frame = CGRectMake(100, 100, KSCREEN_WIDTH - 200, 40);
    [highhlightedButton setBackgroundColor:[UIColor grayColor]];
    [highhlightedButton setBackgroundColor:[UIColor greenColor] forState:UIControlStateHighlighted];
    [highhlightedButton addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:highhlightedButton];
    
    
    
    UIButton *selectedButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [selectedButton setTitle:@"selected" forState:UIControlStateNormal];
    selectedButton.frame = CGRectMake(100, 190, KSCREEN_WIDTH - 200, 40);
    [selectedButton setBackgroundColor:[UIColor grayColor]];
    selectedButton.selected = YES;
    [selectedButton setBackgroundColor:[UIColor redColor] forState:UIControlStateSelected];
    [selectedButton addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:selectedButton];
    
    
    UIButton *disabledButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [disabledButton setTitle:@"disabled" forState:UIControlStateNormal];
    disabledButton.frame = CGRectMake(100, 280, KSCREEN_WIDTH - 200, 40);
    disabledButton.enabled = NO;
    [disabledButton setBackgroundColor:[UIColor blueColor] forState:UIControlStateDisabled];
    [disabledButton addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:disabledButton];
    
    
}

- (void)buttonClicked:(UIButton *)button{
    
    NSLog(@"%@",button.currentTitle);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
