//
//  JKDate.h
//  JKOCProjectToolDemo
//
//  Created by 王冲 on 2018/12/4.
//  Copyright © 2018年 JK科技有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface JKDate : NSObject

#pragma mark 1、秒的字符串转化为 00:00:00 或者 00:00
/**
 秒的字符串转化为 00:00:00 或者 00:00 的时间格式，一般用于音视频显示时间

 @param second 秒的字符串
 @param timeType 1：00:00:00；
                 2：00:00
 @return 返回转换后的字符串
 */
+(NSString *)convertHourMinuteSecondTime:(NSString *)second withTimeType:(NSString *)timeType;

#pragma mark 2、自定义的时间戳字符串转时间字符串
/**
 自定义的时间戳字符串转时间字符串

 @param timestamp 时间戳字符串
 @param dateFormat 要的格式，如：yyyy-MM-dd HH:mm:ss、yyyy年MM月dd日，完全自定义
 @return 返回转换后的格式
 */
+(NSString *)convertTimestamp:(NSString *)timestamp withDateFormat:(NSString *)dateFormat;

#pragma mark 3、自定义的时间戳字符串转时间字符串(判断是否是今年)
/**
 自定义的时间戳字符串转时间字符串(判断是否是今年)

 @param timestamp 时间戳字符串
 @param dateFormat 要的格式，如：-MM-dd HH:mm:ss、年MM月dd日，完全自定义；提示：格式不要带有年
 @return 返回转换后的格式：yyyy-MM-dd HH:mm:ss或者MM-dd HH:mm:ss
 */
+(NSString *)convertJudgeYearTimestamp:(NSString *)timestamp withDateFormat:(NSString *)dateFormat;

#pragma mark 4、时间戳字符串转固定格式的时间
/**
 时间戳字符串转固定格式的时间

 @param timestamp 时间戳字符串
 @param dateType 1：2018 12/04；
                 2：2018 12/04 4:50；
                 3：2018-12-04
                 4：2018-12-04 16:57
                 不属于上面的类型的格式：2018-12-04 16:57
 @return 返回转换后的格式
 */
+(NSString *)convertTimestamp:(NSString *)timestamp withDateType:(NSString *)dateType withJudgeYear:(BOOL)judgeYear;

#pragma mark 5、自定义NSDate类型的时间转 格式时间的字符串
/**
 NSDate类型的时间转 格式时间的字符串

 @param date NSDate类型的时间
 @param dateFormat 要的格式，如：yyyy-MM-dd HH:mm:ss、yyyy年MM月dd日，完全自定义
 @return 返回转换后的格式
 */
+(NSString *)convertDate:(NSDate *)date withDateFormat:(NSString *)dateFormat;

#pragma mark 6、自定义NSDate类型的时间转 格式时间的字符串(判断是否是今年)
/**
 自定义NSDate类型的时间转 格式时间的字符串

 @param date NSDate类型的时间
 @param dateFormat -MM-dd HH:mm:ss、年MM月dd日，完全自定义；提示：格式不要带有年
 @return 返回转换后的格式: yyyy-MM-dd HH:mm:ss或者MM-dd HH:mm:ss
 */
+(NSString *)convertJudgeYearDate:(NSDate *)date withDateFormat:(NSString *)dateFormat;

#pragma mark 7、NSDate类型的时间转固定格式的时间
/**
 时间戳字符串转固定格式的时间
 
 @param date NSDate类型的时间
 @param dateType 1：2018 12/04；
 2：2018 12/04 4:50；
 3：2018-12-04
 4：2018-12-04 16:57
 不属于上面的类型的格式：2018-12-04 16:57
 @return 返回转换后的格式
 */
+(NSString *)convertDate:(NSDate *)date withDateType:(NSString *)dateType withJudgeYear:(BOOL)judgeYear;

@end

NS_ASSUME_NONNULL_END
