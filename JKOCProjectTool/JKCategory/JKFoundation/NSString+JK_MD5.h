//
//  NSString+JK_MD5.h
//  JKEncryptionDemo
//
//  Created by 王冲 on 2018/12/25.
//  Copyright © 2018年 JK科技有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (JK_MD5)

/**
 MD5加密:
    含义：Message Digest Algorithm MD5（中文名为消息摘要算法第五版）是计算机安全领域广泛使用的一种散列函数(也叫Hash函数)，用以提供消息的完整性保护。其核心思想是从给定的数据中提取特征码，不容产生重复。加密后的字符串通常被称为指纹或消息摘要。
    特点：压缩性：任意长度的数据，算出的MD5值长度都是固定的。相同的字符串，每次MD5后的结果是固定的。都是32个字符
         容易计算：从原数据计算出MD5值很容易。
         抗修改性：对原数据进行任何改动，哪怕只修改1个字节，所得到的MD5值都有很大区别。
         弱抗碰撞：已知原数据和其MD5值，想找到一个具有相同MD5值的数据（即伪造数据）是非常困难的。
         强抗碰撞：想找到两个不同的数据，使它们具有相同的MD5值，是非常困难的。
         不可逆性：不能逆运算。不可破解。
    作用：一致性验证
         数字签名：MD5的典型应用是对一段Message(字节串)产生fingerprint(指纹)以防止被“篡改”。
    提示：MD5加密不是一种加密算法，只是用来做文件校验的。不可逆的,但是网上在线可以解密，也就是说，通过MD5值不能还原原始数据。加密，解密之类的还是用DES/AES + BASE64之类的算法来实现。
    注意：同一个字符串生成的MD5s字符串是相同的
 */

#pragma mark 1、MD5 32位小写 加密
/**
 MD5 32位小写 加密

 @param str 要加密的明文：也就是未加密的字符串
 @return MD5密文:加密后的字符串
 */
+(NSString *)jk_MD5ForLower32Bate:(NSString *)str;

#pragma mark 2、MD5 32位大写 加密
/**
 MD5 32位大写

 @param str 要加密的明文：也就是未加密的字符串
 @return MD5密文:加密后的字符串
 */
+(NSString *)jk_MD5ForUpper32Bate:(NSString *)str;

#pragma mark 3、MD5 16为大写 加密
/**
 MD5 16为大写

 @param str 要加密的明文：也就是未加密的字符串
 @return MD5密文:加密后的字符串
 */
+(NSString *)jk_MD5ForUpper16Bate:(NSString *)str;

#pragma mark 4、MD5 16位小写 加密
/**
 MD5 16位小写

 @param str 要加密的明文：也就是未加密的字符串
 @return MD5密文:加密后的字符串
 */
+(NSString *)jk_MD5ForLower16Bate:(NSString *)str;

@end

NS_ASSUME_NONNULL_END
