//
//  UIDevice+JKHardware.m
//  JKOCProjectToolDemo
//
//  Created by 王冲 on 2018/12/11.
//  Copyright © 2018年 JK科技有限公司. All rights reserved.
//

/**
 在开发中，我们经常需要获取设备的型号（如 iPhone X，iPhone 8 Plus 等）以进行数据统计，或者做不同的适配。但苹果并没有提供相应的系统 API 让我们直接取得当前设备的型号。
 其中，UIDevice 有一个属性 model 只是用于获取 iOS 设备的类型，如 iPhone，iPod touch，iPad 等；而其另一个属性 name 表示当前设备的名称，由用户在设置》通用》关于》名称中设定，如 My iPhone，xxx 的 iPhone 等。然而，我们无法根据这两个值获得具
 不过，每一种 iOS 设备型号都有对应的一个或多个硬件编码/标识符，称为 device model 或者叫 machine name体的型号。
 所以，通常的做法是，先获取设备的 device model 值，再手动映射为具体的设备型号（或者直接把device model 值传给后端，让后端去做映射，这样的好处是可以随时兼容新设备）。
 
 例如：去年发布的第一代 iPhone X 对应的 device mode 为 iPhone10,3 和 iPhone10,6，而今年最新发布 iPhone XS 对应 iPhone11,2，iPhone XS Max 对应 iPhone11,4 和 iPhone11,6，iPhone XR 对应 iPhone11,8，完整的 device mode 数据参考 Wiki：https://www.theiphonewiki.com/wiki/Models
 综上，我们可以先获取 device model 值，记为 platform，然后进行对比判断，转换成具体的设备型号，实现代码如下所示。
 下面只给了对 iPhone 设备型号的判断，而完整的包括 iPad 和 iPod touch 型号
 */
// https://www.theiphonewiki.com/wiki/Models

#import "UIDevice+JKHardware.h"
#import "sys/utsname.h"
#import <CoreTelephony/CTCarrier.h>
#import <CoreTelephony/CTTelephonyNetworkInfo.h>
#include <sys/types.h>
#include <sys/sysctl.h>
#import <ifaddrs.h>
#import <arpa/inet.h>
#import <sys/mount.h>
#include <mach/machine.h>
#import <mach/mach.h>
#import <mach/mach_host.h>
#import <mach/processor_info.h>
#include <objc/runtime.h>
// 获取wifi ssid 名称
#import <SystemConfiguration/CaptiveNetwork.h>
@implementation UIDevice (JKHardware)

+(NSString *)fileSizeToString:(unsigned long long)fileSize
{
    NSInteger KB = 1024;
    NSInteger MB = KB*KB;
    NSInteger GB = MB*KB;
    
    if (fileSize < 10)  {
        return @"0 B";
    }else if (fileSize < KB)    {
        return @"< 1 KB";
    }else if (fileSize < MB)    {
        return [NSString stringWithFormat:@"%.1f KB",((CGFloat)fileSize)/KB];
    }else if (fileSize < GB)    {
        return [NSString stringWithFormat:@"%.1f MB",((CGFloat)fileSize)/MB];
    }else   {
        return [NSString stringWithFormat:@"%.1f GB",((CGFloat)fileSize)/GB];
    }
}

+ (NSUInteger)getSysInfo:(uint)typeSpecifier
{
    size_t size = sizeof(int);
    int result;
    int mib[2] = {CTL_HW, typeSpecifier};
    sysctl(mib, 2, &result, &size, NULL, 0);
    return (NSUInteger)result;
}

#pragma mark 一、获取系统相关信息

#pragma mark 1.1、返回当前设备模型名字
+(NSString *)jk_deviceModelName{
    
    static NSString *device_name = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        device_name = [self platformString];

        // NSLog(@"deviceName = %@",device_name);
        
        if (device_name.length == 0) {
            
            device_name = @"iphone";
        }
        
    });
    
    return device_name;
}

