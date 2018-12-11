//
//  NSString+JKPinyin.h
//  JKOCProjectToolDemo
//
//  Created by 王冲 on 2018/12/11.
//  Copyright © 2018年 JK科技有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (JKPinyin)

// 原作者：https://github.com/croath/NSString-Pinyin

- (NSString*)jk_pinyinWithPhoneticSymbol;
- (NSString*)jk_pinyin;
- (NSArray*)jk_pinyinArray;
- (NSString*)jk_pinyinWithoutBlank;
- (NSArray*)jk_pinyinInitialsArray;
- (NSString*)jk_pinyinInitialsString;

@end

NS_ASSUME_NONNULL_END
