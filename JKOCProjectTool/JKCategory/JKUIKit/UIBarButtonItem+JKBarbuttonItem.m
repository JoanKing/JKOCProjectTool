//
//  UIBarButtonItem+JKBarbuttonItem.m
//  JKOCProjectToolDemo
//
//  Created by 王冲 on 2018/12/5.
//  Copyright © 2018年 JK科技有限公司. All rights reserved.
//

#import "UIBarButtonItem+JKBarbuttonItem.h"

@implementation UIBarButtonItem (JKBarbuttonItem)


+(UIBarButtonItem *)itemWithTarget:(id)target Image:(NSString *)image action:(SEL)action;
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    [button setBackgroundImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    CGSize size = button.currentBackgroundImage.size;
    button.frame =CGRectMake(0, 0, size.width, size.height);
    return [[UIBarButtonItem alloc]initWithCustomView:button];
}


@end
