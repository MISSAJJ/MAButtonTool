//
//  MAMoreItemsBtnViewController.m
//  MAButtonTool
//
//  Created by Song Liang on 16/4/5.
//  Copyright © 2016年 MISSAJJ. All rights reserved.
//

#import "MAMoreItemsBtnViewController.h"
#import "MAButtonTool.h"

@interface MAMoreItemsBtnViewController ()

@end

@implementation MAMoreItemsBtnViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    //顶部左按钮
    [self leftMoreBtn];
    
    //顶部右边的 block 按钮
    [self rightMoreBtn];
    
    
    
}

#pragma mark ==顶部左边的按钮==
- (void)leftMoreBtn
{
    self.navigationItem.leftBarButtonItems = @[
                                               [MAButtonTool createButtonWithImage:@"back" position:MAButtonToolPostionLeft target:self action:@selector(shareMethod) type:MAButtonToolTypeCustom],
                                               [MAButtonTool createButtonWithImage:@"list" position:MAButtonToolPostionLeft target:self action:@selector(shareMethod) type:MAButtonToolTypeCustom],
                                               [MAButtonTool createButtonWithImage:@"data" position:MAButtonToolPostionLeft target:self action:@selector(shareMethod) type:MAButtonToolTypeCustom]
                                               ];
}


#pragma mark == block 顶部右边的按钮==
- (void)rightMoreBtn
{
    self.navigationItem.rightBarButtonItems =@[
    [MAButtonTool createButtonWithImage:nil position:MAButtonToolPostionRight type:MAButtonToolTypeShare actionBlock:^(UIButton *btn) {
        
        [self shareMethod];
        NSLog(@"rightTopBlockBtn");
        
    }],
    
    [MAButtonTool createButtonWithImage:@"set" position:MAButtonToolPostionRight type:MAButtonToolTypeCustom actionBlock:^(UIButton *btn) {
        
        [self shareMethod];
        NSLog(@"rightTopBlockBtn");
        
    }]
    ];
}


@end
