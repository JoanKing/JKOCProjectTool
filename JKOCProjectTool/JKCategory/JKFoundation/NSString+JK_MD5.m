//
//  NSString+JK_MD5.m
//  JKEncryptionDemo
//
//  Created by 王冲 on 2018/12/25.
//  Copyright © 2018年 JK科技有限公司. All rights reserved.
//

#import "NSString+JK_MD5.h"
#import <CommonCrypto/CommonDigest.h>
@implementation NSString (JK_MD5)

/** 以下是公用方法 */

+(NSString *)encryptionValue:(NSString *)value{
    
    NSString *string;
    for (int i=0; i<24; i++) {
        string=[value substringWithRange:NSMakeRange(8, 16)];
    }
    return string;
}

+(NSString *)encryptionValue:(NSString *)value withType:(NSString *)type{
    
    //要进行UTF8的转码
    const char* input = [value UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(input, (CC_LONG)strlen(input), result);
    
    NSMutableString *digest = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    
    if ([type isEqualToString:@"1"]) {
        // 小写
        for (NSInteger i = 0; i < CC_MD5_DIGEST_LENGTH; i++) {
            [digest appendFormat:@"%02x", result[i]];
        }
    }else{
        // 大写
        for (NSInteger i = 0; i < CC_MD5_DIGEST_LENGTH; i++) {
            [digest appendFormat:@"%02X", result[i]];
        }
    }
    return digest;
}

/** 以上是公用方法 */

#pragma mark - 32位 小写
+(NSString *)jk_MD5ForLower32Bate:(NSString *)str{
    
    return [self encryptionValue:str withType:@"1"];
}

#pragma mark - 32位 大写
+(NSString *)jk_MD5ForUpper32Bate:(NSString *)str{
    
    return [self encryptionValue:str withType:@"2"];;
}

#pragma mark - 16位 大写
+(NSString *)jk_MD5ForUpper16Bate:(NSString *)str{
    
    NSString *md5Str = [self jk_MD5ForUpper32Bate:str];
    return [self encryptionValue:md5Str];
}

#pragma mark - 16位 小写
+(NSString *)jk_MD5ForLower16Bate:(NSString *)str{
    
    NSString *md5Str = [self jk_MD5ForLower32Bate:str];
    return [self encryptionValue:md5Str];
}

@end
