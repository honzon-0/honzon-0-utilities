//
//  ViewController.m
//  HZUtilities-Example
//
//  Created by Honzon-0 on 15/12/4.
//  Copyright © 2015年 Honzon-0. All rights reserved.
//

#import "ViewController.h"
#import "HZUtilities.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [HZUtilities colorWithHexString:@"#fafafa"];
    
    [self addLabel];
    
    [self addSingleLabel];
    
    [self addAdaptiveHeightLabel];
    
    [self addLimitedNumberOfLinesLabel];
    
    [self addTitleButton];
    
    [self addImageButton];
    
    
    
}
#pragma mark UILabel
- (void)addLabel{
    NSString *text = @"自定义Label 自适应宽度";
    [HZUtilities addLabelOnSuperView:self.view
                               frame:CGRectMake(10, 32, [HZUtilities sizeWithString:text font:14 constrainedToSize:CGSizeMake(100000, 40)].width, 40)
                                text:text
                      attributedText:nil
                                font:14
                           textColor:[HZUtilities colorWithHexString:@"#333333"]                       textAlignment:NSTextAlignmentLeft
                       lineBreakMode:NSLineBreakByWordWrapping
                       numberOfLines:1
                     backgroundColor:[HZUtilities colorWithHexString:@"#e0e0e0"]];
}

- (void)addSingleLabel{
    NSString *text = @"SingleLabel";
    [HZUtilities addSingleLineLabelOnSuperView:self.view
                                         frame:CGRectMake(10, 82,50, 40)
                                          text:text
                                      fontSize:14
                                         color:[HZUtilities colorWithHexString:@"#333333"]
                                     alignment:NSTextAlignmentCenter
                               backgroundColor:[HZUtilities colorWithHexString:@"#e3e3e3"]];
    
}
- (void)addAdaptiveHeightLabel{
    NSString *text = @"AdaptiveHeightLabel";
    [HZUtilities addAdaptiveHeightLabelOnSuperView:self.view
                                             frame:CGRectMake(70, 82,50, 40)
                                              text:text
                                          fontSize:14
                                             color:[HZUtilities colorWithHexString:@"#333333"]
                                         alignment:NSTextAlignmentLeft
                                   backgroundColor:[HZUtilities colorWithHexString:@"#eeeeee"]];
}

- (void)addLimitedNumberOfLinesLabel{
    NSString *text = @"LimitedNumberOfLinesLabel";
    [HZUtilities addLimitedNumberOfLinesLabelOnSuperView:self.view
                                                   frame:CGRectMake(10, 142,70, 20)
                                                    text:text
                                                fontSize:14
                                                   color:[HZUtilities colorWithHexString:@"#333333"]
                                               alignment:NSTextAlignmentLeft
                                           numberOfLines:2
                                         backgroundColor:[HZUtilities colorWithHexString:@"#F7F7F7"]];
}

#pragma mark UIButton
- (void)addTitleButton{
    NSString *title = @"TitleButton";
    NSString *selectedTitle = @"TitleButton selected";
    NSString *highlightedTitle = @"addTitleButton highlighted";
    UIButton *bnt = [HZUtilities addTitleButtonOnSuperView:self.view
                                     frame:CGRectMake(KSCREEN_WIDTH - 140,32 ,130, 40)
                               normalTitle:title
                               normalColor:[HZUtilities colorWithHexString:@"#333333"]
                             selectedTitle:selectedTitle
                             selectedColor:[HZUtilities colorWithHexString:@"#9fc7a3"]
                          highlightedTitle:highlightedTitle
                          highlightedColor:[HZUtilities colorWithHexString:@"#333333"]
                                  fontSize:14
                           backgroundColor:[HZUtilities colorWithHexString:@"#ff8000"]
                                       tag:10
                                    target:self
                                    action:@selector(titleButtonClick:)];
    [bnt setBackgroundColor:[HZUtilities colorWithHexString:@"#b9b6f9"] forState:UIControlStateHighlighted];
}


-(void)titleButtonClick:(UIButton *)button{
    NSLog(@"%@",button.currentTitle);
}


- (void)addImageButton{
    NSString *imageString = @"Classic.png";
    UIButton *bnt = [HZUtilities addImageButtonOnSuperView:self.view
                                     frame:CGRectMake(KSCREEN_WIDTH - 140, 82, 40, 40)
                                 normalImg:imageString
                            highlightedImg:nil
                               selectedImg:nil
                                       tag:11
                                    target:self
                                    action:@selector(imageButtonClick:)];
    [HZUtilities setCornerView:bnt borderWidth:1 borderColor:[UIColor whiteColor] cornerRadius:20 masksToBounds:YES];
}
- (void)imageButtonClick:(UIButton *)button{
    NSLog(@"imageButtonClick");
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
