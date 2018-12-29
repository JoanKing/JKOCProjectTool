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
    
    NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:@"https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=869191250,4155304761&fm=200&gp=0.jpg"]];
    
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(20, 150,200, 200)];
    imageView.image = [UIImage jk_ellipseImage:[UIImage imageWithData:data] withInset:50 withBorderWidth:10 withBorderColor:[UIColor brownColor]];
    [self.view addSubview:imageView];
    
    UIImageView *imageView2 = [[UIImageView alloc]initWithFrame:CGRectMake(20, imageView.bottom+50,200, 200)];
    imageView2.image = [UIImage imageWithData:data];
    imageView2.layer.cornerRadius = 100;
    imageView2.clipsToBounds = YES;
    [self.view addSubview:imageView2];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    Test3ViewController *vc = [Test3ViewController new];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
