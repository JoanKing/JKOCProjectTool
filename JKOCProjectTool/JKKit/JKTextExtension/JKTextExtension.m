//
//  JKTextExtension.m
//  JKOCProjectToolDemo
//
//  Created by 王冲 on 2018/12/5.
//  Copyright © 2018年 JK科技有限公司. All rights reserved.
//

#import "JKTextExtension.h"
@implementation JKTextExtension

/***以下是通用模块***/

/**
 字符串的处理

 @param string 字符串的内容
 @param type 类型：1：去除首尾字符串以及换行符，
                  2：去除所有的空格以及换行符，
                  3：去除首位空格
 @return 返回处理过的字符串
 */
+(NSString *)jk_custom_RemoveString:(NSString *)string withType:(NSString *)type{
    
    // 去掉首尾空格
    string = [string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    if ([type isEqualToString:@"1"] || [type isEqualToString:@"2"]) {
        
        // 去掉所有空格和换行符
        string = [string stringByReplacingOccurrencesOfString:@"\r" withString:@""];
        string = [string stringByReplacingOccurrencesOfString:@"\n" withString:@""];
        
        if ([type isEqualToString:@"2"]){
            
            string = [string stringByReplacingOccurrencesOfString:@" " withString:@""];
        }
    }
    
    return string;
}

/***以上是通用模块***/

+(CGFloat)jk_heightTextContent:(NSString *)textContent withSizeFont:(CGFloat)textfont withMaxSize:(CGSize)maxSize{

    return [self jk_sizeTextContent:textContent withSizeFont:textfont withMaxSize:maxSize].height;
}

+(CGFloat)jk_widthTextContent:(NSString *)textContent withTextfont:(CGFloat)textfont withMaxSize:(CGSize)maxSize{
    
    return [self jk_sizeTextContent:textContent withSizeFont:textfont withMaxSize:maxSize].width;
}

+(CGSize)jk_sizeTextContent:(NSString *)textContent withSizeFont:(CGFloat)textfont withMaxSize:(CGSize)maxSize{
    
    UIFont *font = [UIFont systemFontOfSize:textfont];
    NSDictionary *attrs = @{NSFontAttributeName:font};
    return [textContent boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading |NSLineBreakByCharWrapping attributes:attrs context:nil].size;
}

+(CGSize)jk_sizeAttributedTextContentToFit:(NSMutableAttributedString *)attributedText withMaxSize:(CGSize)maxSize{
    
    UILabel *tempLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, maxSize.width, maxSize.height)];
    tempLabel.attributedText = attributedText;
    tempLabel.numberOfLines = 0;
    [tempLabel sizeToFit];
    return tempLabel.frame.size;
}

+(NSString *)jk_removeStringHeadAndFootSpace:(NSString *)string{
    
    return [self jk_custom_RemoveString:string withType:@"0"];
}

+(NSString *)jk_removeStringHeadAndFootSpaceAndWrap:(NSString *)string{
    
    return [self jk_custom_RemoveString:string withType:@"1"];
}

+(NSString *)jk_removeStringAllSpaceAndWrap:(NSString *)string{

    return [self jk_custom_RemoveString:string withType:@"2"];
}

#pragma mark - 富文本操作
/**
 *  单纯改变一句话中的某些字的颜色
 *
 *  @param color    需要改变成的颜色
 *  @param totalStr 总的字符串
 *  @param subArray 需要改变颜色的文字数组
 *
 *  @return 生成的富文本
 */
+ (NSMutableAttributedString *)jk_changeCorlorWithColor:(UIColor *)color TotalString:(NSString *)totalStr SubStringArray:(NSArray *)subArray {
    
    NSMutableAttributedString *attributedStr = [[NSMutableAttributedString alloc] initWithString:totalStr];
    for (NSString *rangeStr in subArray) {
        
        NSMutableArray *array = [self jk_getRangeWithTotalString:totalStr SubString:rangeStr];
        
        for (NSNumber *rangeNum in array) {
            
            NSRange range = [rangeNum rangeValue];
            [attributedStr addAttribute:NSForegroundColorAttributeName value:color range:range];
        }
        
    }
    
    return attributedStr;
}

#pragma mark - 获取某个子字符串在某个总字符串中位置数组
/**
 *  获取某个字符串中子字符串的位置数组
 *
 *  @param totalString 总的字符串
 *  @param subString   子字符串
 *
 *  @return 位置数组
 */
+ (NSMutableArray *)jk_getRangeWithTotalString:(NSString *)totalString SubString:(NSString *)subString {
    
    NSMutableArray *arrayRanges = [NSMutableArray array];
    
    if (subString == nil && [subString isEqualToString:@""]) {
        return nil;
    }
    
    NSRange rang = [totalString rangeOfString:subString];
    
    if (rang.location != NSNotFound && rang.length != 0) {
        
        [arrayRanges addObject:[NSNumber valueWithRange:rang]];
        
        NSRange   rang1 = {0,0};
        NSInteger location = 0;
        NSInteger   length = 0;
        
        for (int i = 0;; i++) {
            
            if (0 == i) {
                
                location = rang.location + rang.length;
                length = totalString.length - rang.location - rang.length;
                rang1 = NSMakeRange(location, length);
            } else {
                
                location = rang1.location + rang1.length;
                length = totalString.length - rang1.location - rang1.length;
                rang1 = NSMakeRange(location, length);
            }
            
            rang1 = [totalString rangeOfString:subString options:NSCaseInsensitiveSearch range:rang1];
            
            if (rang1.location == NSNotFound && rang1.length == 0) {
                
                break;
            } else {
                
                [arrayRanges addObject:[NSNumber valueWithRange:rang1]];
            }
        }
        return arrayRanges;
    }
    return nil;
}


@end
