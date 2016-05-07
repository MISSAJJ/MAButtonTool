//
//  MAButtonTool.h
//  Created by MISSAJJ on 16/3/18.
//  Copyright © 2016年 MISSAJJ. All rights reserved.
//
/**
   @author https://github.com/MISSAJJ (MISSAJJ), 更新日期:  16-04-08 03:37:43
  
     为了节约时间,提高创建按钮控件的效率,特抽出一个创建各种按钮的类方法
 */


#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef void(^ButtonBlock)(UIButton* btn);
typedef void(^ButtonItemBlock)(UIButton* btn);
/** 按钮样式 */
typedef NS_ENUM(NSInteger,MAButtonToolType) {
    MAButtonToolTypeCustom,   //自定义
    MAButtonToolTypeShare,    //分享按钮
    MAButtonToolTypeBack,  //返回按钮
};

/** 位置样式 */
typedef NS_ENUM(NSInteger,MAButtonToolPostion) {
    MAButtonToolPostionMiddle,  //中间
    MAButtonToolPostionLeft,    //左边
    MAButtonToolPostionRight,   //右边
};

@interface MAButtonTool : NSObject
/**
 *  按钮样式
 */
@property (nonatomic,assign)MAButtonToolType type;

/**
 *  自定义图片按钮  ， 请传递UIImage或者NSString
 */
+ (UIButton *)createButton:(id)imageStr;

 /**
 *  创建自定义 Block 图片按钮  ， 请传递UIImage或者NSString
 */
+ (UIButton *)createBlockButton:(id)imageStr :(ButtonBlock)block;
/**
 *  左按钮  ， 请传递UIImage或者NSString
 */
+(UIButton *)createLeftButton:(id)imageStr;
/**
 *  右按钮  ， 请传递UIImage或者NSString
 */
+(UIButton*)createRightButton:(id)imageStr;
/**
 *  左返回按钮
 */
+(UIButton*)createLeftBackButton;
/**
 *  右分享按钮
 */
+(UIButton*)createRightShareButton;
/**
 *  自定义 导航栏 按钮 ， 请传递UIImage或者NSString
 */
+(UIBarButtonItem *)createButtonWithImage:(id)imageStr position:(MAButtonToolPostion)position target:(id)target action:(SEL)action type:(MAButtonToolType)type;
/**
 *  自定义 block 导航栏 按钮  ， 请传递UIImage或者NSString
 */
+(UIBarButtonItem *)createButtonWithImage:(id)imageStr position:(MAButtonToolPostion)position type:(MAButtonToolType)type actionBlock:(ButtonItemBlock)block;
/**
 *  自定义 文字按钮
 */
+ (UIBarButtonItem *)initWithTitle:(NSString *)title titleColor:(UIColor *)titleColor target:(id)target action:(SEL)action;
@end