+(NSString *)platformString{
    
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString *deviceString = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
    
    if ([deviceString isEqualToString:@"iPhone11,6"]) return @"iPhone XS Max";
    if ([deviceString isEqualToString:@"iPhone11,4"]) return @"iPhone XS Max";
    if ([deviceString isEqualToString:@"iPhone11,2"]) return @"iPhone XS";
    if ([deviceString isEqualToString:@"iPhone11,8"]) return @"iPhone XR";
    if ([deviceString isEqualToString:@"iPhone10,6"]) return @"iPhone X";
    if ([deviceString isEqualToString:@"iPhone10,3"]) return @"iPhone X";
    if ([deviceString isEqualToString:@"iPhone10,5"]) return @"iPhone 8 Plus";
    if ([deviceString isEqualToString:@"iPhone10,2"]) return @"iPhone 8 Plus";
    if ([deviceString isEqualToString:@"iPhone10,4"]) return @"iPhone 8";
    if ([deviceString isEqualToString:@"iPhone10,1"]) return @"iPhone 8";
    if ([deviceString isEqualToString:@"iPhone9,4"]) return @"iPhone 7 Plus";
    if ([deviceString isEqualToString:@"iPhone9,2"]) return @"iPhone 7 Plus";
    if ([deviceString isEqualToString:@"iPhone9,3"]) return @"iPhone 7";
    if ([deviceString isEqualToString:@"iPhone9,1"]) return @"iPhone 7";
    if ([deviceString isEqualToString:@"iPhone8,4"]) return @"iPhone SE";
    if ([deviceString isEqualToString:@"iPhone8,2"]) return @"iPhone 6s Plus";
    if ([deviceString isEqualToString:@"iPhone8,1"]) return @"iPhone 6s";
    if ([deviceString isEqualToString:@"iPhone7,1"]) return @"iPhone 6 Plus";
    if ([deviceString isEqualToString:@"iPhone7,2"]) return @"iPhone 6";
    if ([deviceString isEqualToString:@"iPhone6,2"]) return @"iPhone 5s";
    if ([deviceString isEqualToString:@"iPhone6,1"]) return @"iPhone 5s";
    if ([deviceString isEqualToString:@"iPhone5,4"]) return @"iPhone 5c";
    if ([deviceString isEqualToString:@"iPhone5,3"]) return @"iPhone 5c";
    if ([deviceString isEqualToString:@"iPhone5,2"]) return @"iPhone 5";
    if ([deviceString isEqualToString:@"iPhone5,1"]) return @"iPhone 5";
    if ([deviceString isEqualToString:@"iPhone4,1"]) return @"iPhone 4S";
    if ([deviceString isEqualToString:@"iPhone3,3"]) return @"iPhone 4";
    if ([deviceString isEqualToString:@"iPhone3,2"]) return @"iPhone 4";
    if ([deviceString isEqualToString:@"iPhone3,1"]) return @"iPhone 4";
    if ([deviceString isEqualToString:@"iPhone2,1"]) return @"iPhone 3GS";
    if ([deviceString isEqualToString:@"iPhone1,2"]) return @"iPhone 3G";
    if ([deviceString isEqualToString:@"iPhone1,1"]) return @"iPhone";
    if ([deviceString isEqualToString:@"iPad5,2"]) return @"iPad mini 4";
    if ([deviceString isEqualToString:@"iPad5,1"]) return @"iPad mini 4";
    if ([deviceString isEqualToString:@"iPad4,9"]) return @"iPad mini 3";
    if ([deviceString isEqualToString:@"iPad4,8"]) return @"iPad mini 3";
    if ([deviceString isEqualToString:@"iPad4,7"]) return @"iPad mini 3";
    if ([deviceString isEqualToString:@"iPad4,6"]) return @"iPad mini 2";
    if ([deviceString isEqualToString:@"iPad4,5"]) return @"iPad mini 2";
    if ([deviceString isEqualToString:@"iPad4,4"]) return @"iPad mini 2";
    if ([deviceString isEqualToString:@"iPad2,7"]) return @"iPad mini";
    if ([deviceString isEqualToString:@"iPad2,6"]) return @"iPad mini";
    if ([deviceString isEqualToString:@"iPad2,5"]) return @"iPad mini";
    
    return deviceString;
}

#pragma mark 1.2、获取设备名称
+ (NSString *)jk_getDeviceName
{
    NSString *strName = [[UIDevice currentDevice] name];
    // NSLog(@"%@",strName);
    return strName;
}

#pragma mark 1.3、获取手机名称
+ (NSString *)jk_getIphoneName
{
    NSString *phoneName = [[UIDevice currentDevice] model];
    
    return phoneName;
}

