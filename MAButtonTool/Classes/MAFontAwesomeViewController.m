//
//  MAFontAwesomeViewController.m
//  MAButtonTool
//
//  Created by MISSAJJ on 16/5/7.
//  Copyright © 2016年 MISSAJJ. All rights reserved.
//
/*
 更新日期： 2016年5月8日
 使用方法：
 1，引入ios-fontawesome，具体使用方法和源代码地址请看原作者Github描述
    https://github.com/alexdrone/ios-fontawesome
 
 2，重要：在项目工程 Info.plist 添加 Fonts provided by application --> FontAwesome.ttf
 
 3，关于FontAwesome图标的代码，请参看 http://fortawesome.github.io/Font-Awesome/icons
 
 4，头部引入UIImage+FontAwesome.h
 
*/
#import "MAFontAwesomeViewController.h"
#import "MAButtonTool.h"
#import "UIImage+FontAwesome.h"
@implementation MAFontAwesomeViewController
- (void)viewDidLoad {
    
    [super viewDidLoad];
 
    //顶部左边的FontAwesome block 按钮
    [self leftFontAwesomeBlockBtn];
    
    //顶部右边的FontAwesome block 按钮
    [self rightFontAwesomeBlockBtn];
    
}

#pragma mark == 顶部左边的FontAwesome block 按钮==
- (void)leftFontAwesomeBlockBtn
{
    //创建FontAwesome按钮
    UIImage *icon = [UIImage imageWithIcon:@"fa-github" backgroundColor:nil iconColor:[UIColor whiteColor] fontSize:30];
    
    
    self.navigationItem.leftBarButtonItem =
    [MAButtonTool createButtonWithImage:icon position:MAButtonToolPostionLeft type:MAButtonToolTypeCustom actionBlock:^(UIButton *btn) {
        
        
      [self showHUDText:@"FontAwesome Block UIBarButtonItem" detailStr:@"\nUIImage *icon = [UIImage imageWithIcon:@\"fa-github\" backgroundColor:nil iconColor:[UIColor whiteColor] fontSize:30];\n\n[MAButtonTool createButtonWithImage:icon position:MAButtonToolPostionLeft type:MAButtonToolTypeCustom actionBlock:^(UIButton *btn) { }];"];
        
    }];
}

#pragma mark ==顶部右边的FontAwesome block 按钮==
- (void)rightFontAwesomeBlockBtn
{
    
    //创建FontAwesome按钮
    UIImage *icon = [UIImage imageWithIcon:@"fa-futbol-o" backgroundColor:nil iconColor:[UIColor yellowColor] fontSize:25];
    
    
    self.navigationItem.rightBarButtonItem =
    [MAButtonTool createButtonWithImage:icon position:MAButtonToolPostionRight type:MAButtonToolTypeCustom actionBlock:^(UIButton *btn) {
        
      [self showHUDText:@"FontAwesome Block UIBarButtonItem" detailStr:@"\nUIImage *icon = [UIImage imageWithIcon:@\"fa-futbol-o\" backgroundColor:nil iconColor:[UIColor yellowColor] fontSize:25];\n\n[MAButtonTool createButtonWithImage:icon position:MAButtonToolPostionRight type:MAButtonToolTypeCustom actionBlock:^(UIButton *btn) { }];"];
        
    }];
}
@end
