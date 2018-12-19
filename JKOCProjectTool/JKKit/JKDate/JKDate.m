//
//  JKDate.m
//  JKOCProjectToolDemo
//
//  Created by 王冲 on 2018/12/4.
//  Copyright © 2018年 JK科技有限公司. All rights reserved.
//

#import "JKDate.h"

@implementation JKDate

/************** 以下通用模块 *****************/

+(NSString *)convert_dateType:(NSDate *)date withDate_type:(NSString *)dateType withJudgeYear:(BOOL)judgeYear{
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    NSString *newFormatter = @"";
    
    if ([dateType isEqualToString:@"1"]) {
        
        newFormatter = @" MM/dd";
        
    }else if ([dateType isEqualToString:@"2"]){
        
        newFormatter = @" MM/dd HH:mm";
        
    }else if ([dateType isEqualToString:@"3"]){
        
        newFormatter = @"-MM-dd HH:mm";
        
    }else{
        
        newFormatter = @"-MM-dd HH:mm";
    }
    
    NSString *otherNewFormatter;
    
    if (judgeYear) {
        
        NSString *dateTime1 = [formatter stringFromDate:date];
        NSString *dateTime2 = [formatter stringFromDate:[NSDate date]];
        
        if ([dateTime1 isEqualToString:dateTime2]) {
            
            otherNewFormatter = [NSString stringWithFormat:@"%@",newFormatter];
        }else{
            
            otherNewFormatter = [NSString stringWithFormat:@"YYYY%@",newFormatter];
        }
        
    }else{
        
        otherNewFormatter = [NSString stringWithFormat:@"YYYY%@",newFormatter];
    }
    
    [formatter setDateFormat:otherNewFormatter];
    NSString *dateString = [formatter stringFromDate:date];
    
    return dateString;
}

+(NSString *)convert_Date:(NSDate *)date withDate_format:(NSString *)dateFormat withJudge_year:(BOOL)judgeYear{
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    
    if (judgeYear) {
        
        NSString *dateTime1 = [formatter stringFromDate:date];
        NSString *dateTime2 = [formatter stringFromDate:[NSDate date]];
        
        if ([dateTime1 isEqualToString:dateTime2]) {
            
            [formatter setDateFormat:dateFormat];
            return [formatter stringFromDate:date];
            
        }else{
            
            [formatter setDateFormat:[NSString stringWithFormat:@"%@ %@",@"YYYY",dateFormat]];
            return [formatter stringFromDate:date];;
        }
    }
    
    [formatter setDateFormat:dateFormat];
    NSString *dateString = [formatter  stringFromDate:date];
    
    return dateString;
}

/************** 以上通用模块 *****************/

+(NSString *)convertHourMinuteSecondTime:(NSString *)second withTimeType:(NSString *)timeType{
    
    NSInteger seconds = [second integerValue];
    
    // format of minute
    NSString *str_minute = [NSString stringWithFormat:@"%02ld",(seconds%3600)/60];
    // format of second
    NSString *str_second = [NSString stringWithFormat:@"%02ld",seconds%60];
    
    if ([timeType isEqualToString:@"1"]) {
        
        // format of hour
        NSString *str_hour = [NSString stringWithFormat:@"%02ld",seconds/3600];
        // format of time
        NSString *format_time = [NSString stringWithFormat:@"%@:%@:%@",str_hour,str_minute,str_second];
        
        return format_time;
    }
    
    NSString *format_time = [NSString stringWithFormat:@"%@:%@",str_minute,str_second];
    
    return format_time;
}

+(NSString *)convertTimestamp:(NSString *)timestamp withDateFormat:(NSString *)dateFormat{
    
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:[timestamp longLongValue]];
    return [self convert_Date:date withDate_format:dateFormat withJudge_year:NO];
}

+(NSString *)convertJudgeYearTimestamp:(NSString *)timestamp withDateFormat:(NSString *)dateFormat{
    
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:[timestamp longLongValue]];
    return [self convert_Date:date withDate_format:dateFormat withJudge_year:YES];
}

+(NSString *)convertTimestamp:(NSString *)timestamp withDateType:(NSString *)dateType withJudgeYear:(BOOL)judgeYear{
    
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:[timestamp longLongValue]];
    return [self convert_dateType:date withDate_type:dateType withJudgeYear:judgeYear];
}

+(NSString *)convertDate:(NSDate *)date withDateFormat:(NSString *)dateFormat{

    return [self convert_Date:date withDate_format:dateFormat withJudge_year:NO];
}

+(NSString *)convertJudgeYearDate:(NSDate *)date withDateFormat:(NSString *)dateFormat{
    
    return [self convert_Date:date withDate_format:dateFormat withJudge_year:YES];
}

+(NSString *)convertDate:(NSDate *)date withDateType:(NSString *)dateType withJudgeYear:(BOOL)judgeYear{
    
    return [self convert_dateType:date withDate_type:dateType withJudgeYear:judgeYear];
}


+ (NSString *)jk_time1TurnStringTimestamp:(NSString *)timestamp
{
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:[timestamp doubleValue]];
    
    NSTimeInterval  timeInterval = [date timeIntervalSinceNow];
    
    NSInteger seconds = round(timeInterval);
    
    if (seconds < 0) {
        return @"";
    }
    if (seconds < 60) {
        return @"刚刚";
    }else if (seconds < 3600) {
        return [NSString stringWithFormat:@"%ld分钟之前",seconds/60];
    }else if (seconds < 3600*24){
        return [NSString stringWithFormat:@"%ld小时之前",seconds/(3600)];
    }else if (seconds < (3600*24*30)){
        return [NSString stringWithFormat:@"%ld天之前",seconds/(3600*24)];
    }else if (seconds < (3600*24*30*12)){
        return [NSString stringWithFormat:@"%ld月之前",seconds/(3600*24*30)];
    }else{
        return [NSString stringWithFormat:@"%ld年之前",seconds/(3600*24*30*12)];
    }
}

