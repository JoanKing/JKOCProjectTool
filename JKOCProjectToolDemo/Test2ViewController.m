//
//  Test2ViewController.m
//  JKOCProjectToolDemo
//
//  Created by 王冲 on 2018/12/8.
//  Copyright © 2018年 JK科技有限公司. All rights reserved.
//

#import "Test2ViewController.h"
#import "Test3ViewController.h"
@interface Test2ViewController ()

@end

@implementation Test2ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Test2";
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    Test3ViewController *vc = [Test3ViewController new];
    [self.navigationController pushViewController:vc animated:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
