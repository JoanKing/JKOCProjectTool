//
//  JKScanningQRViewController.h
//  JKQRCode
//
//  Created by 王冲 on 2018/12/29.
//  Copyright © 2018年 JK科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface JKScanningQRViewController : UIViewController

@property (nonatomic, copy) void(^scanningSuccess)(NSString *QRCodeStr);

/** 是否是 push */
@property (nonatomic, assign, getter=isPush) BOOL push;


@end

NS_ASSUME_NONNULL_END
