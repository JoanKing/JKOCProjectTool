//
//  NSString+JKHash.h
//  JKOCProjectToolDemo
//
//  Created by 王冲 on 2018/12/11.
//  Copyright © 2018年 JK科技有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (JKHash)

@property (readonly) NSString *md5String;
@property (readonly) NSString *sha1String;
@property (readonly) NSString *sha256String;
@property (readonly) NSString *sha512String;

#pragma mark 1、MD5 加密字符串
/**
 MD5 加密后的字符串

 @param key 要加密的字符串
 @return MD5 加密后的字符串
 */

- (NSString *)jk_hmacMD5StringWithKey:(NSString *)key;
#pragma mark 2、SHA1 加密字符串
/**
 SHA1 加密字符串

 @param key 要加密的字符串
 @return SHA1 加密后的字符串
 */
- (NSString *)jk_hmacSHA1StringWithKey:(NSString *)key;
#pragma mark 3、SHA256 加密字符串
/**
 SHA256 加密字符串

 @param key 要加密的字符串
 @return SHA256 加密后的字符串
 */
- (NSString *)jk_hmacSHA256StringWithKey:(NSString *)key;
#pragma mark 4、SHA512 加密字符串
/**
 SHA512 加密字符串

 @param key 要加密的字符串
 @return SHA512 加密后的字符串
 */
- (NSString *)jk_hmacSHA512StringWithKey:(NSString *)key;

@end

NS_ASSUME_NONNULL_END
