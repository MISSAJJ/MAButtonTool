//
//  UIButton+block.h
//  MAButtonTool
//
//  Created by MISSAJJ on 16/4/5.
//  Copyright © 2016年 MISSAJJ. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef void(^ButtonBlock)(UIButton* btn);

@interface UIButton (block)

//添加block
- (void)addTouchAction:(ButtonBlock )block;
//添加有不同事件的block
- (void)addTouchAction:(ButtonBlock)block forControlEvents:(UIControlEvents)controlEvents;

@end
