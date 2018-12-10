//
//  JKMacro.h
//  JKOCProjectToolDemo
//
//  Created by 王冲 on 2018/12/7.
//  Copyright © 2018年 JK科技有限公司. All rights reserved.
//

/** 1、NSLog的宏 */
#ifdef DEBUG
#define JKLog(...) NSLog(@"%s 第%d行: %@\n\n",__func__,__LINE__,[NSString stringWithFormat:__VA_ARGS__])
#else
#define NSLog(...)
#endif

/** 2、APP版本号 */
#define JKAppVersion [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]
// build 可以更改，上线后版本号还是保持上面的
#define JKAppBuild [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"]

/** 3、系统版本号 */
#define kSystemVersion [[UIDevice currentDevice] systemVersion]

/** 4、随机色与RGB颜色 */
#define JKRandomColor  [UIColor colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0  blue:arc4random_uniform(256)/255.0  alpha:1.0]
#define JKRGBColor(r,g,b,p) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:p]

/** 5、存值、取值、存BOOL值 */
//存值(可变的值不可以存)
#define JKUserDefaultSetValue(B,C) [[NSUserDefaults standardUserDefaults]setObject:B forKey:C]; \
[[NSUserDefaults standardUserDefaults]synchronize]
// 取值
#define JKUserDefaultObject(A) [[NSUserDefaults standardUserDefaults]objectForKey:A]
// 存BOOL值
#define JKUserDefaultBool(D,E)  [[NSUserDefaults standardUserDefaults]setBool:D forKey:E]; \
[[NSUserDefaults standardUserDefaults]synchronize]

/** 6、弱引用/强引用 */
#define JKWeakSelf(type) __weak typeof(type) weak##type = type
#define JKStrongSelf(type) __strong typeof(type) type = weak##type;

/** 7、快速查询一段代码的执行时间 */
#define JKStartTime NSDate *startTime = [NSDate date];
#define JKEndTime NSLog(@"Time:%f", -[startTime timeIntervalSinceNow]);

/** 8、屏幕比例 */
#define JKSizeHeightScale ((CIO_SCREEN_HEIGHT > 667) ? CIO_SCREEN_HEIGHT/667 : 1)
#define JKSizeWidthScale ((CIO_SCREEN_WIDTH > 375) ? CIO_SCREEN_WIDTH/375 : 1)

/** 9、获取当前语言 */
#define JKCurrentLanguage ([[NSLocale preferredLanguages] objectAtIndex:0])

/** 10、由角度转换弧度 */
#define kDegreesToRadian(x) (M_PI * (x) / 180.0)

/** 11、由弧度转换角度 */
#define kRadianToDegrees(radian) (radian * 180.0) / (M_PI)

/** 12、图片 */
#define JKImageOfFile(NAME,EXT) [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:(NAME) ofType:(EXT)]]
#define JKImageNamed(NAME) [UIImage imageNamed:NAME]

/** 13、字体大小（常规/粗体） */
#define JKBoldFont(FONTSIZE)      [UIFont boldSystemFontOfSize:FONTSIZE]
#define JKSystemFont(FONTSIZE)    [UIFont systemFontOfSize:FONTSIZE]
#define JKFont(NAME,FONTSIZE)     [UIFont fontWithName:(NAME) size:(FONTSIZE)]
