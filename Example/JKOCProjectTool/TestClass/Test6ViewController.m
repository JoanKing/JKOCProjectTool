//
//  Test6ViewController.m
//  JKOCProjectToolDemo
//
//  Created by IronMan on 2020/10/9.
//  Copyright © 2020 JK科技有限公司. All rights reserved.
//

#import "Test6ViewController.h"

@interface Test6ViewController ()

@end

@implementation Test6ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIView *testView = [[UIView alloc]initWithFrame:CGRectMake(60, 200, 160, 60)];
    testView.backgroundColor = [UIColor brownColor];
    [testView addShadowAndCornerSuperView:self.view roundRectCorner:UIRectCornerTopLeft withCornerRadius:8 shadowRadius:8 shadowColor:[UIColor blackColor] withShadowOffset:CGSizeMake(3,2) withShadowOpacity:0.8];
    [self.view addSubview:testView];
}

   





@end
