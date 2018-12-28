//
//  JKRSATool.h
//  JKEncryptionDemo
//
//  Created by 王冲 on 2018/12/25.
//  Copyright © 2018年 JK科技有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface JKRSATool : NSObject

/**
 简单介绍一下加密
 
 1、简单的概念
 
 明文：加密前的信息
 密文：机密后的信息
 加密算法：加密或解密的算法
 密钥：算法使用的钥匙（读作miyao，正确应该是miyue，但是大家都读miyao）
 *
 简单的例子
 
 将123456每位数字都加1后得到234567，
 其中123456就是明文，234567就是密文，加密密钥就是1，加密算法是每位加
 
 2、加密算法种类
 按照加密的方式我们可以将加密算法大体分成一下三种：
 对称加密算法（加密和解密算法是对称的可能有点抽象你可以理解成同一把钥匙）
 非对称加密算法（加密和解密算法是非对称的可以理解成加密的时候是一把钥匙解密的时候是一把钥匙，典型的就是rsa公钥和私钥）
 经典哈希算法（哈希算法是一种散列算法，有个特殊性是它是不可逆只能通过穷举法超大量的计算才可能算出，一般几率很小，还有就是你同一段的明文两次加密出来的结果是不一样的）
 
 3、算法举例
 对称加密算法：DES算法，3DES算法，TDEA算法，Blowfish算法，RC5算法，IDEA算法，AES算法。
 非对称加密算法：RSA、Elgamal、背包算法、Rabin、D-H、ECC。
 经典的哈希算法：MD2、MD4、MD5 和 *
 SHA-1（目的是将任意长输入通过算法变为固定长输出，且保证输入变化一点输出都不同，且不能反向解密）
 4、今天我们来说一下我们在来发中常用的算法暂时只讲：MD5、Base64、sha、AES、rsa
 补充：RSA加密算法中比较重要的加密算法
 非对称加密算法可能是世界上最重要的算法，它是当今电子商务等领域的基石。简而言之，非对称加密就是指加密公钥和解密密钥是不同的，而且加密公钥和解密密钥是成对出现。非对称加密又叫公钥加密，也就是说成对的密钥，其中一个是对外公开的，所有人都可以获得，人们称之为公钥；而与之相对应的称为私钥，只有这对密钥的生成者才能拥有。
 对于一个私钥，有且只有一个与之对应的公钥。公钥公开给任何人，私钥通常是只有生成者拥有。公/私钥通常是1024位或者2048位，越长安全系数越高，但是解密越困难。尽管拿到了公钥，如果没有私钥，要想解密那几乎是不可能的，至少现在在世界上还没有人公开出来说成功解密的。
 5. 先移动端给服务器传递通过RSA公钥加密后的数据,参数包括DES的密钥(密钥是随机生成的八位字符串) 和 相关参数信息，服务器通过私钥解密信息数据，里面包括DES密钥和 相关参数信息，服务器再通过此DES密钥加密返回数据给移动端，移动端通过此DES密钥进行解密获取数据。
 优点：因为RSA不容易解密，即使被拦截解密了，获取了DES的密钥，因为DES的密钥是随机生成的，也只能解密这一次的数据信息，不会对其他数据信息产生影响。(注：DES的密钥每一次都要重新随机生成，也就是一个密钥只完成这一次的数据传递)
 总结：公钥和密钥成对出现，其中公钥负责加密 ，私钥负责解密
 */

/* 提示：证书的创建请看博客：https://www.jianshu.com/p/74a796ec5038 **/

#pragma mark 1.1、加密：通过'.der'格式的公钥文件路径来加密
/**
 加密方法

 @param str 需要加密的字符串
 @param path '.der'格式的公钥文件路径
 @return 返回加密后的字符串
 */
+ (NSString *)encryptString:(NSString *)str publicKeyWithContentsOfFile:(NSString *)path;

#pragma mark 1.2、解密：通过 '.p12'格式的私钥文件路径 来解密
/**
 解密方法

 @param str 需要解密的字符串
 @param path '.p12'格式的私钥文件路径
 @param password 私钥文件密码
 @return 返回解密后的字符串
 */
+ (NSString *)decryptString:(NSString *)str privateKeyWithContentsOfFile:(NSString *)path password:(NSString *)password;

#pragma mark 2.1、加密： 通过 公钥字符串 来加密
/**
 加密方法

 @param str 需要加密的字符串
 @param pubKey 公钥字符串
 @return 返回加密后的字符串
 */
+ (NSString *)encryptString:(NSString *)str publicKey:(NSString *)pubKey;

#pragma mark 2.2、解密：通过 私钥字符串 来解密
/**
 解密方法

 @param str  需要解密的字符串
 @param privKey 私钥字符串
 @return 返回解密后的字符串
 */
+ (NSString *)decryptString:(NSString *)str privateKey:(NSString *)privKey;

@end

NS_ASSUME_NONNULL_END
