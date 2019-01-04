//
//  TestViewController.m
//  JKOCProjectToolDemo
//
//  Created by 王冲 on 2018/12/28.
//  Copyright © 2018年 JK科技有限公司. All rights reserved.
//

#import "TestViewController.h"
#import "Test2ViewController.h"
@interface TestViewController ()

@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    NSLog(@"%d",(-1)>=3);
    
    NSLog(@"网络的类型=%@",[UIDevice jk_getNetworkType]);
    
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(50, 200,JK_SCREEN_WIDTH-100 , 100)];
    view.layer.cornerRadius = 50;
    [view jk_setGradientBackgroundWithColors:@[JKRGBColor(255,219,0,1),JKRGBColor(255,185,17,1)] locations:nil startPoint:CGPointMake(0, 0) endPoint:CGPointMake(1, 0)];
    [view jk_addShadowToViewShadowRadius:4 withColor:JKRGBColor(255,185,17,1) withShadowOffset:CGSizeMake(0, 2) withShadowOpacity:0.48];
    [view jk_addTapActionWithBlock:^(UITapGestureRecognizer * _Nonnull gestureRecoginzer) {
        
        JKLog(@"%@",@"我点击了");
    }];
    
    [self.view addSubview:view];
    
    [view.layer jk_shake];
    
    
    JKLog(@"\n获取设备名称=%@\n获取手机名称=%@\n当前wifi的名字是：%@",[UIDevice jk_getDeviceName],[UIDevice jk_getIphoneName],[UIDevice jk_getWifiName]);
    
}



- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    Test2ViewController *vc = [Test2ViewController new];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
