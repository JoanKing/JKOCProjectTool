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

- (NSString *)jk_hmacMD5StringWithKey:(NSString *)key;
- (NSString *)jk_hmacSHA1StringWithKey:(NSString *)key;
- (NSString *)jk_hmacSHA256StringWithKey:(NSString *)key;
- (NSString *)jk_hmacSHA512StringWithKey:(NSString *)key;

@end

NS_ASSUME_NONNULL_END
