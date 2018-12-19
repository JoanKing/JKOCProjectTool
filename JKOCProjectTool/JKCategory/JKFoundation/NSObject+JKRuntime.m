//
//  NSObject+JKRuntime.m
//  JKOCProjectToolDemo
//
//  Created by 王冲 on 2018/12/19.
//  Copyright © 2018年 JK科技有限公司. All rights reserved.
//

#import "NSObject+JKRuntime.h"

char * const JKProtectCrashProtectorName = "JKProtectCrashProtector";

void ProtectCrashProtected(id self, SEL sel) {
}

@implementation NSObject (JKRuntime)

// MARK: Util
+ (void)swizzleClassMethodWithOriginSel:(SEL)oriSel swizzledSel:(SEL)swiSel {
    Class cls = object_getClass(self);
    
    Method originAddObserverMethod = class_getClassMethod(cls, oriSel);
    Method swizzledAddObserverMethod = class_getClassMethod(cls, swiSel);
    
    [self swizzleMethodWithOriginSel:oriSel oriMethod:originAddObserverMethod swizzledSel:swiSel swizzledMethod:swizzledAddObserverMethod class:cls];
}

+ (void)swizzleInstanceMethodWithOriginSel:(SEL)oriSel swizzledSel:(SEL)swiSel {
    Method originAddObserverMethod = class_getInstanceMethod(self, oriSel);
    Method swizzledAddObserverMethod = class_getInstanceMethod(self, swiSel);
    
    [self swizzleMethodWithOriginSel:oriSel oriMethod:originAddObserverMethod swizzledSel:swiSel swizzledMethod:swizzledAddObserverMethod class:self];
}

+ (void)swizzleMethodWithOriginSel:(SEL)oriSel
                         oriMethod:(Method)oriMethod
                       swizzledSel:(SEL)swizzledSel
                    swizzledMethod:(Method)swizzledMethod
                             class:(Class)cls {
    BOOL didAddMethod = class_addMethod(cls, oriSel, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod));
    
    if (didAddMethod) {
        class_replaceMethod(cls, swizzledSel, method_getImplementation(oriMethod), method_getTypeEncoding(oriMethod));
    } else {
        method_exchangeImplementations(oriMethod, swizzledMethod);
    }
}

+ (Class)addMethodToStubClass:(SEL)aSelector {
    Class ProtectCrashProtector = objc_getClass(JKProtectCrashProtectorName);
    
    if (!ProtectCrashProtector) {
        ProtectCrashProtector = objc_allocateClassPair([NSObject class], JKProtectCrashProtectorName, sizeof([NSObject class]));
        objc_registerClassPair(ProtectCrashProtector);
    }
    
    class_addMethod(ProtectCrashProtector, aSelector, (IMP)ProtectCrashProtected, "v@:");
    return ProtectCrashProtector;
}

- (BOOL)isMethodOverride:(Class)cls selector:(SEL)sel {
    IMP clsIMP = class_getMethodImplementation(cls, sel);
    IMP superClsIMP = class_getMethodImplementation([cls superclass], sel);
    
    return clsIMP != superClsIMP;
}

+ (BOOL)isMainBundleClass:(Class)cls {
    return cls && [[NSBundle bundleForClass:cls] isEqual:[NSBundle mainBundle]];
}

@end
