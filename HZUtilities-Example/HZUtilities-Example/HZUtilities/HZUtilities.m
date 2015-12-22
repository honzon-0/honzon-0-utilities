//
//  HZUtilities.m
//
//  Created by Honzon-0 on 15/12/4.
//  Copyright © 2015年 Honzon-0. All rights reserved.
//


#import "HZUtilities.h"



@implementation HZUtilities
#pragma mark ===============  UI 公共方法 =================
//自定义Label
+ (UILabel *)addLabelOnSuperView:(UIView *)superView frame:(CGRect)frame text:(NSString *)text attributedText:(NSAttributedString *)attributedText font:(CGFloat)font textColor:(UIColor *)textColor textAlignment:(NSTextAlignment)textAlignment lineBreakMode:(NSLineBreakMode)lineBreakMode numberOfLines:(NSUInteger)numberOfLines backgroundColor:(UIColor *)backgroundColor{
    UILabel *label = [[UILabel alloc] initWithFrame:frame];
    
    label.font = [UIFont systemFontOfSize:font];
    label.textColor = textColor;
    label.textAlignment = textAlignment;
    label.numberOfLines = numberOfLines;
    label.lineBreakMode = lineBreakMode;
    label.backgroundColor = (backgroundColor == nil ? [UIColor clearColor] : backgroundColor);
    if (text.length > 0) {
        label.text = text;
    }
    if (attributedText.length > 0) {
        label.attributedText = attributedText;
    }
    [superView addSubview:label];
    return label;
}

//显示一行,不换行
+ (UILabel *)addSingleLineLabelOnSuperView:(UIView *)superView frame:(CGRect)frame text:(id)text fontSize:(CGFloat)fontSize color:(UIColor *)color alignment:(NSTextAlignment)alignment backgroundColor:(UIColor *)backgroundColor{
    NSString *labelText = nil;
    NSAttributedString *attributedText = nil;
    if ([text isKindOfClass:[NSString class]]) {
        labelText = text;
    }else if ([text isKindOfClass:[NSMutableAttributedString class]]){
        attributedText = text;
    }
    //
    return [self addLabelOnSuperView:superView
                               frame:frame
                                text:labelText
                      attributedText:attributedText
                                font:fontSize
                           textColor:color
                       textAlignment:alignment
                       lineBreakMode:NSLineBreakByTruncatingTail
                       numberOfLines:1
                     backgroundColor:backgroundColor];
}

//不限行数,自适应高度
+ (UILabel *)addAdaptiveHeightLabelOnSuperView:(UIView *)superView frame:(CGRect)frame text:(id)text fontSize:(CGFloat)fontSize color:(UIColor *)color alignment:(NSTextAlignment )alignment backgroundColor:(UIColor *)backgroundColor{
    
    NSString *labelText = nil;
    NSAttributedString *attributedText = nil;
    if ([text isKindOfClass:[NSString class]]) {
        labelText = text;
    }else if ([text isKindOfClass:[NSMutableAttributedString class]]){
        attributedText = text;
        labelText = attributedText.string;
    }
    
    frame.size.height = [HZUtilities sizeWithString:labelText font:fontSize constrainedToSize:CGSizeMake(frame.size.width, 10000)].height;
    
    //
    return [self addLabelOnSuperView:superView
                               frame:frame
                                text:labelText
                      attributedText:attributedText
                                font:fontSize
                           textColor:color
                       textAlignment:alignment
                       lineBreakMode:(IOS7DEVICE ? NSLineBreakByTruncatingTail:NSLineBreakByWordWrapping)
                       numberOfLines:0
                     backgroundColor:backgroundColor];
}

