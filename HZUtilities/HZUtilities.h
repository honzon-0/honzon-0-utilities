//
//  HZUtilities.h
//  HZUtilities
//
//  Created by Honzon-0 on 15/12/4.
//  Copyright © 2015年 Honzon-0. All rights reserved.
//

#define IOS7DEVICE ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0)
#define IOS8DEVICE ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)
#define IOS9DEVICE ([[[UIDevice currentDevice] systemVersion] floatValue] >= 9.0)

#define KSCREEN_WIDTH  ([UIScreen mainScreen].bounds.size.width)
#define KSCREEN_HEIGHT  ([UIScreen mainScreen].bounds.size.height)
#define KSOUFUN_NAV_HEIGHT  44

#define SFSTR(string) string == nil?@"":string//字符串容错宏


#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface HZUtilities : NSObject

#pragma mark ===============  UILabel 公共方法 =================

//自定义Label
+ (UILabel *)addLabelOnSuperView:(UIView *)superView frame:(CGRect)frame text:(NSString *)text attributedText:(NSAttributedString *)attributedText font:(CGFloat)font textColor:(UIColor *)textColor textAlignment:(NSTextAlignment)textAlignment lineBreakMode:(NSLineBreakMode)lineBreakMode numberOfLines:(NSUInteger)numberOfLines backgroundColor:(UIColor *)backgroundColor;
//显示一行,不换行
+ (UILabel *)addSingleLineLabelOnSuperView:(UIView *)superView frame:(CGRect)frame text:(id)text fontSize:(CGFloat)fontSize color:(UIColor *)color alignment:(NSTextAlignment)alignment backgroundColor:(UIColor *)backgroundColor;

//不限行数,自适应高度
+ (UILabel *)addAdaptiveHeightLabelOnSuperView:(UIView *)superView frame:(CGRect)frame text:(id)text fontSize:(CGFloat)fontSize color:(UIColor *)color alignment:(NSTextAlignment )alignment backgroundColor:(UIColor *)backgroundColor;

//限定行数label
+ (UILabel *)addLimitedNumberOfLinesLabelOnSuperView:(UIView *)superView frame:(CGRect)frame text:(id)text fontSize:(CGFloat)fontSize color:(UIColor *)color alignment:(NSTextAlignment )alignment numberOfLines:(NSInteger)numberOfLines backgroundColor:(UIColor *)backgroundColor;

#pragma mark ===============  UIButton 公共方法 =================

//纯文字button
+ (UIButton *)addTitleButtonOnSuperView:(UIView *)superView frame:(CGRect)frame normalTitle:(NSString *)normalTitle normalColor:(UIColor *)normalColor selectedTitle:(NSString *)selectedTitle  selectedColor:(UIColor *)selectedColor highlightedTitle:(NSString *)highlightedTitle highlightedColor:(UIColor *)highlightedColor fontSize:(CGFloat)fontSize backgroundColor:(UIColor *)backgroundColor tag:(NSInteger)tag target:(id)target action:(SEL)action;


//纯图片button
+ (UIButton *)addImageButtonOnSuperView:(UIView *)superView frame:(CGRect)frame normalImg:(NSString *)normalImg highlightedImg:(NSString *)highlightedImg selectedImg:(NSString *)selectedImg tag:(NSInteger)tag target:(id)target action:(SEL)action;


//混合型Button,图片是背景
+ (UIButton *)addMixtureButtonOnSuperView:(UIView *)superView frame:(CGRect)frame normalTitle:(NSString *)normalTitle normalColor:(UIColor *)normalColor  selectedTitle:(NSString *)selectedTitle selectedColor:(UIColor *)selectedColor highlightedTitle:(NSString *)highlightedTitle highlightedColor:(UIColor *)highlightedColor fontSize:(CGFloat)fontSize normalImg:(NSString *)normalImg selectedImg:(NSString *)selectedImg highlightedImg:(NSString *)highlightedImg tag:(NSInteger)tag target:(id)target action:(SEL)action;

// 高亮
+ (UIButton *)addHightButtonOnSuperView:(UIView *)superView frame:(CGRect)frame normalTitle:(NSString *)normalTitle hightedTitle:(NSString *)highedTitle normalColor:(UIColor *)normalColor highedColor:(UIColor *)highedColor fontSize:(CGFloat)fontSize normalImg:(NSString *)normalImg highlightedImg:(NSString *)highlightedImg tag:(NSInteger)tag target:(id)target action:(SEL)action;

#pragma mark ===============  其他UI 公共方法 =================

//简单的ImageView
+ (UIImageView *)addImageViewOnSuperView:(UIView *)superView frame:(CGRect)frame imageName:(NSString *)imageName;
////默认分割线
+ (UIView *)addSeperationLineOnSuperView:(UIView *)superView lineColor:(UIColor *)lineColor;
//自定线条
+ (UIView *)addLineOnSuperView:(UIView *)superView frame:(CGRect)frame colorL:(UIColor *)color;
//字体大小自适应宽度
+ (UIFont *)adjustViewSize:(CGSize)size string:(NSString *)string font:(CGFloat)font minFont:(CGFloat)minFont minMargin:(CGFloat)minMargin;
//添加圆角方法
+ (void)setCornerView:(UIView *)view borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor cornerRadius:(CGFloat)cornerRadius masksToBounds:(BOOL)masksToBounds;
//字体 size
+ (CGSize)sizeWithString:(NSString *)string font:(CGFloat)font constrainedToSize:(CGSize)size;
@end
