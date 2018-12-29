//
//  Test5ViewController.m
//  JKOCProjectToolDemo
//
//  Created by 王冲 on 2018/12/8.
//  Copyright © 2018年 JK科技有限公司. All rights reserved.

#import "Test5ViewController.h"
#import "Test3ViewController.h"
@interface Test5ViewController ()
 
@end

@implementation Test5ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Test5";
    self.view.backgroundColor = [UIColor whiteColor];

}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
     [self.navigationController jk_popToViewControllerWithClassName:[Test3ViewController class] animated:NO];

}


@end
