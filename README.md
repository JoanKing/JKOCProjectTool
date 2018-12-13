# JKOCProjectTool
OC项目的一个工具包，里面是一些常用的组件以及分类Categorys


## Requirements
This library requires `iOS 7.0+` and `Xcode 8.0+`.

#### 里面分为2部分：JKKit 与 JKCategory

#### 第一部分：JKKit

      1、JKDate： 有关时间的类
      2、JKGCDTimer：GCD定时器
      3、JKTextExtension 有关文本的扩展，文本的size以及富文本的适配
      4、JKSandboxPath 沙盒路径的配置
    
#### 第二部分：JKCategory：分类的综述
    
      1、UIView+JKLayout ： 一些控件位置的设置
      2、NSMutableArray+JKMutableArray：可变数组的扩展
      3、UIColor+JKColor：颜色的扩展，目前里面只有16进制的设置
      4、UIImage+JKUIImageRedraw：图片的设置
      5、UIBarButtonItem+JKBarbuttonItem：自定义UIBarButtonItem 


使用方式：

     方式1：下载下来，把文件夹 JKOCProjectTool 拖入项目

     方式2：使用CocoaPods 导入

        platform :ios, '9.0'

        target 'JKTest' do

           use_frameworks!

           pod 'JKOCProjectTool'
        end  