#pragma mark 1.4、获取手机系统版本
+ (NSString *)jk_getIphone_version
{
    NSString *strSysVersion = [[UIDevice currentDevice] systemVersion];
    
    //NSLog(@"%@",strSysVersion);
    
    return strSysVersion;
}

#pragma mark 1.5、获取APP的版本号
+ (NSString *)jk_getApp_bundelID{
    
    NSString *bundelID = [NSBundle mainBundle].infoDictionary[@"CFBundleShortVersionString"];
    return bundelID;
}

#pragma mark 1.6、系统名称
+ (NSString *)jk_getiOSName
{
    NSString *strSysName = [[UIDevice currentDevice] systemName];
    return strSysName;
}

#pragma mark 1.7、判断当前系统是否有摄像头
+ (BOOL)jk_hasCamera
{
    return [UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera];
}

+ (NSString *)jk_getDeviceIPAdress {
    NSString *address = @"an error occurred when obtaining ip address";
    struct ifaddrs *interfaces = NULL;
    struct ifaddrs *temp_addr = NULL;
    int success = 0;
    
    success = getifaddrs(&interfaces);
    
    if (success == 0) { // 0 表示获取成功
        
        temp_addr = interfaces;
        while (temp_addr != NULL) {
            if( temp_addr->ifa_addr->sa_family == AF_INET) {
                // Check if interface is en0 which is the wifi connection on the iPhone
                if ([[NSString stringWithUTF8String:temp_addr->ifa_name] isEqualToString:@"en0"]) {
                    // Get NSString from C String
                    address = [NSString stringWithUTF8String:inet_ntoa(((struct sockaddr_in *)temp_addr->ifa_addr)->sin_addr)];
                }
            }
            temp_addr = temp_addr->ifa_next;
        }
    }
    
    freeifaddrs(interfaces);
    return address;
}

/// 获取当前语言
+ (NSString *)jk_getDeviceLanguage {
    NSArray *languageArray = [NSLocale preferredLanguages];
    return [languageArray objectAtIndex:0];
}

+(NSString *)jk_getWifiName
{
    NSString *wifiName = nil;
    
    CFArrayRef wifiInterfaces = CNCopySupportedInterfaces();
    if (!wifiInterfaces) {
        return nil;
    }
    
    NSArray *interfaces = (__bridge NSArray *)wifiInterfaces;
    
    for (NSString *interfaceName in interfaces) {
        CFDictionaryRef dictRef = CNCopyCurrentNetworkInfo((__bridge CFStringRef)(interfaceName));
        
        if (dictRef) {
            NSDictionary *networkInfo = (__bridge NSDictionary *)dictRef;
            
            wifiName = [networkInfo objectForKey:(__bridge NSString *)kCNNetworkInfoKeySSID];
            
            CFRelease(dictRef);
        }
    }
    
    CFRelease(wifiInterfaces);
    return wifiName;
}


#pragma mark 二、获取硬件相关信息

#pragma mark 2.1、获取CPU类型
+ (NSString *)jk_getHardParam  // 返回CPU类型
{
    NSMutableString *cpu = [[NSMutableString alloc] init];
    size_t size;
    cpu_type_t type;
    cpu_subtype_t subtype;
    size = sizeof(type);
    sysctlbyname("hw.cputype", &type, &size, NULL, 0);
    
    size = sizeof(subtype);
    sysctlbyname("hw.cpusubtype", &subtype, &size, NULL, 0);
    
    // values for cputype and cpusubtype defined in mach/machine.h
    if (type == CPU_TYPE_X86)
    {
        [cpu appendString:@"x86 "];
        // check for subtype ...
        
    } else if (type == CPU_TYPE_ARM)
    {
        [cpu appendString:@"ARM"];
        [cpu appendFormat:@",Type:%d",subtype];
    }
    return cpu;
}

#pragma mark 2.2、获取运营商信息
+ (NSString *)jk_getTelephonyInfo
{
    CTTelephonyNetworkInfo *info = [[CTTelephonyNetworkInfo alloc] init];
    CTCarrier *carrier = [info subscriberCellularProvider];
    NSString *mCarrier = [NSString stringWithFormat:@"%@",[carrier carrierName]];
    
    return mCarrier;
}

