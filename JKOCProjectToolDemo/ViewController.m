//
//  ViewController.m
//  JKOCProjectToolDemo
//
//  Created by 王冲 on 2018/11/11.
//  Copyright © 2018年 JK科技有限公司. All rights reserved.
//

#import "ViewController.h"
#import "JKOCProjectTool.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *str = [JKDate convertTimestamp:@"1543913866" withDateType:@"2" withJudgeYear:YES];
    
    NSLog(@"转化后的时间=%@",str);
}


@end
