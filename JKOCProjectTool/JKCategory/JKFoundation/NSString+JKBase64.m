//
//  NSString+JKBase64.m
//  JKOCProjectToolDemo
//
//  Created by 王冲 on 2018/12/11.
//  Copyright © 2018年 JK科技有限公司. All rights reserved.
//

#import "NSString+JKBase64.h"
#import "NSData+JKBase64.h"
@implementation NSString (JKBase64)

- (NSString *)jk_base64EncodedStringWithWrapWidth:(NSUInteger)wrapWidth
{
    NSData *data = [self dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:YES];
    return [data jk_base64EncodedStringWithWrapWidth:wrapWidth];
}

- (NSData *)jk_base64DecodedData
{
    return [NSData jk_dataWithBase64EncodedString:self];
}

- (NSString *)jk_encodedbase64String
{
    NSData *data = [self dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:YES];
    return [data base64EncodedStringWithOptions:0];
}

- (NSString *)jk_decodedbase64String
{
    NSData *data = [[NSData alloc]initWithBase64EncodedString:self options:NSDataBase64DecodingIgnoreUnknownCharacters];
    return [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];;
    
}

@end
