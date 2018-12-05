//
//  ViewController.m
//  JKOCProjectToolDemo
//
//  Created by 王冲 on 2018/11/11.
//  Copyright © 2018年 JK科技有限公司. All rights reserved.
//

#import "ViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(10, 100, 100, 200)];
    label.backgroundColor = [UIColor yellowColor];
    label.text = [JKTextExtension jkRemoveStringHeadAndFootSpace:@" I Love You "];
    NSLog(@"length=%ld",label.text.length);
    
    [self.view addSubview:label];
    
    
   
}


@end