#pragma mark 2.4、异常信息收集处理
// 异常收集处理
void UncaughtExceptionHandler(NSException *exception) {
    NSArray *arr = [exception callStackSymbols];
    NSString *reason = [exception reason];
    NSString *name = [exception name];
    
    NSLog(@"%@,%@,%@",arr,reason,name);
}

// 写入异常信息
-(void)writeACrashMessage
{
    NSSetUncaughtExceptionHandler(&UncaughtExceptionHandler);
}

+ (NSUInteger)jk_cpuFrequency {
    return [self getSysInfo:HW_CPU_FREQ];
}

#pragma mark 2.6、获取网络类型
+(NSString*)jk_getNetworkType
{
    /**
     CORETELEPHONY_EXTERN NSString * const CTRadioAccessTechnologyGPRS          __OSX_AVAILABLE_STARTING(__MAC_NA,__IPHONE_7_0);
     CORETELEPHONY_EXTERN NSString * const CTRadioAccessTechnologyEdge          __OSX_AVAILABLE_STARTING(__MAC_NA,__IPHONE_7_0);
     CORETELEPHONY_EXTERN NSString * const CTRadioAccessTechnologyWCDMA         __OSX_AVAILABLE_STARTING(__MAC_NA,__IPHONE_7_0);
     CORETELEPHONY_EXTERN NSString * const CTRadioAccessTechnologyHSDPA         __OSX_AVAILABLE_STARTING(__MAC_NA,__IPHONE_7_0);
     CORETELEPHONY_EXTERN NSString * const CTRadioAccessTechnologyHSUPA         __OSX_AVAILABLE_STARTING(__MAC_NA,__IPHONE_7_0);
     CORETELEPHONY_EXTERN NSString * const CTRadioAccessTechnologyCDMA1x        __OSX_AVAILABLE_STARTING(__MAC_NA,__IPHONE_7_0);
     CORETELEPHONY_EXTERN NSString * const CTRadioAccessTechnologyCDMAEVDORev0  __OSX_AVAILABLE_STARTING(__MAC_NA,__IPHONE_7_0);
     CORETELEPHONY_EXTERN NSString * const CTRadioAccessTechnologyCDMAEVDORevA  __OSX_AVAILABLE_STARTING(__MAC_NA,__IPHONE_7_0);
     CORETELEPHONY_EXTERN NSString * const CTRadioAccessTechnologyCDMAEVDORevB  __OSX_AVAILABLE_STARTING(__MAC_NA,__IPHONE_7_0);
     CORETELEPHONY_EXTERN NSString * const CTRadioAccessTechnologyeHRPD         __OSX_AVAILABLE_STARTING(__MAC_NA,__IPHONE_7_0);
     CORETELEPHONY_EXTERN NSString * const CTRadioAccessTechnologyLTE           __OSX_AVAILABLE_STARTING(__MAC_NA,__IPHONE_7_0);
     **/
    NSArray *typeStrings2G = @[CTRadioAccessTechnologyEdge,CTRadioAccessTechnologyGPRS,CTRadioAccessTechnologyCDMA1x];
    NSArray *typeStrings3G = @[CTRadioAccessTechnologyHSDPA,CTRadioAccessTechnologyWCDMA,CTRadioAccessTechnologyHSUPA,CTRadioAccessTechnologyCDMAEVDORev0,CTRadioAccessTechnologyCDMAEVDORevA,CTRadioAccessTechnologyCDMAEVDORevB,CTRadioAccessTechnologyeHRPD];
    NSArray *typeStrings4G = @[CTRadioAccessTechnologyLTE];
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0) {
        CTTelephonyNetworkInfo *teleInfo= [[CTTelephonyNetworkInfo alloc] init];
        NSString *accessString = teleInfo.currentRadioAccessTechnology;
       
        if ([typeStrings4G containsObject:accessString]) {
            return @"4G网络";
        } else if ([typeStrings3G containsObject:accessString]) {
            return @"3G网络";
        } else if ([typeStrings2G containsObject:accessString]) {
            return @"2G网络";
        } else {
            return @"未知网络";
        }
    }
    return @"未知网络";
}

+(NSString*)jk_getTotalMemorySize
{
    return [self fileSizeToString:[NSProcessInfo processInfo].physicalMemory];
}

