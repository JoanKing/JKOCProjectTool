//
//  ViewController.m
//  JKOCProjectToolDemo
//
//  Created by 王冲 on 2018/11/11.
//  Copyright © 2018年 JK科技有限公司. All rights reserved.
//

#import "ViewController.h"
#import "Test2ViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    JKStartTime;
    
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(50, 200,JK_SCREEN_WIDTH-100 , 100)];
    view.layer.cornerRadius = 50;
    [view jk_setGradientBackgroundWithColors:@[JKRGBColor(255,219,0,1),JKRGBColor(255,185,17,1)] locations:nil startPoint:CGPointMake(0, 0) endPoint:CGPointMake(1, 0)];
    [view jk_addShadowToViewShadowRadius:4 withColor:JKRGBColor(255,185,17,1) withShadowOffset:CGSizeMake(0, 2) withShadowOpacity:0.48];
    [view jk_addTapActionWithBlock:^(UITapGestureRecognizer * _Nonnull gestureRecoginzer) {
        
        NSLog(@"%@",@"我点击了");
    }];
    
    [self.view addSubview:view];
    
    [view.layer jk_shake];
    
    JKWeakSelf(self);
    dispatch_async(dispatch_get_main_queue(), ^{
        
        [weakself hh];
    });
    
    JKEndTime;
    
    NSLog(@"当前的语言=%@",JKCurrentLanguage);
    
}

-(void)hh{
    
    NSLog(@"HH");
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    Test2ViewController *vc = [Test2ViewController new];
    [self.navigationController pushViewController:vc animated:YES];
}


@end
