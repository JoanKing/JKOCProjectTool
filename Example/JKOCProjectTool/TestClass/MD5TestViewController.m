//
//  MD5TestViewController.m
//  JKOCProjectToolDemo
//
//  Created by 王冲 on 2018/12/28.
//  Copyright © 2018年 JK科技有限公司. All rights reserved.
//

#import "MD5TestViewController.h"

@interface MD5TestViewController ()
{
    
}
@end

@implementation MD5TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"MD5加密";
    self.view.backgroundColor = [UIColor whiteColor];
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
   NSString *password = [NSString jk_MD5ForLower16Bate:@"123"];
    
    JKLog(@"MD5ForLower16Bate=%@",password);
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
