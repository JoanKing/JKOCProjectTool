//
//  JKQRCode.h
//  JKQRCode
//
//  Created by 王冲 on 2018/12/29.
//  Copyright © 2018年 JK科技有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

static NSString *const kfailErrorCode = @"-100";
static NSString *const kfailErrorDesc = @"识别二维码失败";

@interface JKQRCode : NSObject

/**
 扫描二维码
 
 @param view 渲染在view上
 @param successBlock 成功回调
 @param failBlock 失败回调
 */
- (void)initDeviceAndAddView:(UIView *)view WithSuccessBlock:(void(^)(NSString *qrcode))successBlock failBlock:(void(^)(NSError *error))failBlock;

// 开始/停止扫描
- (void)starScanning;
- (void)stopScanning;

#pragma mark 生成一张带 logo 的二维码
/**
 生成一张带 logo 的二维码
 
 @param content 二维码中的内容
 @param logoImage 二维码上面的小图片
 @param qrCodeSize 二维码的大小：图片是正方形，宽与高相等
 @return 返回一张新的图片
 */
+ (UIImage *)createQRCodeWithContent:(NSString *)content withLogoImage:(UIImage *)logoImage withQRCodeSize:(CGFloat)qrCodeSize;

#pragma mark - 生成普通的二维码
/**
 生成普通的二维码
 
 @param string 二维码文字
 @param size 宽
 @return 二维码
 */
+ (UIImage *)creatQrWithString:(NSString *)string withSize:(CGFloat)size;

#pragma mark - 通过图片读取二维码
/**
 通过图片读取二维码
 
 @param image 图片
 @return 二维码
 */
+ (NSString *)readAlbumQRCode:(UIImage *)image;


@end

NS_ASSUME_NONNULL_END
