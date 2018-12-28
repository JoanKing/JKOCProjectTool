# JKOCProjectTool
OC项目的一个工具包，里面是一些常用的组件以及分类Categorys

## Requirements
This library requires `iOS 7.0+` and `Xcode 8.0+`.

## 开始

### 配置工程

#### CocoaPods 导入

   - 方式1：下载下来，把文件夹 JKOCProjectTool 拖入项目

   - 方式2：使用CocoaPods 导入

         platform :ios, '8.0'

         target 'ProjectName' do

            use_frameworks!
 
快速            pod 'JKOCProjectTool'
         end  

## 里面分为2部分：JKKit 与 JKCategory

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
      
## 版本历史
- 0.1.9

- 新增： 这次主要是加密技术的添加
	- JKCategory/JKFoundation/NSString+JKBase64 
	- JKCategory/JKFoundation/NSData+JK_AES
	- JKCategory/JKFoundation/NSString+JK_MD5
   
	- JKKit/JKRSATool   RSA加密的添加

- 优化：主要是优化有关 Base64 的代码
	- NSString+JKBase64 优化里面的内容
