//
//  NSString+JKBase64.m
//  JKOCProjectToolDemo
//
//  Created by 王冲 on 2018/12/11.
//  Copyright © 2018年 JK科技有限公司. All rights reserved.
//

#import "NSString+JKBase64.h"
#import <CommonCrypto/CommonCryptor.h>
@implementation NSString (JKBase64)

- (NSString *)jk_encodedbase64String
{
    NSData *data = [self dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:YES];
    return [data base64EncodedStringWithOptions:0];
}

- (NSString *)jk_decodedbase64String
{
    NSData *data = [[NSData alloc]initWithBase64EncodedString:self options:NSDataBase64DecodingIgnoreUnknownCharacters];
    return [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
}

// base64 编码
+(NSString *)jk_encodedbase64String:(NSString *)encodedString{
    
    NSData *data = [encodedString dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:YES];
    return [data base64EncodedStringWithOptions:0];
}
// base64 解码
+(NSString *)jk_decodedbase64String:(NSString *)decodedString{
    
    NSData *data = [[NSData alloc]initWithBase64EncodedString:decodedString options:NSDataBase64DecodingIgnoreUnknownCharacters];
    return [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
}

+ (NSString*)encodeBase64Data:(NSData *)data{
    
    return [data base64EncodedStringWithOptions:0];
}

+ (NSString*)decodeBase64Data:(NSData *)data{
    
    return [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
}


@end
