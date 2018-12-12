//
//  Test4ViewController.m
//  JKOCProjectToolDemo
//
//  Created by 王冲 on 2018/12/8.
//  Copyright © 2018年 JK科技有限公司. All rights reserved.
//

#import "Test4ViewController.h"
#import "Test5ViewController.h"
@interface Test4ViewController ()

@end

@implementation Test4ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Test4";
    self.view.backgroundColor = [UIColor whiteColor];
    
    UITextView *textView = [[UITextView alloc]initWithFrame:CGRectMake(20, 100, JK_SCREEN_WIDTH-40, 100)];
    textView.backgroundColor = [UIColor yellowColor];
    [textView addPlaceHolder:@"哈哈"];
    textView.placeHolderTextView.font = [UIFont systemFontOfSize:28.f];
    [textView setValue:@10 forKey:@"limit"];
    textView.font = [UIFont systemFontOfSize:28.f];
    [self.view addSubview:textView];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    Test5ViewController *vc = [Test5ViewController new];
    [self.navigationController pushViewController:vc animated:YES];
}


@end
