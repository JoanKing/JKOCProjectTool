//
//  JKSmallLabels.h
//  JKSmallLabels
//
//  Created by 王冲 on 2018/5/19.
//  Copyright © 2018年 JK科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JKSmallLabels : UIView

@property(nonatomic,strong) void(^JKSmallLabelClick)(NSInteger tag);

/**
 根据传进来的数组来计算标签的视图，返回一个整理标签的view
 
 @param labelNames 标签数组名字
 @param text_font 标签的字体大小
 @param text_color 标签的字体颜色
 @param text_bg_color 标签的背景颜色
 @param max_label_width 标签的最大宽度
 @param label_inside_h_space 标签文字与外框之间的水平间距
 @param label_inside_v_space 标签文字与外框之间的垂直间距
 @param label_outer_h_space  标签与标签之间的水平间距
 @param label_outer_v_space 标签与标签之间的垂直间距
 @return 返回一个组合好的view
 */
-(JKSmallLabels *)createSmallLabelGroupNames:(NSArray *)labelNames withlabelFont:(CGFloat)text_font withlabelTextColor:(UIColor *)text_color withlabelBackgroundColor:(UIColor *)text_bg_color withMaxWidth:(CGFloat)max_label_width withInsideHorizontalSpace:(CGFloat)label_inside_h_space withInsideVerticalSpace:(CGFloat)label_inside_v_space withOuterHorizontalSpace:(CGFloat)label_outer_h_space withOuterVerticalSpace:(CGFloat)label_outer_v_space;

@end

