//
//  NSString+JKString.m
//  JKOCProjectToolDemo
//
//  Created by 王冲 on 2018/12/6.
//  Copyright © 2018年 JK科技有限公司. All rights reserved.
//

#import "NSString+JKString.h"

@implementation NSString (JKString)

+ (NSString *)floatToString:(CGFloat)f {
    if (fmodf(f, 1)==0) {//如果有一位小数点
        return [NSString stringWithFormat:@"%.0f",f];
    } else if (fmodf(f*10, 1)==0) {//如果有两位小数点
        return [NSString stringWithFormat:@"%.1f",f];
    } else {
        return [NSString stringWithFormat:@"%.2f",f];
    }
}

@end
