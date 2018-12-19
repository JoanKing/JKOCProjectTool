//
//  NSObject+JKRuntime.h
//  JKOCProjectToolDemo
//
//  Created by 王冲 on 2018/12/19.
//  Copyright © 2018年 JK科技有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>
NS_ASSUME_NONNULL_BEGIN

@interface NSObject (JKRuntime)

#pragma mark 1、类方法
/**
 swizzle 类方法
 
 @param oriSel 原有的方法
 @param swiSel swizzle的方法
 */
+ (void)swizzleClassMethodWithOriginSel:(SEL)oriSel swizzledSel:(SEL)swiSel;

#pragma mark 2、实例方法
/**
 swizzle 实例方法
 
 @param oriSel 原有的方法
 @param swiSel swizzle的方法
 */
+ (void)swizzleInstanceMethodWithOriginSel:(SEL)oriSel swizzledSel:(SEL)swiSel;

#pragma mark 3、判断方法是否在子类里override了
/**
 判断方法是否在子类里override了
 
 @param cls 传入要判断的Class
 @param sel 传入要判断的Selector
 @return 返回判断是否被重载的结果
 */
- (BOOL)isMethodOverride:(Class)cls selector:(SEL)sel;

#pragma mark 4、判断当前类是否在主bundle里
/**
 判断当前类是否在主bundle里
 
 @param cls 出入类
 @return 返回判断结果
 */
+ (BOOL)isMainBundleClass:(Class)cls;

#pragma mark 5、动态创建绑定selector的类
/**
 动态创建绑定selector的类
 tip：每当无法找到selectorcrash转发过来的所有selector都会追加到当前Class上
 
 @param aSelector 传入selector
 @return 返回创建的类
 */
+ (Class)addMethodToStubClass:(SEL)aSelector;


@end

NS_ASSUME_NONNULL_END
