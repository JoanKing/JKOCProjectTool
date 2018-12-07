//
//  UIImageView+JKImageView.m
//  JKOCProjectToolDemo
//
//  Created by 王冲 on 2018/12/7.
//  Copyright © 2018年 JK科技有限公司. All rights reserved.
//

#import "UIImageView+JKImageView.h"

@implementation UIImageView (JKImageView)

- (void)jk_rotate360DegreeWithImageView {
    CABasicAnimation *rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation.toValue = [NSNumber numberWithFloat: M_PI * 2.0 ];
    rotationAnimation.duration = 2;
    rotationAnimation.cumulative = YES;
    rotationAnimation.repeatCount = MAXFLOAT;
    [self.layer addAnimation:rotationAnimation forKey:@"rotationAnimation"];
}

-(void)jk_rotate360DegreeWithImageViewRepeatCount:(float)repeat_count withDuration:(CFTimeInterval)duration{
    CABasicAnimation *rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation.toValue = [NSNumber numberWithFloat: M_PI * 2.0 ];
    rotationAnimation.duration = duration;
    rotationAnimation.cumulative = YES;
    rotationAnimation.repeatCount = repeat_count;
    [self.layer addAnimation:rotationAnimation forKey:@"rotationAnimation"];
}

- (void)jk_stopRotate {
    [self.layer removeAllAnimations];
}

@end