//限定行数label
+ (UILabel *)addLimitedNumberOfLinesLabelOnSuperView:(UIView *)superView frame:(CGRect)frame text:(id)text fontSize:(CGFloat)fontSize color:(UIColor *)color alignment:(NSTextAlignment )alignment numberOfLines:(NSInteger)numberOfLines backgroundColor:(UIColor *)backgroundColor{
    
    NSString *labelText = nil;
    NSAttributedString *attributedText = nil;
    if ([text isKindOfClass:[NSString class]]) {
        labelText = text;
    }else if ([text isKindOfClass:[NSMutableAttributedString class]]){
        attributedText = text;
        labelText = attributedText.string;
    }
    frame.size.height = [HZUtilities sizeWithString:labelText font:fontSize constrainedToSize:CGSizeMake(frame.size.width, 10000)].height;
    //
    return [self addLabelOnSuperView:superView
                               frame:frame
                                text:labelText
                      attributedText:attributedText
                                font:fontSize
                           textColor:color
                       textAlignment:alignment
                       lineBreakMode:NSLineBreakByTruncatingTail
                       numberOfLines:numberOfLines
                     backgroundColor:backgroundColor];
}

//纯文字button
+ (UIButton *)addTitleButtonOnSuperView:(UIView *)superView frame:(CGRect)frame normalTitle:(NSString *)normalTitle normalColor:(UIColor *)normalColor selectedTitle:(NSString *)selectedTitle  selectedColor:(UIColor *)selectedColor highlightedTitle:(NSString *)highlightedTitle highlightedColor:(UIColor *)highlightedColor fontSize:(CGFloat)fontSize backgroundColor:(UIColor *)backgroundColor tag:(NSInteger)tag target:(id)target action:(SEL)action{
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.backgroundColor = backgroundColor;
    button.titleLabel.backgroundColor = [UIColor clearColor];
    [button setExclusiveTouch:YES];
    
    button.frame = frame;
    button.titleLabel.font = [UIFont systemFontOfSize:fontSize];
    
    [button setTitle:normalTitle forState:UIControlStateNormal];
    [button setTitle:highlightedTitle forState:UIControlStateHighlighted];
    [button setTitle:selectedTitle forState:UIControlStateSelected];
    
    
    [button setTitleColor:normalColor forState:UIControlStateNormal];
    [button setTitleColor:selectedColor forState:UIControlStateSelected];
    [button setTitleColor:highlightedColor forState:UIControlStateHighlighted];
    //
    button.tag = tag;
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    //
    [superView addSubview:button];
    return button;
}

//纯图片button
+ (UIButton *)addImageButtonOnSuperView:(UIView *)superView frame:(CGRect)frame normalImg:(NSString *)normalImg highlightedImg:(NSString *)highlightedImg selectedImg:(NSString *)selectedImg tag:(NSInteger)tag target:(id)target action:(SEL)action{
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.backgroundColor = [UIColor clearColor];
    button.imageView.contentMode = UIViewContentModeScaleToFill;
    [button setExclusiveTouch:YES];
    
    button.frame = frame;
    [button setImage:[UIImage imageNamed:normalImg] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:highlightedImg] forState:UIControlStateHighlighted];
    [button setImage:[UIImage imageNamed:selectedImg] forState:UIControlStateSelected];
    
    //
    button.tag = tag;
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    //
    [superView addSubview:button];
    return button;
}

//混合型Button,图片是背景
+ (UIButton *)addMixtureButtonOnSuperView:(UIView *)superView frame:(CGRect)frame normalTitle:(NSString *)normalTitle normalColor:(UIColor *)normalColor  selectedTitle:(NSString *)selectedTitle selectedColor:(UIColor *)selectedColor highlightedTitle:(NSString *)highlightedTitle highlightedColor:(UIColor *)highlightedColor fontSize:(CGFloat)fontSize normalImg:(NSString *)normalImg selectedImg:(NSString *)selectedImg highlightedImg:(NSString *)highlightedImg tag:(NSInteger)tag target:(id)target action:(SEL)action{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.backgroundColor = [UIColor clearColor];
    button.titleLabel.backgroundColor = [UIColor clearColor];
    [button setExclusiveTouch:YES];
    
    button.frame = frame;
    button.titleLabel.font = [UIFont systemFontOfSize:fontSize];
    
    [button setTitle:normalTitle forState:UIControlStateNormal];
    [button setTitle:selectedTitle forState:UIControlStateSelected];
    [button setTitle:highlightedTitle forState:UIControlStateHighlighted];
    
    [button setTitleColor:normalColor forState:UIControlStateNormal];
    [button setTitleColor:selectedColor forState:UIControlStateSelected];
    [button setTitleColor:highlightedColor forState:UIControlStateHighlighted];
    
    [button setBackgroundImage:[UIImage imageNamed:normalImg] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageNamed:selectedImg] forState:UIControlStateSelected];
    [button setBackgroundImage:[UIImage imageNamed:highlightedImg] forState:UIControlStateHighlighted];
    //
    button.tag = tag;
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    //
    [superView addSubview:button];
    return button;
}

