//
//  JKGCDTimer.m
//  JKMemoryManagement
//
//  Created by 王冲 on 2018/10/28.
//  Copyright © 2018年 JK科技有限公司. All rights reserved.
//

#import "JKGCDTimer.h"

@implementation JKGCDTimer

// 创建一个字典(只需要在项目使用到的地方初始化一次就好)用来保存 定时器，定时器的唯一标识作为键，定时器作为值
static NSMutableDictionary *timers_;
dispatch_semaphore_t semaphore_;
+(void)initialize{
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
       
        timers_ = [[NSMutableDictionary alloc]init];
        semaphore_ = dispatch_semaphore_create(1);
        
    });
}

#pragma mark 创建GCD定时器
+(NSString *)execTask:(timeBlock)task startTime:(NSTimeInterval)startTime intervalTime:(NSTimeInterval)intervalTime repeats:(BOOL)repeats async:(BOOL)async{
    
    if (!task || startTime < 0 || (intervalTime <= 0 && repeats)) return nil;
    
    // 创建队列
    dispatch_queue_t queue = async ? dispatch_get_global_queue(0, 0) : dispatch_get_main_queue();
    
    // 创建定时器
    dispatch_source_t gcdTimer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    
    // 设置时间
    /*
     dispatch_source_t  _Nonnull source: 定时器
     dispatch_time_t start: 开始的时间,dispatch_time(DISPATCH_TIME_NOW, start * NSEC_PER_SEC)，start多长时间后开始，NSEC_PER_SEC(纳秒)
     uint64_t interval：时间间隔
     uint64_t leeway: 误差，写0就好
     */
    uint64_t start = startTime;
    uint64_t interval = intervalTime;
    dispatch_source_set_timer(gcdTimer, dispatch_time(DISPATCH_TIME_NOW, start * NSEC_PER_SEC),  interval * NSEC_PER_SEC,0);
    
    // 加锁
    dispatch_semaphore_wait(semaphore_, DISPATCH_TIME_FOREVER);
    
    // 定时器的唯一标识
    NSString *name = [NSString stringWithFormat:@"%zd", timers_.count];
    // 存放到字典中
    timers_[name] = gcdTimer;
    
    // 解锁
    dispatch_semaphore_signal(semaphore_);
    
    // 设置回调1
    dispatch_source_set_event_handler(gcdTimer, ^{
        
        task();
        if (!repeats) {
           
            [self canleGCDTimerTask:name];
        }
        
    });
    
    // 启动定时器
    dispatch_resume(gcdTimer);
    
    return name;
}

#pragma mark 在自己的控制器里面 实现任务
+(NSString *)execTaskTarget:(id)target
             selector:(SEL)selector startTime:(NSTimeInterval)startTime intervalTime:(NSTimeInterval)intervalTime repeats:(BOOL)repeats async:(BOOL)async{
    
    if (!target || !selector) return nil;
    
    __weak typeof(target) weakSelf = target;
    return [self execTask:^{
        
        if ([weakSelf respondsToSelector:selector]) {
            // 消除 xcode报警告⚠️代码
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
            // 代码区
            [weakSelf performSelector:selector];
#pragma clang diagnostic pop
            
        }
        
    } startTime:startTime intervalTime:intervalTime repeats:repeats async:async];
}

#pragma mark 取消定时器
+(void)canleGCDTimerTask:(NSString *)name{
    
    if (name.length == 0) return;
    
    // 加锁
    dispatch_semaphore_wait(semaphore_, DISPATCH_TIME_FOREVER);
    
    dispatch_source_t gcdTimer = timers_[name];
    if (gcdTimer) {
         dispatch_source_cancel(gcdTimer);
        [timers_ removeObjectForKey:name];
    };
    
    // 解锁
    dispatch_semaphore_signal(semaphore_);
    
}

#pragma mark 暂停GCD定时器
+(void)pauseGCDTimerTask:(NSString *)name{
    
    if (name.length == 0) return;
    
    // 加锁
    dispatch_semaphore_wait(semaphore_, DISPATCH_TIME_FOREVER);
    
    dispatch_source_t gcdTimer = timers_[name];
    if (gcdTimer) {
        dispatch_suspend(gcdTimer);
    };
    
    // 解锁
    dispatch_semaphore_signal(semaphore_);

}

#pragma mark 重新开启GCD定时器
+(void)resumeGCDTimerTask:(NSString *)name{
    
    if (name.length == 0) return;
    
    // 加锁
    dispatch_semaphore_wait(semaphore_, DISPATCH_TIME_FOREVER);
    
    dispatch_source_t gcdTimer = timers_[name];
    if (gcdTimer) {
        dispatch_resume(gcdTimer);
    };
    
    // 解锁
    dispatch_semaphore_signal(semaphore_);
}
 
@end
