//
//  JKSmallLabelViewController.m
//  JKOCProjectToolDemo
//
//  Created by 王冲 on 2019/1/16.
//  Copyright © 2019年 JK科技有限公司. All rights reserved.
//

#import "JKSmallLabelViewController.h"

@interface JKSmallLabelViewController ()

@end

@implementation JKSmallLabelViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    // 标签的最大宽度
    CGFloat maxWidth = JK_SCREEN_WIDTH-32;
    
    NSArray *expert_tagArray = @[@"根据传进来的数组来计算标签的视图，返回一个整理标签的vie信息安全信息安全信息安全信息安全信息安全",@"商务智能",@"区块链",@"IT项目管理",@"电子商",@"管理系统",@"软技能",@"信息安全",@"变革转型"];
    
    JKSmallLabels *jkSmallLabels = [[JKSmallLabels new]createSmallLabelGroupNames:expert_tagArray withlabelFont:12 withlabelTextColor:[UIColor purpleColor] withlabelBackgroundColor:[UIColor yellowColor] withMaxWidth:maxWidth withInsideHorizontalSpace:4 withInsideVerticalSpace:4 withOuterHorizontalSpace:8 withOuterVerticalSpace:8];
    
    jkSmallLabels.x = 16;
    jkSmallLabels.y = 100;
    jkSmallLabels.backgroundColor = [UIColor redColor];
    jkSmallLabels.JKSmallLabelClick = ^(NSInteger tag)
    {
        NSLog(@"tag=%ld",(long)tag);
        
    };
    [self.view addSubview:jkSmallLabels];
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
