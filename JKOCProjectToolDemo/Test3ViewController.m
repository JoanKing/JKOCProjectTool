//
//  Test3ViewController.m
//  JKOCProjectToolDemo
//
//  Created by 王冲 on 2018/12/8.
//  Copyright © 2018年 JK科技有限公司. All rights reserved.
//

#import "Test3ViewController.h"
#import "Test4ViewController.h"
@interface Test3ViewController ()

@end

@implementation Test3ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Test3";
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    Test4ViewController *vc = [Test4ViewController new];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
