//
//  UIView+JKUiviewExtension.h
//  CIOTimes
//
//  Created by 王冲 on 2016/12/8.
//  Copyright © 2016年 wangchao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (JKUiviewExtension)

@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGSize size;
@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;
@property (nonatomic) CGPoint origin;

@property (nonatomic) CGFloat top;
@property (nonatomic) CGFloat left;
@property (nonatomic) CGFloat bottom;
@property (nonatomic) CGFloat right;


//判断一个view是否在window上面
-(BOOL)isShowingOnWindow;

@end
