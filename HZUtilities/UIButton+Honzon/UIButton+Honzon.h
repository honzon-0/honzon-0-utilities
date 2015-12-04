//
//  UIButton+Honzon.h
//  按钮按下时改变背景颜色
//
//  Created by Honzon-0 on 15/12/1.
//  Copyright © 2015年 Honzon-0. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (Honzon)
- (void)setBackgroundColor:(nullable UIColor *)color forState:(UIControlState)state;
@end
