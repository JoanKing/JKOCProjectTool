//
//  JKTopWindow.h
//  StatesWindow
//
//  Created by 王冲 on 2016/12/8.
//  Copyright © 2016年 希爱欧科技有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface JKTopWindow : NSObject

/**
 
 使用方法
 
 1.在首页导入 #import "JKTopWindow.h"
 2.调用  [JKTopWindow show]; 就好了，这样就对全局进行了监听

 */

+(void)show;

+(void)hide;

/*
 *  顶部导航条的点击
 */
+(void)windowClick;

@end
