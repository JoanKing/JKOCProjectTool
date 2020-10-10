//
//  JKQRCodeTestViewController.m
//  JKOCProjectToolDemo
//
//  Created by 王冲 on 2018/12/29.
//  Copyright © 2018年 JK科技有限公司. All rights reserved.
//

#import "JKQRCodeTestViewController.h"

#import "JKQRCode.h"
#import "JKScanningQRViewController.h"

/** 1、屏幕的宽高 */
#define JK_SCREEN_WIDTH  [UIScreen mainScreen].bounds.size.width
#define JK_SCREEN_HEIGHT  [UIScreen mainScreen].bounds.size.height


@interface JKQRCodeTestViewController ()


/** 识别二维码 */
@property(nonatomic,strong) UIButton *readQRCodeBtn;

/** 扫描二维码 */
@property(nonatomic,strong) UIButton *scanQRCodeBtn;

/** 二维码输入框内容 */
@property(nonatomic,strong) UITextField *textFiled;
/** 生成二维码 */
@property(nonatomic,strong) UIButton *createQRCodeBtn;

/** 二维码图片 */
@property(nonatomic,strong) UIImageView *qrCodeImageView;

/** 二维码内容 */
@property(nonatomic,strong) UILabel *qrCodeContent;


@end

@implementation JKQRCodeTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"二维码生成以及扫描的测试";
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self setUI];
    
}

-(void)setUI{
    
    
    // 1.添加识别二维码按钮
    [self.view addSubview:self.readQRCodeBtn];
    // 2.添加扫描二维码按钮
    [self.view addSubview:self.scanQRCodeBtn];
    // 3.添加输入框
    [self.view addSubview:self.textFiled];
    // 4.添加生成二维码按钮
    [self.view addSubview:self.createQRCodeBtn];
    // 5.添加二维码图片
    [self.view addSubview:self.qrCodeImageView];
    // 6.添加二维码的图片
    [self.view addSubview:self.qrCodeContent];
}

#pragma mark 生成二维码
-(void)createQRCodeBtnClick{
    
    self.qrCodeImageView.image = [JKQRCode createQRCodeWithContent:self.textFiled.text withLogoImage:[UIImage imageNamed:@"jk"] withQRCodeSize:200];
    
    
}

#pragma mark 扫描二维码
-(void)scanQRCodeBtnClick{
    
    __weak typeof(self) weakSelf = self;
    JKScanningQRViewController *vc = [[JKScanningQRViewController alloc] init];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
    nav.navigationBar.barTintColor = [UIColor brownColor];
    nav.navigationBar.tintColor = [UIColor yellowColor];
    
    vc.scanningSuccess = ^(NSString * _Nonnull QRCodeStr) {
        weakSelf.qrCodeContent.text = [NSString stringWithFormat:@"%@", QRCodeStr];
    };
    
    [self presentViewController:nav animated:YES completion:^{
        
    }];
}

#pragma mark 识别二维码
-(void)readQRCodeBtnClick{
    
    NSString *codeStr = [JKQRCode readAlbumQRCode:self.qrCodeImageView.image];
    NSLog(@"codeStr = %@", codeStr);
    
    self.qrCodeContent.text = [NSString stringWithFormat:@"%@", codeStr];
    
}

#pragma mark 二维码图片的点击放大
-(void)qrCodeImageViewClick{
    
    
    
}

-(UILabel *)qrCodeContent{
    
    if (!_qrCodeContent) {
        
        _qrCodeContent = [[UILabel alloc]initWithFrame:CGRectMake(0, 420, JK_SCREEN_WIDTH, 30)];
        _qrCodeContent.textColor = [UIColor brownColor];
        _qrCodeContent.backgroundColor = [UIColor yellowColor];
        _qrCodeContent.textAlignment = NSTextAlignmentCenter;
    }
    
    return _qrCodeContent;
}

-(UIImageView *)qrCodeImageView{
    
    if (!_qrCodeImageView) {
        
        _qrCodeImageView = [[UIImageView alloc]initWithFrame:CGRectMake(JK_SCREEN_WIDTH/2-100, 200, 200, 200)];
        _qrCodeImageView.image = [UIImage imageNamed:@"jk"];
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(qrCodeImageViewClick)];
        [_qrCodeImageView addGestureRecognizer:tap];
    }
    return _qrCodeImageView;
}

-(UIButton *)createQRCodeBtn{
    
    if (!_createQRCodeBtn) {
        
        _createQRCodeBtn = [[UIButton alloc]initWithFrame:CGRectMake(JK_SCREEN_WIDTH-20-100, 100, 100, 50)];
        [_createQRCodeBtn setTitle:@"生成二维码" forState:UIControlStateNormal];
        [_createQRCodeBtn setTitleColor:[UIColor brownColor] forState:UIControlStateNormal];
        [_createQRCodeBtn setBackgroundColor:[UIColor yellowColor]];
        [_createQRCodeBtn addTarget:self action:@selector(createQRCodeBtnClick) forControlEvents:UIControlEventTouchUpInside];
        
    }
    
    return _createQRCodeBtn;
}

-(UITextField *)textFiled{
    
    if (!_textFiled) {
        
        _textFiled = [[UITextField alloc]initWithFrame:CGRectMake(20, 100, JK_SCREEN_WIDTH-20-20-100-20, 50)];
        _textFiled.placeholder = @"请输入二维码内容";
        _textFiled.textColor = [UIColor brownColor];
        [_textFiled setBackgroundColor:[UIColor yellowColor]];
    }
    
    return _textFiled;
}

-(UIButton *)scanQRCodeBtn{
    
    if (!_scanQRCodeBtn) {
        
        _scanQRCodeBtn = [[UIButton alloc]initWithFrame:CGRectMake(JK_SCREEN_WIDTH-20-140, JK_SCREEN_HEIGHT-140, 140, 80)];
        [_scanQRCodeBtn setTitle:@"扫描二维码" forState:UIControlStateNormal];
        [_scanQRCodeBtn setTitleColor:[UIColor brownColor] forState:UIControlStateNormal];
        [_scanQRCodeBtn setBackgroundColor:[UIColor yellowColor]];
        [_scanQRCodeBtn addTarget:self action:@selector(scanQRCodeBtnClick) forControlEvents:UIControlEventTouchUpInside];
        
    }
    
    return _scanQRCodeBtn;
}

-(UIButton *)readQRCodeBtn{
    
    if (!_readQRCodeBtn) {
        
        _readQRCodeBtn = [[UIButton alloc]initWithFrame:CGRectMake(20, JK_SCREEN_HEIGHT-140, 140, 80)];
        [_readQRCodeBtn setTitle:@"识别二维码" forState:UIControlStateNormal];
        [_readQRCodeBtn setTitleColor:[UIColor brownColor] forState:UIControlStateNormal];
        [_readQRCodeBtn setBackgroundColor:[UIColor yellowColor]];
        [_readQRCodeBtn addTarget:self action:@selector(readQRCodeBtnClick) forControlEvents:UIControlEventTouchUpInside];
        
    }
    
    return _readQRCodeBtn;
}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    [self.textFiled resignFirstResponder];
}

@end
