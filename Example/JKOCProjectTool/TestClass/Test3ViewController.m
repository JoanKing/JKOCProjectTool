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
    
    UIImageView *imageview = [[UIImageView alloc]initWithFrame:CGRectMake(20, 100, 100, 100)];
    imageview.image = [[UIImage jk_animatedGIFNamed:@"monkey"] jk_animatedImageByScalingAndCroppingToSize:CGSizeMake(50, 50)];
    imageview.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:imageview];
    
    
   
    
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    Test4ViewController *vc = [Test4ViewController new];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
