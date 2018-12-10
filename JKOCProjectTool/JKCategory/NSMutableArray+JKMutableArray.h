//
//  NSMutableArray+JKMutableArray.h
//  JKOCProjectToolDemo
//
//  Created by 王冲 on 2018/12/3.
//  Copyright © 2018年 JK科技有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSMutableArray (JKMutableArray)

#pragma mark 1、数组字典的排序
/**
 数组字典的排序

 @param ascending YES：升序  NO降序
 @param key 字典的某一个键值: 支持：字符串的abc,int/float类型
 */
-(void)sortAscending:(BOOL)ascending withKey:(NSString *)key;

@end

NS_ASSUME_NONNULL_END
