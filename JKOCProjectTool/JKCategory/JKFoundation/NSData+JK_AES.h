//
//  NSData+JK_AES.h
//  JKEncryptionDemo
//
//  Created by 王冲 on 2018/12/25.
//  Copyright © 2018年 JK科技有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSData (JK_AES)

#pragma mark AES 加密
/**
 AES 加密

 @param key 加密的密码
 @return 返回加密后的 NSData
 */
- (NSData *)jk_AES256EncryptWithKey:(NSString *)key;

#pragma mark AES 解密
/**
 AES 解密

 @param key 解密的密码
 @return 返回解密后的 NSData
 */
- (NSData *)jk_AES256DecryptWithKey:(NSString *)key;   //解密


@end

NS_ASSUME_NONNULL_END
