//
//  UIDevice+JKHardware.h
//  JKOCProjectToolDemo
//
//  Created by 王冲 on 2018/12/11.
//  Copyright © 2018年 JK科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIDevice (JKHardware)

/** 一、获取系统相关信息 */
#pragma mark 1.1、返回当前设备模型名字
/** 返回当前设备模型名字 */
+(NSString *)jk_deviceModelName;
#pragma mark 1.2、获取iphone设备名称
/** 获取iphone设备名称 */
+ (NSString *)jk_getDeviceName;
#pragma mark 1.3、获取手机名称
/** 获取手机名称 */
+ (NSString *)jk_getIphoneName;
#pragma mark 1.4、获取APP系统版本
/** 获取APP系统版本 */
+ (NSString *)jk_getIphone_version;
#pragma mark 1.5、获取APP的版本号
/** 获取APP的版本号 */
+ (NSString *)jk_getApp_bundelID;
#pragma mark 1.6、系统名称
/** 系统名称 */
+ (NSString *)jk_getiOSName;
#pragma mark 1.7、判断当前系统是否有摄像头
/** 判断当前系统是否有摄像头 */
+ (BOOL)jk_hasCamera;
#pragma mark 1.8、获取当前设备IP
/** 获取当前设备IP */
+ (NSString *)jk_getDeviceIPAdress;
#pragma mark 1.9、获取当前语言
/** 获取当前语言 */
+ (NSString *)jk_getDeviceLanguage;
#pragma mark 1.10、前手机连接的WIFI名称(SSID)
/** 前手机连接的WIFI名称(SSID) */
+(NSString *)jk_getWifiName;

/** 二、获取硬件相关信息 */
#pragma mark 2.1、获取CPU类型
/** 获取CPU类型 */
+ (NSString *)jk_getHardParam;
#pragma mark 2.2、获取运营商信息
/** 获取运营商信息 */
+ (NSString *)jk_getTelephonyInfo;
#pragma mark 2.4、获取当前设备cpu的频率
/** 获取当前设备cpu的频率 */
+ (NSUInteger)jk_cpuFrequency;
#pragma mark 2.5、获取网络类型
/** 获取网络类型 */
+(NSString*)jk_getNetworkType;
#pragma mark 2.6、获取手机总内存大小
/** 获取手机总内存大小 */
+(NSString*)jk_getTotalMemorySize;
#pragma mark 2.7、获取手机当前可用内存
/** 获取手机当前可用内存 */
+(NSString*)jk_getAvailableMemorySize;
#pragma mark 2.8、获取已使用内存
/** 获取已使用内存 */
+(NSString*)jk_getUsedMemory;
#pragma mark 2.9、获取总磁盘容量
/** 获取总磁盘容量 */
+(NSString*)jk_getTotalDiskSize;
#pragma mark 2.10、获取可用磁盘容量
/** 获取可用磁盘容量 */
+(NSString*)jk_getAvailableDiskSize;

/** 三、电池相关的信息 */
#pragma mark 3.1、判断当前设备电池状态
/** 判断当前设备电池状态 */
+(NSString *)jk_batteryStatues;
#pragma mark 3.2、获取精准电池电量
/** 获取精准电池电量 */
+ (CGFloat)jk_getCurrentBatteryLevel;
#pragma mark 3.3、获取电池电量(一般用百分数表示,大家自行处理就好)
/** 获取电池电量:不精准*/
-(CGFloat)jk_getBatteryQuantity;

@end

NS_ASSUME_NONNULL_END
