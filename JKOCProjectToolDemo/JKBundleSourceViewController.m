//
//  JKBundleSourceViewController.m
//  JKOCProjectToolDemo
//
//  Created by 王冲 on 2019/1/4.
//  Copyright © 2019年 JK科技有限公司. All rights reserved.
//

#import "JKBundleSourceViewController.h"

@interface JKBundleSourceViewController ()

@end

@implementation JKBundleSourceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    NSString *bankName = [NSString jk_bankNameAccordingToBankNumber:@"6221504910008273051"];
    NSLog(@"银行的名字=%@",bankName);
    
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
