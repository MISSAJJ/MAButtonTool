//
//  MABaseViewController.h
//  MAButtonTool
//
//  Created by MISSAJJ on 16/4/4.
//  Copyright © 2016年 MISSAJJ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MABaseViewController : UIViewController

//分享模式
- (void)shareMethod;
//显示HUD详情文字
- (void)showHUDText:(NSString*)str detailStr:(NSString*)detailStr;
@end