// 高亮
+ (UIButton *)addHightButtonOnSuperView:(UIView *)superView frame:(CGRect)frame normalTitle:(NSString *)normalTitle hightedTitle:(NSString *)highedTitle normalColor:(UIColor *)normalColor highedColor:(UIColor *)highedColor fontSize:(CGFloat)fontSize normalImg:(NSString *)normalImg highlightedImg:(NSString *)highlightedImg tag:(NSInteger)tag target:(id)target action:(SEL)action
{
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.backgroundColor = [UIColor clearColor];
    button.titleLabel.backgroundColor = [UIColor clearColor];
    [button setExclusiveTouch:YES];
    
    button.frame = frame;
    button.titleLabel.font = [UIFont systemFontOfSize:fontSize];
    
    [button setTitle:normalTitle forState:UIControlStateNormal];
    [button setTitle:highedTitle forState:UIControlStateHighlighted];
    
    [button setTitleColor:normalColor forState:UIControlStateNormal];
    [button setTitleColor:highedColor forState:UIControlStateHighlighted];
    
    [button setBackgroundImage:[UIImage imageNamed:normalImg] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageNamed:highlightedImg] forState:UIControlStateHighlighted];
    
    //
    button.tag = tag;
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    //
    [superView addSubview:button];
    return button;
}

//简单的ImageView
+ (UIImageView *)addImageViewOnSuperView:(UIView *)superView frame:(CGRect)frame imageName:(NSString *)imageName{
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:frame];
    imageView.image = [UIImage imageNamed:imageName];
    [superView addSubview:imageView];
    return imageView;
}

////默认分割线
+ (UIView *)addSeperationLineOnSuperView:(UIView *)superView lineColor:(UIColor *)lineColor{
   return [self addLineOnSuperView:superView
                             frame:CGRectMake(0, 0, KSCREEN_WIDTH, 1.0/2)
                            colorL:lineColor];
}
//自定线条
+ (UIView *)addLineOnSuperView:(UIView *)superView frame:(CGRect)frame colorL:(UIColor *)color{
    
    UIView *lineView = [[UIView alloc] initWithFrame:frame];
    [lineView setBackgroundColor:color];
    [superView addSubview:lineView];
    return lineView;
}

//自定义混搭颜色的标题label(keywords和 keywordscolor的颜色一一对应)
+(UILabel *)addLabelChangeColor:(UILabel **)lab AtFrame:(CGRect)frame text:(NSString *)text  textColor:(UIColor *) textColor textFont:(CGFloat)textFont superView:(UIView *)superView keyWords:(NSArray<NSString *> *)keywords keyWordsColor:(NSArray<UIColor *> *)keywordsColor numberOfLines:(NSInteger)numberOfLines
{
    UILabel *label = [[UILabel alloc]initWithFrame:frame];
    label.textAlignment = NSTextAlignmentLeft;
    label.font = [UIFont systemFontOfSize:textFont];
    label.numberOfLines = numberOfLines;
    label.textColor = textColor;
    label.backgroundColor = [UIColor clearColor];
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 6.0 ) {
        NSMutableAttributedString *textAtt = [[NSMutableAttributedString alloc]initWithString:SFSTR(text)];
        for (int i = 0 ; i < keywords.count; i ++) {
            NSRange range = [text rangeOfString:keywords[i]];
            [textAtt addAttribute:NSForegroundColorAttributeName value:keywordsColor[i] range:range];
        }
        label.attributedText = textAtt;
    }else{
        label.text = SFSTR(text);
    }
    
    [superView addSubview:label];
    return label;
}

