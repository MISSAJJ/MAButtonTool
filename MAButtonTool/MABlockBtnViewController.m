//
//  MABlockBtnViewController.m
//  MAButtonTool
//
//  Created by Song Liang on 16/4/5.
//  Copyright © 2016年 MISSAJJ. All rights reserved.
//

#import "MABlockBtnViewController.h"
#import "MAButtonTool.h"
@interface MABlockBtnViewController ()

@end

@implementation MABlockBtnViewController


- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    //顶部左边的按钮
    [self leftBlockBtn];
    
    //顶部右边的 block 按钮
    [self rightBlockBtn];
    
}

#pragma mark == block 顶部左按钮==
- (void)leftBlockBtn
{
    self.navigationItem.leftBarButtonItem =
    [MAButtonTool createButtonWithImage:@"set" position:MAButtonToolPostionLeft type:MAButtonToolTypeCustom actionBlock:^(UIButton *btn) {
        
        [self shareMethod];
        NSLog(@"rightTopBlockBtn");
        
    }];
}

#pragma mark ==顶部右按钮==
- (void)rightBlockBtn
{
    self.navigationItem.rightBarButtonItem =
    [MAButtonTool createButtonWithImage:nil position:MAButtonToolPostionRight type:MAButtonToolTypeShare actionBlock:^(UIButton *btn) {
        
        [self shareMethod];
        NSLog(@"rightTopBlockBtn");
        
    }];
}




@end
