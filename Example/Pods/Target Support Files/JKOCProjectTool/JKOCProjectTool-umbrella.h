#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "JKOCProjectTool.h"
#import "NSData+JKBase64.h"
#import "NSData+JKData.h"
#import "NSData+JKEncrypt.h"
#import "NSData+JKGzip.h"
#import "NSData+JKHash.h"
#import "NSData+JK_AES.h"
#import "NSDate+JKExtension.h"
#import "NSDate+JKFormatter.h"
#import "NSMutableArray+JKMutableArray.h"
#import "NSObject+JKRuntime.h"
#import "NSString+JKBase64.h"
#import "NSString+JKContains.h"
#import "NSString+JKHash.h"
#import "NSString+JKPinyin.h"
#import "NSString+JKRegex.h"
#import "NSString+JKRemoveEmoji.h"
#import "NSString+JKString.h"
#import "NSString+JKXML.h"
#import "NSString+JK_MD5.h"
#import "UIFont+JKExtension.h"
#import "JKMacro.h"
#import "JKScreenSize.h"
#import "JKSingle.h"
#import "CALayer+JKLayer.h"
#import "UIApplication+JKExtension.h"
#import "UIBarButtonItem+JKBarbuttonItem.h"
#import "UIButton+JKExtension.h"
#import "UIColor+JKColor.h"
#import "UIDevice+JKHardware.h"
#import "UIImage+JKColorImage.h"
#import "UIImage+JKDirection.h"
#import "UIImage+JKGIF.h"
#import "UIImage+JKImage.h"
#import "UIImage+JKScaleVideoImage.h"
#import "UIImageView+JKImageView.h"
#import "UILabel+JKLabel.h"
#import "UINavigationController+JKNavigationController.h"
#import "UIResponder+JKExtension.h"
#import "UIScrollView+JKExtension.h"
#import "UITextField+JKTextField.h"
#import "UITextView+JKExtension.h"
#import "UIView+JKLayout.h"
#import "UIViewController+JKViewController.h"
#import "UIWebView+JKExtension.h"
#import "UIWindow+JKHierarchy.h"
#import "JKDate.h"
#import "JKGCDTimer.h"
#import "JKLimitInput.h"
#import "JKQRCode.h"
#import "JKScanningQRViewController.h"
#import "JKRSATool.h"
#import "JKSandboxPath.h"
#import "JKSmallLabels.h"
#import "JKTextExtension.h"
#import "JKTopWindow.h"

FOUNDATION_EXPORT double JKOCProjectToolVersionNumber;
FOUNDATION_EXPORT const unsigned char JKOCProjectToolVersionString[];

