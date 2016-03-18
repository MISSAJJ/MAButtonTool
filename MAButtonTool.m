//
//  MAButtonTool.m
//
//  Created by MISSAJJ on 16/3/18.
//  Copyright © 2016年 MISSAJJ. All rights reserved.
//
/**
 @author https://github.com/MISSAJJ (MISSAJJ), 更新日期:  16-03-19 03:37:43
 
 为了节约时间,提高创建按钮控件的效率,特抽出一个创建各种按钮的类方法
 
 支持：
 1,图片按钮 (默认居中按钮，左返回按钮，右分享按钮)
 2,自定义文字图片靠左靠右按钮
 3,按项目需求，设定了按钮样式和位置样式
 4,只要修改一下分享和返回按钮图片就可以直接应用到项目中了
 5,由于美工给的图片素材尺寸会不同,所以按钮的frame和setImageEdgeInsets可根据项目素材情况在VC层创建后重写调整
 
 另： 导航栏左右多个按钮创建［后续抽空再实现吧］
 
 使用方法案例:
 
 #pragma mark ==顶部右边的按钮==
 - (void)rightTopBtn
 {
 self.navigationItem.rightBarButtonItem = [MAButtonTool createButtonWithImage:@"share" position:MAButtonToolPostionRight target:self action:@selector(shareMethod) type:MAButtonToolTypeShare];
 }
 
 #pragma mark ==顶部左边的按钮==
 - (void)leftTopBtn
 {
 self.navigationItem.leftBarButtonItem = [MAButtonTool createButtonWithImage:@"set_black" position:MAButtonToolPostionLeft target:self action:@selector(goToSetup) type:MAButtonToolTypeCustom];
 }

 
 //单独创建右边分享按钮
UIButton * shareBtn = [MAButtonTool createRightShareButton];
[shareBtn addTarget:self action:@selector(shareMethod) forControlEvents:UIControlEventTouchUpInside];
self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:shareBtn];

 */
#import "MAButtonTool.h"
@implementation MAButtonTool


#pragma mark ==[自定义图片按钮]==
+ (UIButton *)createButton:(NSString *)imageStr
{
    UIImage * image = [UIImage imageNamed:imageStr];
    UIButton* btn= [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 0, 40, 40);
    [btn setImageEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 0)];
    [btn setImage:image forState:UIControlStateNormal];
    [btn setShowsTouchWhenHighlighted:YES];
    
    return btn;
}
#pragma mark ==[左自定义图片按钮]==
+ (UIButton *)createLeftButton:(NSString *)imageStr
{
    UIButton* btn= [self createButton:imageStr];
    [btn setImageEdgeInsets:UIEdgeInsetsMake(0, -10, 0, 10)];
    return btn;
}
#pragma mark ==[右自定义图片按钮]==
+ (UIButton*)createRightButton:(NSString*)imageStr
{
    UIButton* btn=[self createButton:imageStr];
    [btn setImageEdgeInsets:UIEdgeInsetsMake(0, 10, 0, -10)];
    return btn;
    
}

#pragma mark ==[左返回按钮]==
+ (UIButton*)createLeftBackButton
{
    UIButton* btn= [self createButton:@"backarrow_black"];
    btn.frame = CGRectMake(0, 0, 50, 50);
    [btn setImageEdgeInsets:UIEdgeInsetsMake(0, -20, 0, 20)];
    return btn;
}

#pragma mark ==[右分享按钮]==
+ (UIButton*)createRightShareButton
{
    UIButton* btn= [self createButton:@"share_black"];
    btn.frame = CGRectMake(0, 0, 35, 35);
    [btn setImageEdgeInsets:UIEdgeInsetsMake(0, 10, 0, -10)];
    return btn;
}

#pragma mark ==[自定义 导航栏 左边按钮]==
+(UIBarButtonItem *)createButtonWithImage:(NSString *)imageStr position:(MAButtonToolPostion)position target:(id)target action:(SEL)action type:(MAButtonToolType)type
{
    UIButton* btn;
    
    if (position == MAButtonToolPostionLeft) { //位置靠左
        if (type ==MAButtonToolTypeBack) {  //返回按钮
            btn = [self createLeftBackButton];
        }else{
            btn = [self createLeftButton:imageStr]; //默认靠左按钮
        }
        
    }else if (position == MAButtonToolPostionRight) { //位置靠右
        if (type ==MAButtonToolTypeShare) {  //分享按钮
            btn = [self createRightShareButton];
        }else{
            btn = [self createRightButton:imageStr];//默认考右按钮
        }
        
    }else {  //位置中间
        btn = [self createButton:imageStr];
    }
    
     [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    return [[UIBarButtonItem alloc]initWithCustomView:btn];
}

#pragma mark ==[自定义 导航栏 左边按钮]==
+ (UIBarButtonItem *)initWithTitle:(NSString *)title titleColor:(UIColor *)titleColor target:(id)target action:(SEL)action
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 0, 40, 40);
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:titleColor forState:UIControlStateNormal];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:btn];
    return item;
}



@end
