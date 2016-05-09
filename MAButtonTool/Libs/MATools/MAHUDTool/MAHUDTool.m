//
//  MAHUDTool.m
//
//  Created by MISSAJJ on 16/3/4.
//  Copyright © 2016年 MISSAJJ. All rights reserved.
//

/**
 *  @author https://github.com/MISSAJJ (MISSAJJ), 更新日期: 16-03-04 13:03:43
 *
 *  将HUD提示框单独抽出一个单例工具类, 目前使用的是MBProgressHUD, 
    后期如果项目需要换SVProgressHUD,JGProgressHUD等其他HUD,只需要在这个类里单独改写
 *
 */
#import "MAHUDTool.h"

@implementation MAHUDTool

//创建单例
singleton_implementation(MAHUDTool)


#pragma mark ==创建HUD==
- (void)addHUDWithView:(UIView *)view{
    
    //如果有HUD,先清除
    if (HUD) {
        [self hudWasHidden:HUD];
    }
    
    //如果设置了view
    if (view) {
    
        HUD=[MBProgressHUD showHUDAddedTo:view animated:YES];
        
    }else{ //没有设置view,默认创建在window
    
        HUD=[MBProgressHUD showHUDAddedTo:MAKeyWindow animated:YES];
    }
    
    //隐藏时候从父控件中移除
    HUD.removeFromSuperViewOnHide = YES;
    HUD.mode = MBProgressHUDModeText;
    //设置代理
    [HUD setDelegate:self];

}
#pragma mark ==清除HUD==
- (void)hudWasHidden:(MBProgressHUD *)hud {
    // Remove HUD from screen when the HUD was hidded
    HUD.delegate = nil;
    [HUD removeFromSuperview];
    HUD = nil;
}
#pragma mark ==显示HUD==
- (void)showHUDInView: (UIView *)view withString:(NSString *)string
{
    //创建HUD
    [self addHUDWithView:view];
    
    //设置HUD文字
    HUD.labelText = string;
 
    //显示HUD
    [HUD show:YES];
 }
#pragma mark ==显示DetailTextHUD==
- (void)showHUDInView: (UIView *)view withString:(NSString *)string detailString:(NSString *)detailString
{
    //创建HUD
    [self addHUDWithView:view];
    
    //设置HUD文字
    HUD.labelText = string;
    //设置详细文字
    HUD.detailsLabelText = detailString;
    
    //显示HUD
    [HUD show:YES];
}
#pragma mark ==隐藏HUD==
- (void)hideHUD{

    //隐藏HUD
    if (HUD) {
        [HUD hide:YES];
    }

}



@end