+ (NSString *)jk_time2TurnStringTimestamp:(NSString *)timestamp{
    
    NSDate *date1 = [NSDate dateWithTimeIntervalSince1970:[timestamp doubleValue]];
    
    NSTimeInterval  timeInterval = [date1 timeIntervalSinceNow];
    timeInterval = -timeInterval;
    
    NSInteger time = round(timeInterval);
    
    long temp = 0;
    
    if (time < 60) {
        
        NSString *result = @"刚刚";
        
        return result;
    }
    else if((temp = timeInterval/60) <60){
        NSString *result = [NSString stringWithFormat:@"%ld分钟前",temp];
        return result;
    }
    
    else if((temp = temp/60) <24){
        NSString *result = [NSString stringWithFormat:@"%ld小时前",temp];
        return result;
    }
    
    else if((temp = temp/24) <30){
        
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        
        [dateFormatter setDateFormat:@"MM/dd hh:mm"];
        NSString *dateString = [dateFormatter stringFromDate:date1 ];
        
        
        return dateString;
    }
    
    else if((temp = temp/30) <12){
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        
        [dateFormatter setDateFormat:@"MM/dd hh:mm"];
        NSString *dateString = [dateFormatter stringFromDate:date1 ];
        
        
        return dateString;
    }
    else{
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        
        [dateFormatter setDateFormat:@"yyyy MM/dd hh:mm"];
        NSString *dateString = [dateFormatter stringFromDate:date1 ];
        
        
        return dateString;    }
    
    return  nil;
}

+ (NSString *)jk_laveTimeTurnString:(NSInteger)seconds{
    
    if (seconds < 0) {
        return @"";
    }
    if (seconds < 60) {
        return @"马上";
    }else if (seconds < 3600) {
        return [NSString stringWithFormat:@"剩余%ld分钟",seconds/60];
    }else if (seconds < 3600*24){
        return [NSString stringWithFormat:@"剩余%ld小时",seconds/(3600)];
    }else {
        return [NSString stringWithFormat:@"剩余%ld天",seconds/(3600*24)];
    }
}

+(NSString *)jk_ageConstellationWithStamp:(NSString *)timestamp
{
    NSDate*detaildate = [NSDate date];
    //实例化一个NSDateFormatter对象
    NSDateFormatter*dateFormatter = [[NSDateFormatter alloc]init];
    //设定时间格式,这里可以设置成自己需要的格式
    [dateFormatter setDateFormat:@"yyyy"];
    
    NSString *currentDateStr = [dateFormatter stringFromDate:detaildate];
    
    NSArray *strarr = [[self convertTimestamp:timestamp withDateFormat:@"yyyy-MM-dd"] componentsSeparatedByString:@"-"];
    if (strarr.count == 3) {
        return [NSString stringWithFormat:@"%ld岁",[currentDateStr integerValue] - [strarr[0] integerValue]];
    }
    else
    {
        return @"未知年龄";
    }
}

//以字符串中的空格为分隔，将字符串分为字符串数组(此方法要求返回一个数组)
+ (NSString *)jk_calculateConstellationWithStamp:(NSString *)timestamp{
    
    NSArray *strarr = [[self convertTimestamp:timestamp withDateFormat:@"yyyy-MM-dd"] componentsSeparatedByString:@"-"];
    
    if (strarr.count == 3) {
        return [self jk_calculateConstellationWithMonth:[strarr[1] integerValue] day:[strarr[2] integerValue]];
    }
    else
    {
        return @"未得到星座";
    }
}

+(NSString *)jk_calculateConstellationWithMonth:(NSInteger)month day:(NSInteger)day{
    
    NSString *astroString = @"魔羯水瓶双鱼白羊金牛双子巨蟹狮子处女天秤天蝎射手魔羯";
    NSString *astroFormat = @"102123444543";
    NSString *result;
    
    if (month<1 || month>12 || day<1 || day>31){
        return @"错误日期格式!";
    }
    
    if(month==2 && day>29)
    {
        return @"错误日期格式!!";
    }else if(month==4 || month==6 || month==9 || month==11) {
        if (day>30) {
            return @"错误日期格式!!!";
        }
    }
    
    result=[NSString stringWithFormat:@"%@",[astroString substringWithRange:NSMakeRange(month*2-(day < [[astroFormat substringWithRange:NSMakeRange((month-1), 1)] intValue] - (-19))*2,2)]];
    
    return [NSString stringWithFormat:@"%@座",result];
}

+ (NSString *)jk_numberOfSecondsTurnString:(NSInteger)seconds
{
    if (seconds <= 60) {
        return [NSString stringWithFormat:@"00:00:%02ld",seconds];
    }
    else if ((seconds>60) && (seconds<=3600))
    {
        return [NSString stringWithFormat:@"00:%02ld:%02ld",seconds/60,seconds%60];
    }
    else
    {
        return [NSString stringWithFormat:@"%02ld:%02ld:%02ld",seconds/3600,seconds%3600/60,seconds%3600%60];
    }
}

@end
