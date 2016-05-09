//
//  MAHUDTool.h
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

#import <Foundation/Foundation.h>
#import "MBProgressHUD.h"
#import "MASingleton.h"

@interface MAHUDTool : NSObject<MBProgressHUDDelegate>
{
    MBProgressHUD *HUD;
}
//单例
singleton_interface(MAHUDTool)

//显示HUD
- (void)showHUDInView: (UIView *)view withString:(NSString *)string;

//显示有详情文字的HUD
- (void)showHUDInView: (UIView *)view withString:(NSString *)string detailString:(NSString *)detailString;
//隐藏HUD
- (void)hideHUD;
@end
