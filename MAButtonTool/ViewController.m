//
//  ViewController.m
//  MAButtonTool
//
//  Created by MISSAJJ on 16/4/4.
//  Copyright © 2016年 MISSAJJ. All rights reserved.
//

#import "ViewController.h"
#import "MAButtonTool.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    
    
    
    //顶部左边的按钮
    [self leftTopBtn];
    
    //单独创建左边返回按钮
    //[self customleftTopBtn];
    
    
    //顶部右边的 block 按钮
    [self rightTopBlockBtn];
    
    //顶部右边的按钮
    //[self rightTopBtn];
    
    
    
    //创建自定义图片按钮
    UIButton * customBtn = [MAButtonTool createButton:@"114"];
    customBtn.center = self.view.center;
    [customBtn addTarget:self action:@selector(shareMethod) forControlEvents:UIControlEventTouchUpInside];
   
    [self.view addSubview:customBtn];
    
    
    
    //block方式创建图片按钮
    UIButton * blockBtn1 = [MAButtonTool createBlockButton:@"MADesignNote_Work_2" :^(UIButton *btn) {
        
        [self shareMethod];
    }];
    
    blockBtn1.frame = CGRectMake(customBtn.frame.origin.x -50 , customBtn.frame.origin.y + 100, customBtn.frame.size.width + 100, customBtn.frame.size.height + 150);
    
    [self.view addSubview:blockBtn1];
    
    
    
    
}

#pragma mark ==顶部左边的按钮==
- (void)leftTopBtn
{
    
    self.navigationItem.leftBarButtonItem = [MAButtonTool createButtonWithImage:@"set_black" position:MAButtonToolPostionLeft target:self action:@selector(shareMethod) type:MAButtonToolTypeCustom];
}


#pragma mark ==单独创建自定义按钮==
- (void)customleftTopBtn
{
    UIButton * backBtn = [MAButtonTool createLeftBackButton];
    [backBtn addTarget:self action:@selector(shareMethod) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:backBtn];}


#pragma mark ==顶部右边的按钮==
- (void)rightTopBtn
{
    self.navigationItem.rightBarButtonItem = [MAButtonTool createButtonWithImage:nil position:MAButtonToolPostionRight target:self action:@selector(shareMethod) type:MAButtonToolTypeShare];
}

#pragma mark == block 顶部右边的按钮==
- (void)rightTopBlockBtn
{
    self.navigationItem.rightBarButtonItem = [MAButtonTool createButtonWithImage:nil position:MAButtonToolPostionRight type:MAButtonToolTypeShare :^(UIButton *btn) {
        
         [self shareMethod];
        NSLog(@"rightTopBlockBtn");
        
    }];
}




- (void)shareMethod {
    
    NSString *string = @"MAButtonTool－－by MISSAJJ";
    NSURL *URL = [NSURL URLWithString:@"https://github.com/MISSAJJ/MAButtonTool"];
    
    UIActivityViewController *activityViewController =
    [[UIActivityViewController alloc] initWithActivityItems:@[string, URL]
                                      applicationActivities:nil];
    [self presentViewController:activityViewController
                       animated:YES
                     completion:^{
                         // ...
                     }];
    
    
}

@end
