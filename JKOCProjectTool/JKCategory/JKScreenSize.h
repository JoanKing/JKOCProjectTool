//
//  JKScreenSize.h
//  JKOCProjectToolDemo
//
//  Created by 王冲 on 2018/12/7.
//  Copyright © 2018年 JK科技有限公司. All rights reserved.
//

#ifndef JKScreenSize_h
#define JKScreenSize_h

/** 1、屏幕的宽高 */
#define JK_SCREEN_WIDTH  [UIScreen mainScreen].bounds.size.width
#define JK_SCREEN_HEIGHT  [UIScreen mainScreen].bounds.size.height

/** 2、判断是不是苹果手机 */
#define JKIs_Iphone (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)

/** 3、判断是否为iPad */
#define JKIs_iPad (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)

/** 4、判断是不是 iPhoneX */
#define JKIs_Iphone_X (JKIs_Iphone && [[UIScreen mainScreen] bounds].size.height >= 812.0 && [[UIScreen mainScreen] bounds].size.width >= 375.0)

/** 5、适配iPhone x 导航栏的高度  64 + 24 */
#define JKNaviHeight (JKIs_Iphone_X ? 88:64)
#define JKNaviStatusHeight ([[UIApplication sharedApplication] statusBarFrame].size.height+44)

/** 6、适配iPhone x 底部高度 49 + 34 */
#define JKTabbarHeight ([[UIApplication sharedApplication] statusBarFrame].size.height > 20 ? 83 : 49)

/** 7、适配iPhone x 顶部多 24 */
#define iPhoneX_TOP_HEIGHT  ([UIScreen mainScreen].bounds.size.height>=812?24:0)
#define iPhoneX_TOP_HEIGHT2  ([UIScreen mainScreen].bounds.size.height>=812?10:0)

/** 8、适配iPhone x 底部多 34 */
#define JKiPhoneX_Bottom_HEIGHT  ([UIScreen mainScreen].bounds.size.height>=812?34:0)
#define JKstatusBarHeight [[UIApplication sharedApplication] statusBarFrame].size.height

#endif /* JKScreenSize_h */
