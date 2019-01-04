//
//  ViewController.m
//  JKOCProjectToolDemo
//
//  Created by 王冲 on 2018/11/11.
//  Copyright © 2018年 JK科技有限公司. All rights reserved.
//

#import "ViewController.h"
#import "TestViewController.h"
#import "RSATestViewController.h"
// 有关日期的使用
#import "DateViewController.h"
// MD5加密
#import "MD5TestViewController.h"
// 二维码生成以及扫描的测试
#import "JKQRCodeTestViewController.h"
// 根据银行卡号取银行的名字
#import "JKBankNameViewController.h"
// BundleSource 资源文件的测试
#import "JKBundleSourceViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong) UITableView *tableView;

@property(nonatomic,strong) NSMutableArray *dataArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"JKOCProjectTool";
    self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
    [self.dataArray addObjectsFromArray:@[@"最初的测试",@"RSA加密的使用",@"有关日期的使用",@"MD5加密",@"二维码生成以及扫描的测试",@"根据银行卡号取银行的名字",@"Bundle资源文件的测试"]];
    
    [self.view addSubview:self.tableView];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.dataArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellID"];
    
    if (!cell) {
        
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellID"];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"%ld、 %@",indexPath.row,self.dataArray[indexPath.row]];
    cell.backgroundColor = JKRandomColor;
    
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 80;
}

-(UITableView *)tableView{
    
    if (!_tableView) {
        
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 44+JKstatusBarHeight, JK_SCREEN_WIDTH, JK_SCREEN_HEIGHT-44-JKstatusBarHeight) style:UITableViewStylePlain];
        _tableView.backgroundColor = [UIColor whiteColor];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        if (@available(iOS 11.0, *)) {
            
            _tableView.estimatedRowHeight = 0;
            _tableView.estimatedSectionFooterHeight = 0;
            _tableView.estimatedSectionHeaderHeight = 0;
            _tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
            
        } else {
            // 小于11.0的不做操作
            self.automaticallyAdjustsScrollViewInsets = NO;
        }
    }
    
    return _tableView;
}

-(NSMutableArray *)dataArray{
    
    if (!_dataArray) {
        _dataArray = [[NSMutableArray alloc]init];
    }
    
    return _dataArray;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSString *cell_name = [NSString stringWithFormat:@"%@",self.dataArray[indexPath.row]];
    if ([cell_name isEqualToString:@"最初的测试"]) {
        
        TestViewController *testViewController = [TestViewController new];
        [self.navigationController pushViewController:testViewController animated:YES];
        
    }else if ([cell_name isEqualToString:@"RSA加密的使用"]){
        
        RSATestViewController *rsaTestViewController = [RSATestViewController new];
        [self.navigationController pushViewController:rsaTestViewController animated:YES];
    }else if ([cell_name isEqualToString:@"有关日期的使用"])
    {
        
        DateViewController *dateViewController = [DateViewController new];
        [self.navigationController pushViewController:dateViewController animated:YES];
    }else if([cell_name isEqualToString:@"MD5加密"]){
        
        MD5TestViewController *md5TestViewController = [MD5TestViewController new];
        [self.navigationController pushViewController:md5TestViewController animated:YES];
    }else if ([cell_name isEqualToString:@"二维码生成以及扫描的测试"]){
        
        JKQRCodeTestViewController *md5TestViewController = [JKQRCodeTestViewController new];
        [self.navigationController pushViewController:md5TestViewController animated:YES];
    }else if ([cell_name isEqualToString:@"根据银行卡号取银行的名字"]){
        
        JKBankNameViewController *jkBankNameViewController = [JKBankNameViewController new];
        [self.navigationController pushViewController:jkBankNameViewController animated:YES];
    }else if ([cell_name isEqualToString: @"Bundle资源文件的测试"]){
        
        JKBundleSourceViewController *jkBundleSourceViewController = [JKBundleSourceViewController new];
        [self.navigationController pushViewController:jkBundleSourceViewController animated:YES];
    }
    
   
}

@end

