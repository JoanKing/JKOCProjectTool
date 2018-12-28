//
//  DateViewController.m
//  JKOCProjectToolDemo
//
//  Created by 王冲 on 2018/12/28.
//  Copyright © 2018年 JK科技有限公司. All rights reserved.
//

#import "DateViewController.h"

@interface DateViewController ()

@end

@implementation DateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"有关日期的使用";
    self.view.backgroundColor = [UIColor whiteColor];
    
    NSString *second = @"1545987532";
    NSString *dateStr = [JKDate convertTimestamp:second withDateFormat:@"yyyy_MM_dd hh:mm"];
    JKLog(@"dateStr=%@",dateStr);
    
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