//自定义混搭颜色(可加粗)的标题label(数组里放字典,字典key值固定keyWords,keyColor,keyBold(分明为关键词,颜色,加粗,keyBord为bold时加粗))
+(void)addBoldLabelChangeColor:(UILabel **)lab AtFrame:(CGRect)frame text:(NSString *)text  textColor:(UIColor *) textColor textFont:(CGFloat)textFont superView:(UIView *)superView keyWordDictArr:(NSArray *)keyWordDictArr numberOfLines:(NSInteger)numberOfLines
{
    UILabel *label = [[UILabel alloc]initWithFrame:frame];
    label.textAlignment = NSTextAlignmentLeft;
    label.font = [UIFont systemFontOfSize:textFont];
    label.numberOfLines = numberOfLines;
    label.textColor = textColor;
    label.backgroundColor = [UIColor clearColor];
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 6.0 ) {
        NSMutableAttributedString *textAtt = [[NSMutableAttributedString alloc]initWithString:SFSTR(text)];
        for (int i = 0 ; i < keyWordDictArr.count; i ++) {
            NSDictionary *dict=(NSDictionary *)keyWordDictArr[i];
            NSRange range = [text rangeOfString:[dict objectForKey:@"keyWords"]];
            [textAtt addAttribute:NSForegroundColorAttributeName value:[dict objectForKey:@"keyColor"] range:range];
            if ([[dict objectForKey:@"keyBold"] isEqualToString:@"bold"]) {
                [textAtt addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"HelveticaNeue-Bold" size:textFont] range:range];
            }
        }
        label.attributedText = textAtt;
        
    }else{
        label.text = SFSTR(text);
    }
    
    [superView addSubview:label];
    if (lab) {
        *lab = label;
    }
}

//图片处理(压缩) 处理到符合上传大小限制
+(UIImage *)useImage:(UIImage *)image
{
    @autoreleasepool {
        float  scales = image.size.height / image.size.width;
        UIImage * normalImg;
        NSData *newData;
        if (image.size.width >600 || image.size.height > 600) {
            if (scales > 1) {
                normalImg = [self imageWithImageSimple:image scaledToSize:CGSizeMake(600 / scales, 600)];
            }else {
                normalImg = [self imageWithImageSimple:image scaledToSize:CGSizeMake(600 ,600 * scales)];
            }
        }
        else {
            normalImg=image;
        }
        
        CGSize newSize = CGSizeMake(normalImg.size.width, normalImg.size.height);
        UIGraphicsBeginImageContext(newSize);
        [normalImg drawInRect:CGRectMake(0,0,newSize.width,newSize.height)];
        UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        float kk=1.0f;//图片压缩系数
        int mm;//压缩后的大小
        float aa=0.1f;//图片压缩系数变化步长(可变)
        mm=(int)UIImageJPEGRepresentation(newImage, kk).length;
        
        while (mm/1024>450) {
            if (kk>aa+aa/10) {
                kk-=aa;
                if (mm==UIImageJPEGRepresentation(newImage, kk).length) {
                    break;
                }
                mm=(int)UIImageJPEGRepresentation(newImage, kk).length;
            }else{
                aa/=10;
            }
        }
        newData=UIImageJPEGRepresentation(newImage, kk);//最后压缩结果
        if (newData.length/1024>450) {
            return nil;
        }else{
            UIImage * image = [UIImage imageWithData:newData];
            return image;
            
        }
    }
}

//图片缩放
+(UIImage*)imageWithImageSimple:(UIImage*)image scaledToSize:(CGSize)newSize
{
    UIGraphicsBeginImageContext(newSize);
    [image drawInRect:CGRectMake(0,0,newSize.width,newSize.height)];
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}


// iOS6 处理行间距
+(NSMutableAttributedString *)attributedStringWithLabel:(UILabel *)label withLineSpacing:(CGFloat)lineSpacing
{
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc]initWithString:SFSTR(label.text)];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc]init];
    [paragraphStyle setLineSpacing:lineSpacing];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, label.text.length)];
    label.attributedText=attributedString;
    [label sizeToFit];
    return attributedString;
}

