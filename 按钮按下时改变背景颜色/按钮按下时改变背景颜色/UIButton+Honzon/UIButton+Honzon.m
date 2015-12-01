//
//  UIButton+Honzon.m
//  按钮按下时改变背景颜色
//
//  Created by Honzon-0 on 15/12/1.
//  Copyright © 2015年 Honzon-0. All rights reserved.
//

#import "UIButton+Honzon.h"

@implementation UIButton (Honzon)

- (void)setBackgroundColor:(nullable UIColor *)color forState:(UIControlState)state {
    
    if (!color) {
        
        return;
        
    } else {
        
        if (!state) {
            
            [self setBackgroundColor:color];
            
            return;
        }
        
        [self setBackgroundImage:[self createImageWithColor:color] forState:state];
    }
    
    
}

//来源: http://blog.csdn.net/hengshujiyi/article/details/22855811
- (UIImage*)createImageWithColor: (nullable UIColor*) color
{
    CGRect rect=CGRectMake(0.0f,0.0f, 1.0f, 1.0f);
    
    UIGraphicsBeginImageContext(rect.size);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    
    CGContextFillRect(context, rect);
    
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return theImage;
}

@end
