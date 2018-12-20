//
//  JKSandboxPath.h
//  JKOCProjectToolDemo
//
//  Created by 王冲 on 2018/12/6.
//  Copyright © 2018年 JK科技有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

// 文件名字的枚举
/*
 typedef enum new;
 new：枚举类型的变量值列表
 C 样式的枚举默认枚举类型变量值的格式为整型
 */
typedef enum {
    home,
    Documents,
    Library,
    Caches,
    tmp,
    
}FilePath;

typedef void(^ReadImage)(UIImage *image,BOOL readImageStatus);


@interface JKSandboxPath : NSObject

#pragma mark 枚举的取值
/** 枚举的取值来创建路径*/
+(NSString *)customFilePathName:(FilePath)name customPath:(NSString *)path;

#pragma mark 1.获取各个主目录
#pragma mark 获取根目录Home
/**  获取根目录Home*/
+(NSString *)jKHomeDirectory;
#pragma mark 获取 Documents
/**  获取 Documents*/
+(NSString *)jKDocuments;
#pragma mark 获取 Cache
/**  获取 Cache*/
+(NSString *)jKCaches;
#pragma mark 获取 Library
/**  获取 Library*/
+(NSString *)jKLibrary;
#pragma mark 获取 tmp
/**  获取 tmp*/
+(NSString *)jKTmp;

#pragma mark 2.创建文件目录
/**创建文件目录 folderNmae:文件夹的名字*/
- (NSString *)jKCreateFolder:(NSString *)folderName;

#pragma mark 4.删除文件夹的路径
/**删除文件夹的路径*/
- (void)jKRemovefolder:(NSString *)filePathName;

#pragma mark 5.删除文件的路径
/** 删除文件的路径*/
- (void)jKRemovefile:(NSString *)filePathName;

#pragma mark 6.读取某个文件
/** 读取某个文件*/
- (NSData *)jKReadfile:(NSString *)filePath;

#pragma mark 7.1、深度搜索遍历一（subpathsAtPath）深度遍历，会递归遍历子文件夹（包括符号链接，所以要求性能的话用enumeratorAtPath）
/** 获取一个文件夹下面的所有文件以及文件夹路径的名字*/
// folderNmae:文件夹的名字
-(NSArray *)jKDeepSearchSubpathsAtPathAllFileNames:(NSString *)folderName;

#pragma mark 7.2、深度搜索遍历二（enumerator）深度遍历，会递归遍历子文件夹（但不会递归符号链接）
/** 获取一个文件夹下面的所有文件以及文件夹路径的名字*/
// folderNmae:文件夹的名字
-(NSArray *)jKDeepSearchEnumeratorAllFileNames:(NSString *)folderName;

#pragma mark 8.对指定路径执行浅搜索，返回指定目录路径下的文件、子目录及符号链接的列表(只寻找一层)
/**对指定路径执行浅搜索，返回指定目录路径下的文件、子目录及符号链接的列表(只寻找一层)*/
-(NSArray *)jKShallowSearchAllFiles:(NSString *)filePath;

#pragma mark 9、判断文件或文件夹是否存在
+(BOOL)jkJudgeFileOrFolderExists:(NSString *)filePathName;

#pragma mark 10、创建文件
/**folderNmae:文件的名字*/
- (NSString *)jKCreateFile:(NSString *)folderName;

#pragma mark 11、可以通过write(to:)方法，可以创建文件并将对象（文件，音频，图片，视频以及数组，字典）都可以写入文件
/** 1.代表文本、2.代表图片、3.代表数组、4.代表字典 */
-(void)jKWriteToFile:(NSString *)folderName withWriteToType:(int)type withWriteToContent:(id)content;

#pragma mark 12、复制文件
/** 复制文件 fromeFile: 被复制的文件路径  toFile: 复制后的文件路径*/
-(BOOL)jKCopyFromFilePath:(NSString *)fromPath withCopyToFilePath:(NSString *)toPath;

#pragma mark 13.移动文件
/** 移动文件 fromeFile: 被复制的文件路径  toFile: 复制后的文件路径*/
-(BOOL)jKmoveFileFromPath:(NSString *)fromPath withToPath:(NSString *)toPath;

#pragma mark 14.读出文本
/** 读出文本*/
-(NSString *)jKReadTextToFilePath:(NSString *)path;

#pragma mark 15.写入沙盒图片
/** customPath:图片存储的路径 imageStr: 网络图片的链接*/
+(void)jKwriteImageToFilePath:(NSString *)customPath withImageUrl:(NSString *)imageStr;

#pragma mark 16.读出图片(没有图片直接写入再取出，图片直接放入JKImage文件夹下面)
/** 读出图片 imageUrl: 图片的链接*/
+(void)jKReadImageWithImageUrl:(NSString *)imageUrl withReadImage:(ReadImage)readImage;

#pragma mark 17、获取文件属性（创建时间，修改时间，文件大小，文件类型等信息）
/** path:路径 获取文件属性（创建时间，修改时间，文件大小，文件类型等信息）*/
+(NSDictionary *)jKGetFileAttributesFilePath:(NSString *)path;

#pragma mark 18、计算文件夹的大小
/** 计算文件夹的大小 folderPath: 文件夹的大小*/
-(NSString *)jKCalculateTheSizeOfTheFolderPath:(NSString *)folderPath;

#pragma mark 19、沙盒路径的截取
/** 沙盒路径的截取
 
   @"/Library/Application Support/Documents/DownLoad/test/mine.zip"
 */
#pragma mark 19.1、从路径中获得完整的文件名（带后缀）

/**
 从路径中获得完整的文件名（带后缀）

 @param path 路径
 @return 返回: mine.zip
 */
+(NSString *)jk_lastPathComponentPath:(NSString *)path;

#pragma mark 19.2、返回路径z后缀之前的路径
/**
 返回路径z后缀之前的路径

 @param path 路径
 @return 返回: /Library/Application Support/Documents/DownLoad/test
 */
+(NSString *)jk_stringByDeletingLastPathComponentPath:(NSString *)path;

#pragma mark 19.3、从路径中获得完整的文件名不带'.',也就是路径的后缀
/**
 从路径中获得完整的文件名不带'.',也就是路径的后缀

 @param path 路径
 @return 返回:zip
 */
+(NSString *)jk_pathExtensionPathComponentPath:(NSString *)path;

#pragma mark 19.4、除了路径后缀之前的内容
/**
 路径”标准化

 @param path 路径
 @return 返回：/Library/Application Support/Documents/DownLoad/test/mine
 */
+(NSString *)jk_stringByDeletingPathExtensionPath:(NSString *)path;

#pragma mark 19.5、获取文件名字
/**
 获取文件名字

 @param path 路径
 @return 返回：mine
 */
+(NSString *)jk_stringPathNameExtensionPath:(NSString *)path;

@end

NS_ASSUME_NONNULL_END
