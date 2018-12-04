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

@end
