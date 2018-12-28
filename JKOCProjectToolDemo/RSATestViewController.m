//
//  RSATestViewController.m
//  JKOCProjectToolDemo
//
//  Created by 王冲 on 2018/12/28.
//  Copyright © 2018年 JK科技有限公司. All rights reserved.
//

#import "RSATestViewController.h"

@interface RSATestViewController ()

@end

@implementation RSATestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    /* 提示：证书的创建请看博客：https://www.jianshu.com/p/74a796ec5038 **/
    self.title = @"RSA加密的使用";
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self test1];
    NSLog(@"*************************------------***********************************");
    [self test2];
}

#pragma mark 使用'.der'文件加密的字符串!
-(void)test1{
    
    //原始数据
    NSString *originalString = @"这是一段将要使用'.der'文件加密的字符串!";
    
    //使用.der和.p12中的公钥私钥加密解密
    NSString *public_key_path = [[NSBundle mainBundle] pathForResource:@"public_key.der" ofType:nil];
    NSString *private_key_path = [[NSBundle mainBundle] pathForResource:@"private_key.p12" ofType:nil];
    
    NSString *encryptStr = [JKRSATool encryptString:originalString publicKeyWithContentsOfFile:public_key_path];
    NSLog(@"加密前:%@", originalString);
    NSLog(@"加密后:%@", encryptStr);
    NSLog(@"解密后:%@", [JKRSATool decryptString:encryptStr privateKeyWithContentsOfFile:private_key_path password:@"123456"]);
}

#pragma mark 使用'秘钥字符串'进行加密的字符串!
// 秘钥字符串的生成链接：http://web.chacuo.net/netrsakeypair
-(void)test2{
    
    //原始数据
    NSString *originalString = @"这是一段将要使用'秘钥字符串'进行加密的字符串!";
    
    //使用字符串格式的公钥私钥加密解密
    NSString *encryptStr = [JKRSATool encryptString:originalString publicKey:@"MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCvjii3lFKNt9V1uE25M6stihYlNUeT/NClESMmXmdLfTXfJ0Wtu3ozbjfRUkb/vQip1Midl8YA6UwlDkafevWN0OR5hY9ZScWoDJ4mTHxatPUnGqZReTQz6BjUDdLEc0wyz6GT8SV5qLNbT9JZENfoKQ5N78m9kAhsxH/ch2l7ZQIDAQAB"];
    
    NSLog(@"加密前:%@", originalString);
    NSLog(@"加密后:%@", encryptStr);
    NSLog(@"解密后:%@", [JKRSATool decryptString:encryptStr privateKey:@"MIICdQIBADANBgkqhkiG9w0BAQEFAASCAl8wggJbAgEAAoGBAK+OKLeUUo231XW4Tbkzqy2KFiU1R5P80KURIyZeZ0t9Nd8nRa27ejNuN9FSRv+9CKnUyJ2XxgDpTCUORp969Y3Q5HmFj1lJxagMniZMfFq09ScaplF5NDPoGNQN0sRzTDLPoZPxJXmos1tP0lkQ1+gpDk3vyb2QCGzEf9yHaXtlAgMBAAECgYA+OKh9yHgp+ooRmy0RAxscnOCUd3nTHbvlhVlr8/Gwc8RwPz8XAGejauEls3+ujJVRfDVOhciL8iQmzhSB2dbFwmJLVljaXcVYoy9jZvIcd6Nb0kR9UHqgjMOE4nOYp4676FdetPYbxcHZNrwFOfn5GaZz98kex01I7vEZHnkd0QJBAN3FHSNuVI/ZkYSxvM5WO3VGjrDtSVaRTc1fbVi+RBHGPtSm+FlgRidFrO5kvzl/kbVVrj34c/k7SKkE7qNjjRsCQQDKpvJO8zThxymdIMGXqERCucyA0dsogA+BtJPqo0H3X7zL54eTIec9kG5oP2aMdDWc8gEY4Cjq6g7bI2BW4iF/AkA4hImeg/mtB2ech6d0dmmEw8yNrotoMnO/iThWy3aRiRJuI3dbX7vBOnKN9sL9JlO+AO39ARqdQ8yKtqUSosZNAkBaqBCh7P7tOfGNz0eLlsTirMeloTvPhGprdeLuBpbOGVAWT79AvNv7mI8rp6EymBIb4c9H14+2d3qp4cuJUqP1AkATVlNhMmg2WN95LILxR7Neunk0owYnT+7ipF5CSTCoo4uBK10wlWuots3lLzCg+dJnzl4hLXcmMwTIeYCUGi9q"]);
}


@end
