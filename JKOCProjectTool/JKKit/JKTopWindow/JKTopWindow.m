//
//  JKTopWindow.m
//  StatesWindow
//
//  Created by 王冲 on 2016/12/8.
//  Copyright © 2016年 希爱欧科技有限公司. All rights reserved.
//

#import "JKTopWindow.h"


@implementation JKTopWindow

static UIWindow *window_;

+(void)initialize{

    window_ = [[UIWindow alloc]init];
    //高度保持20
    window_.frame = CGRectMake(150, 0, [UIScreen mainScreen].bounds.size.width-150, 20);
    //最上面
    window_.windowLevel = UIWindowLevelAlert;
    window_.backgroundColor = [UIColor clearColor];
    //添加手势
    [window_ addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(windowClick)]];
}

//窗口显示
+(void)show{

    window_.hidden = NO;
    
}

//窗口隐藏
+(void)hide{

   window_.hidden = YES;
}

/*
 *  监听窗口点击
 */
+(void)windowClick{

    //NSLog(@"点击了");
    
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    
    [self searchScrollewInView:window];
}

+(void)searchScrollewInView:(UIView *)superview{
    
    for (UIScrollView *subview in superview.subviews) {
        
        //nil = [UIApplication sharedApplication].keyWindow
        //转换坐标系
        CGRect newFrame = [subview.superview convertRect:subview.frame toView:[UIApplication sharedApplication].keyWindow];
        //CGRect newFrame = [[UIApplication sharedApplication].keyWindow convertRect:subview.frame fromView:subview.superview];
        
        CGRect windowBouns = [UIApplication sharedApplication].keyWindow.bounds;
        
        //判断一个控件是否真正显示在窗口范围内
        BOOL isShowOnWindow = !subview.isHidden && subview.alpha > 0.01 && CGRectIntersectsRect(newFrame, windowBouns) && subview.window == [UIApplication sharedApplication].keyWindow;
        
        
        //1.如果是scrollew和2.在用户的眼前且3.在window上就滚到顶部
        if ([subview isKindOfClass:[UIScrollView class]] && isShowOnWindow) {
            
            CGPoint offset = subview.contentOffset;
            offset.y = -subview.contentInset.top;
            
            [subview setContentOffset:offset animated:YES];
        }
        
        //继续查找子控件（采用递归的方式）
        [self searchScrollewInView:subview];
    }
}

@end
