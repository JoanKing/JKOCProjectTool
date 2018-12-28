//
//  JKGCDTimer.h
//  JKMemoryManagement
//
//  Created by 王冲 on 2018/10/28.
//  Copyright © 2018年 JK科技有限公司. All rights reserved.
//

// 博客地址：https://github.com/JoanKing/JKGCDTimer

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^timeBlock)(void);

@interface JKGCDTimer : NSObject

#pragma mark 创建GCD定时器，利用 block 实现任务 （一）
/**
 调用定时器

 @param task 定时器开启后执行的任务
 @param startTime 多长时间后开启任务
 @param intervalTime 时间间隔
 @param repeats 是否重复执行任务  YES: 重复  NO: 执行一次
 @param async 同步还是异步执行任务  YES:async(全局并发队列)  NO: sync(主队列)
 @return 返回一个字符串就好（没啥意义，里面的这个是定时器对应的唯一标识符）
 */
+(NSString *)execTask:(timeBlock)task startTime:(NSTimeInterval)startTime intervalTime:(NSTimeInterval)intervalTime repeats:(BOOL)repeats async:(BOOL)async;

#pragma mark 创建GCD定时器 在自己的控制器里面的方法  实现任务 （二）

/**
 调用定时器

 @param target 自己VC的 self
 @param selector 自己VC里面的 方法
 @param startTime 多长时间后开启任务
 @param intervalTime 时间间隔
 @param repeats 是否重复执行任务  YES: 重复  NO: 执行一次
 @param async 同步还是异步执行任务  YES:async(全局并发队列)  NO: sync(主队列)
 @return 返回一个字符串就好（没啥意义，里面的这个是定时器对应的唯一标识符）
 */
+(NSString *)execTaskTarget:(id)target
             selector:(SEL)selector startTime:(NSTimeInterval)startTime intervalTime:(NSTimeInterval)intervalTime repeats:(BOOL)repeats async:(BOOL)async;

#pragma mark 取消定时器
/**
 取消定时器
 @param name 定时器唯一标识符
 */
+(void)canleGCDTimerTask:(NSString *)name;

#pragma mark 暂停GCD定时器
/**
 暂停定时器任务

 @param name 定时器唯一标识符
 */
+(void)pauseGCDTimerTask:(NSString *)name;

#pragma mark 重新开启GCD定时器
/**
 暂停后的重新开启定时器任务
 
 @param name 定时器唯一标识符
 */
+(void)resumeGCDTimerTask:(NSString *)name;

@end

NS_ASSUME_NONNULL_END
