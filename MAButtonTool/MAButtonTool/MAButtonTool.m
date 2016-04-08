//
//  MAButtonTool.m
//
//  Created by MISSAJJ on 16/3/18.
//  Copyright © 2016年 MISSAJJ. All rights reserved.
//
/**
 @author https://github.com/MISSAJJ (MISSAJJ), 更新日期:  16-04-08 03:37:43
 
 为了节约时间,提高创建按钮控件的效率,特抽出一个创建各种按钮的类方法
 
 支持：
 1,图片按钮 (默认居中按钮，左返回按钮，右分享按钮)
 2,自定义文字图片靠左靠右按钮
 3,按项目需求，设定了按钮样式和位置样式
 4,只要修改一下分享和返回按钮图片就可以直接应用到项目中了
 5,由于美工给的图片素材尺寸会不同,所以按钮的frame和setImageEdgeInsets可根据项目素材情况在VC层创建后重写调整
 6,支持block调用按钮事件
 
 
 另： 导航栏左右多个按钮创建［后续抽空再实现吧］
 
 使用方法请看:https://github.com/MISSAJJ/MAButtonTool
 
 
 */
#import "MAButtonTool.h"
#import "UIButton+block.h"
@implementation MAButtonTool 

#pragma mark ==[自定义图片按钮]==
+ (UIButton *)createButton:(NSString * __nullable)imageStr
{
    UIImage * image = [UIImage imageNamed:imageStr];
    UIButton* btn= [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 0, 40, 40);
    [btn setImageEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 0)];
    [btn setImage:image forState:UIControlStateNormal];
    //按钮发光
    [btn setShowsTouchWhenHighlighted:YES];
    [btn setAdjustsImageWhenHighlighted:YES]; 
    return btn;
}

#pragma mark ==[创建自定义 Block 图片按钮]==
+ (UIButton *)createBlockButton:(NSString *)imageStr :(ButtonBlock)block
{
    UIImage * image = [UIImage imageNamed:imageStr];
    UIButton* btn= [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 0, 40, 40);
    [btn setImageEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 0)];
    [btn setImage:image forState:UIControlStateNormal];
    //按钮发光
    //[btn setShowsTouchWhenHighlighted:YES];
    [btn setAdjustsImageWhenHighlighted:YES];
    [btn addTouchAction:^(UIButton *btn) {
        
        if (block)
        {
            block(btn);
        }
        
    }];
    
    return btn;
}
#pragma mark ==[左按钮]==
+ (UIButton *)createLeftButton:(NSString *)imageStr
{
    UIButton* btn= [self createButton:imageStr];
    [btn setImageEdgeInsets:UIEdgeInsetsMake(0, -10, 0, 10)];
    return btn;
}

#pragma mark ==[右按钮]==
+ (UIButton*)createRightButton:(NSString*)imageStr
{
    UIButton* btn=[self createButton:imageStr];
    [btn setImageEdgeInsets:UIEdgeInsetsMake(0, 10, 0, -10)];
    return btn;
    
}

#pragma mark ==[左返回按钮]==
+ (UIButton*)createLeftBackButton
{
    UIButton* btn= [self createButton:@"back"];
    btn.frame = CGRectMake(0, 0, 50, 50);
    [btn setImageEdgeInsets:UIEdgeInsetsMake(0, -20, 0, 20)];
    return btn;
}

#pragma mark ==[右分享按钮]==
+ (UIButton*)createRightShareButton
{
    UIButton* btn= [self createButton:@"share"];
    btn.frame = CGRectMake(0, 0, 35, 35);
    [btn setImageEdgeInsets:UIEdgeInsetsMake(0, 10, 0, -10)];
    return btn;
}

#pragma mark ==[自定义 导航栏 按钮]==
+(UIBarButtonItem *)createButtonWithImage:(NSString * __nullable)imageStr position:(MAButtonToolPostion)position target:(id)target action:(SEL)action type:(MAButtonToolType)type
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


#pragma mark ==[自定义 block 导航栏 按钮]==
+(UIBarButtonItem *)createButtonWithImage:(NSString * __nullable)imageStr position:(MAButtonToolPostion)position type:(MAButtonToolType)type actionBlock:(ButtonItemBlock)block
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
    
    [btn addTouchAction:^(UIButton *btn) {
        
        if (block)
        {
            block(btn);
        }
        
    }];
    
  
    return [[UIBarButtonItem alloc]initWithCustomView:btn];
}


#pragma mark ==[自定义 文字按钮]==
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