+(NSString*)jk_getAvailableMemorySize
{
    vm_statistics_data_t vmStats;
    mach_msg_type_number_t infoCount = HOST_VM_INFO_COUNT;
    kern_return_t kernReturn = host_statistics(mach_host_self(), HOST_VM_INFO, (host_info_t)&vmStats, &infoCount);
    if (kernReturn != KERN_SUCCESS)
    {
        return [self fileSizeToString:NSNotFound];
    }
    return [self fileSizeToString:((vm_page_size * vmStats.free_count + vm_page_size * vmStats.inactive_count))];
}

+(NSString*)jk_getUsedMemory
{
    task_basic_info_data_t taskInfo;
    mach_msg_type_number_t infoCount = TASK_BASIC_INFO_COUNT;
    kern_return_t kernReturn = task_info(mach_task_self(),
                                         TASK_BASIC_INFO,
                                         (task_info_t)&taskInfo,
                                         &infoCount);
    
    if (kernReturn != KERN_SUCCESS
        ) {
        return [self fileSizeToString:NSNotFound];
    }
    
    return [self fileSizeToString:taskInfo.resident_size];
}

+(NSString*)jk_getTotalDiskSize
{
    struct statfs buf;
    unsigned long long freeSpace = -1;
    if (statfs("/var", &buf) >= 0)
    {
        freeSpace = (unsigned long long)(buf.f_bsize * buf.f_blocks);
    }
    return [self fileSizeToString:freeSpace];
}

+(NSString*)jk_getAvailableDiskSize
{
    struct statfs buf;
    unsigned long long freeSpace = -1;
    if (statfs("/var", &buf) >= 0)
    {
        freeSpace = (unsigned long long)(buf.f_bsize * buf.f_bavail);
    }
    return [self fileSizeToString:freeSpace];
}


#pragma mark 三、电池相关的信息
#pragma mark 判断当前设备电池状态
+(NSString *)jk_batteryStatues{
    
    /**
     UIDeviceBatteryStateUnknown,
     UIDeviceBatteryStateUnplugged,   // 未充电，使用电池
     UIDeviceBatteryStateCharging,    // 充电中，并且电量小于 100%
     UIDeviceBatteryStateFull,        // 充电中, 电量已达 100%
     */
    
    [UIDevice currentDevice].batteryMonitoringEnabled = YES; //开启电量监控，默认不开启
    if ([[UIDevice currentDevice] batteryState] == UIDeviceBatteryStateCharging) return @"正在充电中，且电量不足100";
    if ([[UIDevice currentDevice] batteryState] == UIDeviceBatteryStateUnplugged) return @"未充电，使用电池";
    if ([[UIDevice currentDevice] batteryState] == UIDeviceBatteryStateFull) return @"充电中, 电量已达 100%";
    
    //当前电量，小数[0,1] ,如果[[UIDevice currentDevice] batteryState] == UIDeviceBatteryStateUnknown时，则为1.0
    //NSLog(@"当前电量%f",[[UIDevice currentDevice] batteryLevel]);
    
    return [NSString stringWithFormat:@"当前电量%f",[[UIDevice currentDevice] batteryLevel]];
}

+ (CGFloat)jk_getCurrentBatteryLevel {
    UIApplication *app = [UIApplication sharedApplication];
    if (app.applicationState == UIApplicationStateActive||app.applicationState==UIApplicationStateInactive) {
        Ivar ivar=  class_getInstanceVariable([app class],"_statusBar");
        id status  = object_getIvar(app, ivar);
        for (id aview in [status subviews]) {
            int batteryLevel = 0;
            for (id bview in [aview subviews]) {
                if ([NSStringFromClass([bview class]) caseInsensitiveCompare:@"UIStatusBarBatteryItemView"] == NSOrderedSame&&[[[UIDevice currentDevice] systemVersion] floatValue] >=6.0) {
                    
                    Ivar ivar=  class_getInstanceVariable([bview class],"_capacity");
                    if(ivar) {
                        batteryLevel = ((int (*)(id, Ivar))object_getIvar)(bview, ivar);
                        if (batteryLevel > 0 && batteryLevel <= 100) {
                            return batteryLevel;
                            
                        } else {
                            return 0;
                        }
                    }
                }
            }
        }
    }
    
    return 0;
}

-(CGFloat)jk_getBatteryQuantity
{
    return [[UIDevice currentDevice] batteryLevel];
}

@end
