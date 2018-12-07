//
//  JKMacro.h
//  JKOCProjectToolDemo
//
//  Created by 王冲 on 2018/12/7.
//  Copyright © 2018年 JK科技有限公司. All rights reserved.
//

/** 1、NSLog的宏 */
#ifdef DEBUG
#define NSLog(...) NSLog(@"%s 第%d行: %@\n\n",__func__,__LINE__,[NSString stringWithFormat:__VA_ARGS__])
#else
#define NSLog(...)
#endif

/** 2、APP版本号 */
#define JKAppVersion [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]

/** 3、系统版本号 */
#define kSystemVersion [[UIDevice currentDevice] systemVersion]

/** 4、随机色与RGB颜色 */
#define JKRandomColor  [UIColor colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0  blue:arc4random_uniform(256)/255.0  alpha:1.0]
#define JKRGBColor(r,g,b,p) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:p]
