//
//  UIButton+block.m
//  MAButtonTool
//
//  Created by MISSAJJ on 16/4/5.
//  Copyright © 2016年 MISSAJJ. All rights reserved.
//

#import "UIButton+block.h"
#import <objc/runtime.h>

@implementation UIButton (block)
static char ActionTag;

#pragma mark 添加block
- (void)addTouchAction:(ButtonBlock)block
{
    objc_setAssociatedObject(self, &ActionTag, block, OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self addTarget:self action:@selector(touchAction:) forControlEvents:UIControlEventTouchUpInside];
}
#pragma mark 添加有事件的block
- (void)addTouchAction:(ButtonBlock)block forControlEvents:(UIControlEvents)controlEvents
{
    objc_setAssociatedObject(self, &ActionTag, block, OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self addTarget:self action:@selector(touchAction:) forControlEvents:controlEvents];
}

#pragma mark block回传
- (void)touchAction:(id)sender
{
    ButtonBlock blockAction = (ButtonBlock)objc_getAssociatedObject(self, &ActionTag);
    if (blockAction)
    {
        blockAction(self);
    }
}
@end
