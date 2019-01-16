//
//  JKSmallLabels.m
//  JKSmallLabels
//
//  Created by 王冲 on 2018/5/19.
//  Copyright © 2018年 JK科技有限公司. All rights reserved.
//

#import "JKSmallLabels.h"
#import "UIView+JKLayout.h"
@interface JKSmallLabels ()

@end

@implementation JKSmallLabels


-(CGSize)calculationLabelWidthString:(NSString *)textContent withLabelFont:(CGFloat)textfont withmaxSize:(CGSize)maxSize{
    
    UIFont *font = [UIFont systemFontOfSize:textfont];
    NSDictionary *attrs = @{NSFontAttributeName:font};
    return [textContent boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading |NSLineBreakByCharWrapping attributes:attrs context:nil].size;
}

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
-(JKSmallLabels *)createSmallLabelGroupNames:(NSArray *)labelNames withlabelFont:(CGFloat)text_font withlabelTextColor:(UIColor *)text_color withlabelBackgroundColor:(UIColor *)text_bg_color withMaxWidth:(CGFloat)max_label_width withInsideHorizontalSpace:(CGFloat)label_inside_h_space withInsideVerticalSpace:(CGFloat)label_inside_v_space withOuterHorizontalSpace:(CGFloat)label_outer_h_space withOuterVerticalSpace:(CGFloat)label_outer_v_space{

    JKSmallLabels *bottom = [[JKSmallLabels alloc]initWithFrame:CGRectMake(0, 0, max_label_width, 200)];
    bottom.backgroundColor = [UIColor whiteColor];
    
    CGFloat labelX = 0;
    CGFloat labelY = 0;
    
    for (int i = 0; i<labelNames.count; i++) {
        
        CGFloat smallLabelWidth = [self calculationLabelWidthString:labelNames[i] withLabelFont:text_font withmaxSize:CGSizeMake(max_label_width-label_inside_h_space*2, text_font+2)].width;

        CGFloat maxX = labelX+label_outer_h_space+smallLabelWidth+label_inside_h_space*2;
        
        if (maxX > max_label_width && i > 0) {
                
            labelY = labelY+text_font+2+label_inside_v_space*2+ label_outer_v_space;
            labelX = 0;
        }
        
        UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(labelX, labelY, smallLabelWidth+label_inside_h_space*2, text_font+2+label_inside_v_space*2)];
        button.layer.cornerRadius = 2;
        button.clipsToBounds = YES;
        button.tag = 100+i;
        [button addTarget:self action:@selector(clickLabel:) forControlEvents:UIControlEventTouchUpInside];
        [button setBackgroundColor:text_bg_color];
        
        UILabel *smallLabel = [[UILabel alloc]initWithFrame:CGRectMake(label_inside_h_space, label_inside_v_space, smallLabelWidth, text_font+2)];
        smallLabel.font = [UIFont systemFontOfSize:text_font];
        smallLabel.textAlignment = NSTextAlignmentLeft;
        smallLabel.text = labelNames[i];
        smallLabel.textColor = text_color;
        smallLabel.backgroundColor = [UIColor brownColor];
        [button addSubview:smallLabel];
        
        [bottom addSubview:button];
    
        labelX = labelX+smallLabelWidth+label_inside_h_space*2+label_outer_h_space;
    }
    
    bottom.height = labelY + text_font+2+label_inside_v_space*2;

    return bottom;
}

-(void)clickLabel:(UIButton *)sender{
    
    NSInteger tag = sender.tag - 100;

    if (self.JKSmallLabelClick) {
        self.JKSmallLabelClick(tag);
    }
    
}

@end