// 不同情况的背景图
+ (UIImage *)backgroundImageForButtonWithBounds:(CGRect)bounds backGroundColor:(UIColor *)backGroundColor
{//自绘了一张背景图
    
    CGRect canvasRect = bounds;
    CGRect paintingRect = CGRectMake(0, 0, canvasRect.size.width, canvasRect.size.height);;
    UIGraphicsBeginImageContext(canvasRect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    if (backGroundColor) {
        CGContextSetFillColorWithColor(context, backGroundColor.CGColor);
    } else {
        CGContextSetFillColorWithColor(context, [[UIColor whiteColor] CGColor]);
    }
    CGContextFillRect(context, paintingRect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}


//去空格方法
+ (NSString *)noSpaceStr:(NSString *)string{
    NSString *noSpaceStr = [string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    return noSpaceStr;
}

//字体大小自适应宽度
+ (UIFont *)adjustViewSize:(CGSize)size string:(NSString *)string font:(CGFloat)font minFont:(CGFloat)minFont minMargin:(CGFloat)minMargin{
    CGSize roomhallSize = [HZUtilities sizeWithString:string font:font constrainedToSize:size];
    while ((roomhallSize.width +2*minMargin) >= size.width && font >= minFont && minFont >=0 && font >= 0) {
        font--;
        roomhallSize = [HZUtilities sizeWithString:string font:font constrainedToSize:size];
    }
    return [UIFont systemFontOfSize:font];
}

//字体 size
+ (CGSize)sizeWithString:(NSString *)string font:(CGFloat)font constrainedToSize:(CGSize)size{
    
    if (IOS7DEVICE) {
        return [string boundingRectWithSize:size
                                    options:NSStringDrawingUsesLineFragmentOrigin
                                 attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:font]}
                                    context:nil].size;
    }else
    {
        return [string sizeWithFont:[UIFont systemFontOfSize:font]
                  constrainedToSize:size
                      lineBreakMode:NSLineBreakByTruncatingTail];
    }
}


//添加圆角方法
+ (void)setCornerView:(UIView *)view borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor cornerRadius:(CGFloat)cornerRadius masksToBounds:(BOOL)masksToBounds{
    
    if ([view isKindOfClass:[UIView class]] || [view isMemberOfClass:[UIView class]]) {
        
        view.layer.borderWidth = borderWidth;
        view.layer.borderColor = borderColor.CGColor;
        view.layer.cornerRadius = cornerRadius;
        view.layer.masksToBounds = masksToBounds;
    }
}

//http://my.oschina.net/leejan97/blog/307491
//从十六进制字符串获取颜色
+ (UIColor *)colorWithHexString:(NSString *)color alpha:(CGFloat)alpha
{
    //删除字符串中的空格
    NSString *cString = [[color stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    // String should be 6 or 8 characters
    if ([cString length] < 6){
        return [UIColor clearColor];
    }
    // strip 0X if it appears
    //如果是0x开头的，那么截取字符串，字符串从索引为2的位置开始，一直到末尾
    if ([cString hasPrefix:@"0X"]){
        cString = [cString substringFromIndex:2];
    }
    //如果是#开头的，那么截取字符串，字符串从索引为1的位置开始，一直到末尾
    if ([cString hasPrefix:@"#"]){
        cString = [cString substringFromIndex:1];
    }
    if ([cString length] != 6){
        return [UIColor clearColor];
    }
    
    // Separate into r, g, b substrings
    NSRange range;
    range.location = 0;
    range.length = 2;
    //r
    NSString *rString = [cString substringWithRange:range];
    //g
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    //b
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    return [UIColor colorWithRed:((float)r / 255.0f) green:((float)g / 255.0f) blue:((float)b / 255.0f) alpha:alpha];
}

//默认alpha值为1
+ (UIColor *)colorWithHexString:(NSString *)color
{
    return [self colorWithHexString:color alpha:1.0f];
}

@end
