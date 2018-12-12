//
//  UITextField+JKTextField.m
//  JKOCProjectToolDemo
//
//  Created by 王冲 on 2018/12/11.
//  Copyright © 2018年 JK科技有限公司. All rights reserved.
//

#import "UITextField+JKTextField.h"

@implementation UITextField (JKTextField)

-(void)jk_placeHolderColor:(UIColor *)color{
    
    [self setValue:color forKeyPath:@"_placeholderLabel.textColor"];
}

@end
