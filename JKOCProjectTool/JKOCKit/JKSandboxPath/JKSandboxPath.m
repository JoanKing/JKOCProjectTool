//
//  JKSandboxPath.m
//  JKOCProjectToolDemo
//
//  Created by 王冲 on 2018/12/6.
//  Copyright © 2018年 JK科技有限公司. All rights reserved.
//

/*
 - 1、Home目录(应用程序包)
 - 整个应用程序各文档所在的目录,包含了所有的资源文件和可执行文件
 - 2、Documents
 - 保存应用运行时生成的需要持久化的数据，iTunes同步设备时会备份该目录
 - 需要保存由"应用程序本身"产生的文件或者数据，例如: 游戏进度，涂鸦软件的绘图
 - 目录中的文件会被自动保存在 iCloud
 - 注意: 不要保存从网络上下载的文件，否则会无法上架!
 3、tmp
 - 保存应用运行时所需要的临时数据或文件，"后续不需要使用"，使用完毕后再将相应的文件从该目录删除。
 - 应用没有运行，系统也可能会清除该目录下的文件
 - iTunes不会同步备份该目录
 - 重新启动手机, tmp 目录会被清空
 - 系统磁盘空间不足时，系统也会自动清理
 4、Library/Cache：保存应用运行时生成的需要持久化的数据，iTunes同步设备时不备份该目录。一般存放体积大、不需要备份的非重要数据
 - 保存临时文件,"后续需要使用"，例如: 缓存的图片，离线数据（地图数据）
 - 系统不会清理 cache 目录中的文件
 - 就要求程序开发时, "必须提供 cache 目录的清理解决方案"
 5、Library/Preference：保存应用的所有偏好设置，IOS的Settings应用会在该目录中查找应用的设置信息。iTunes
 - 用户偏好，使用 NSUserDefault 直接读写！
 - 如果想要数据及时写入硬盘，还需要调用一个同步方法 synchronize()
 UserDefaults是一种存轻量级的数据
 //取值
 #define UserDefaultObject(A) [[NSUserDefaults standardUserDefaults]objectForKey:A]
 //存值(可变的值不可以存)
 #define UserDefaultSetValue(B,C) [[NSUserDefaults standardUserDefaults]setObject:B forKey:C]
 //存BOOL值
 #define UserDefaultBool(D,E)  [[NSUserDefaults standardUserDefaults]setBool:D forKey:E]
 #define  Synchronize          [[NSUserDefaults standardUserDefaults]synchronize]
 */
#import "JKSandboxPath.h"
@implementation JKSandboxPath

+(NSString *)customFilePathName:(FilePath)name customPath:(NSString *)path{
    switch (name) {
        case 0:
            return [NSString stringWithFormat:@"/%@",path];
            break;
        case 1:
            return [NSString stringWithFormat:@"/Documents/%@",path];
            break;
        case 2:
            return [NSString stringWithFormat:@"/Library/%@",path];
            break;
        case 3:
            return [NSString stringWithFormat:@"/Library/Caches/%@",path];
            break;
        case 4:
            return [NSString stringWithFormat:@"/tmp/%@",path];
            break;
        default:
            break;
    }
    return nil;
}

#pragma mark 获取根目录Home
+(NSString *)jKHomeDirectory{
    
    NSString *filePath = NSHomeDirectory();
    return filePath;
}

#pragma mark 获取 Documents
+(NSString *)jKDocuments{
    /** 方法一
     NSString * documentsPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
     */
    
    // 方法二
    NSString *documentsPath= [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
    return documentsPath;
}

#pragma mark 获取 Caches
+(NSString *)jKCaches{
    /** 方法一
     NSString *cachesPath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) objectAtIndex:0];
     */
    // 方法二
    NSString *cachesPath= [NSHomeDirectory() stringByAppendingPathComponent:@"/Library/Caches"];
    return cachesPath;
}

#pragma mark 获取 Library
+(NSString *)jKLibrary{
    /** 方法一
     NSString *libraryPath = [NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES) objectAtIndex:0];
     */
    //  方法二
    NSString *libraryPath= [NSHomeDirectory() stringByAppendingPathComponent:@"/Library"];
    return libraryPath;
}

#pragma mark 获取 tmp
+(NSString *)jKTmp{
    /** 方法一
     NSString *tempPath = NSTemporaryDirectory();
     */
    //  方法二
    NSString *tempPath= [NSHomeDirectory() stringByAppendingPathComponent:@"/tmp"];
    return tempPath;
}

#pragma mark 使用 NSHomeDirectory() 创建文件目录
/**folderNmae:文件夹的名字*/
- (NSString *)jKCreateFolder:(NSString *)folderName{
    
    // NSHomeDirectory()：应用程序目录， Caches、Library、Documents目录文件夹下创建文件夹(蓝色的)
    // @"Documents/JKPdf"
    NSString *filePath = [NSString stringWithFormat:@"%@",folderName];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    BOOL isDir = NO;
    // fileExistsAtPath 判断一个文件或目录是否有效，isDirectory判断是否一个目录
    BOOL existed = [fileManager fileExistsAtPath:filePath isDirectory:&isDir];
    
    if ( !(isDir == YES && existed == YES) ) {
        
        // 不存在的路径才会创建
        [fileManager createDirectoryAtPath:filePath withIntermediateDirectories:YES attributes:nil error:nil];
    }
    return filePath;
}

#pragma mark 删除文件夹
- (void)jKRemovefolder:(NSString *)filePathName {
    // filePath: 文件/目录的路径
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *filePath = [NSString stringWithFormat:@"%@",filePathName];
    BOOL isDir = NO;
    // fileExistsAtPath 判断一个文件或目录是否有效，isDirectory判断是否一个目录
    BOOL existed = [fileManager fileExistsAtPath:filePath isDirectory:&isDir];
    
    if ( !(isDir == YES && existed == YES) ) {
        
        // 不存在的路径才会创建
        return;
    }
    //文件夹
    [fileManager removeItemAtPath:filePath error:nil];
}

#pragma mark 删除文件
- (void)jKRemovefile:(NSString *)filePathName {
    // filePath: 文件/目录的路径
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *filePath = [NSString stringWithFormat:@"%@",filePathName];
    //移除文件
    [fileManager removeItemAtPath:filePath error:nil];
}

#pragma mark 读取某个文件
- (NSData *)jKReadfile:(NSString *)filePath { // filePath: 文件/目录的路径
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    // 读取某个文件
    NSData *data = [fileManager contentsAtPath:filePath];
    return data;
}

#pragma mark 深度搜索遍历一（subpathsAtPath）深度遍历，会递归遍历子文件夹（包括符号链接，所以要求性能的话用enumeratorAtPath）
/**
 folderNmae:深度搜索遍历一（subpathsAtPath）深度遍历，会递归遍历子文件夹（包括符号链接，所以要求性能的话用enumeratorAtPath）
 */
-(NSArray *)jKDeepSearchSubpathsAtPathAllFileNames:(NSString *)folderName
{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    // 取得一个目录下得所有文件名
    NSArray *files = [fileManager subpathsAtPath:[self jKCreateFolder:folderName]];
    // NSLog(@"pdf名字的数量=%ld 数组=%@",files.count,files);
    
    return files;
}

/** 深度搜索遍历二（enumerator）深度遍历，会递归遍历子文件夹（但不会递归符号链接）*/
// folderNmae:文件夹的名字
-(NSArray *)jKDeepSearchEnumeratorAllFileNames:(NSString *)folderName{
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    // 取得一个目录下得所有文件名
    NSDirectoryEnumerator *files = [fileManager enumeratorAtPath:[self jKCreateFolder:folderName]];
    // NSLog(@"pdf名字的数量=%ld 数组=%@",files.count,files);
    return files.allObjects;
}

#pragma mark 8、对指定路径执行浅搜索，返回指定目录路径下的文件、子目录及符号链接的列表(只寻找一层)
/**对指定路径执行浅搜索，返回指定目录路径下的文件、子目录及符号链接的列表(只寻找一层)*/
-(NSArray *)jKShallowSearchAllFiles:(NSString *)filePath{
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSArray *contentsOfPathArray = [fileManager contentsOfDirectoryAtPath:filePath error:nil];
    return contentsOfPathArray;
}

#pragma mark 9、判断文件或文件夹是否存在
+(BOOL)jkJudgeFileOrFolderExists:(NSString *)filePathName{
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *filePath = [NSString stringWithFormat:@"%@",filePathName];
    BOOL isDir = NO;
    // fileExistsAtPath 判断一个文件或目录是否有效，isDirectory判断是否一个目录
    BOOL existed = [fileManager fileExistsAtPath:filePath isDirectory:&isDir];
    
    if ( !(isDir == YES && existed == YES) ) {
        
        // 不存在的路径才会创建
        return NO;
    }else{
        
        return YES;
    }
    return nil;
}

#pragma mark 创建文件
/**folderNmae:文件的名字*/
- (NSString *)jKCreateFile:(NSString *)folderName{
    
    NSString *filePath = [NSString stringWithFormat:@"%@",folderName];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    BOOL isDir = NO;
    // fileExistsAtPath 判断一个文件或目录是否有效，isDirectory判断是否一个目录
    BOOL existed = [fileManager fileExistsAtPath:filePath isDirectory:&isDir];
    
    if ( !(isDir == YES && existed == YES) ) {
        
        // 不存在的路径才会创建
        [fileManager createFileAtPath:filePath contents:nil attributes:nil];
    }
    return filePath;
}

#pragma mark 可以通过write(to:)方法，可以创建文件并将对象（文件，音频，图片，视频以及数组，字典）都可以写入文件

/********************下面是使用说明*********************************/
/*  字符串 1
 NSString *customPath = [NSString stringWithFormat:@"%@%@",[JKFilePathOperationExtension jKDocuments],@"/我的笔记.text"];
 NSString *content = @"456"
 */

/*  图片 2
 
 // 图片的名字
 NSString *imageString = @"testimage.png";
 UIImage *image = [UIImage imageNamed:imageString];
 NSData *data = UIImagePNGRepresentation(image);
 // 图片的存储文件夹
 NSString *customPath = [NSString stringWithFormat:@"%@%@",[JKFilePathOperationExtension jKDocuments],@"/JKImage"];
 NSString *imagePath = [[JKFilePathOperationExtension new]jKCreateFolder:customPath];
 // 图片的存储路径
 imagePath = [NSString stringWithFormat:@"%@/%@",imagePath,imageString];
 */

/* 数组 3
 // 先有数组的文件
 NSString *customPath = [NSString stringWithFormat:@"%@%@",[JKFilePathOperationExtension jKDocuments],@"/array.plist"];
 NSString *arrayPath = [[JKFilePathOperationExtension new]jKCreateFile:customPath];
 // 创建数组
 NSArray  *array = @[@"1",@"2",@"3"];
 */

/* 字典 4
 // 先有字典的文件
 NSString *customPath = [NSString stringWithFormat:@"%@%@",[JKFilePathOperationExtension jKDocuments],@"/dictionary.plist"];
 NSString *dictPath = [[JKFilePathOperationExtension new]jKCreateFile:customPath];
 // 创建字典
 NSDictionary *dict = @{@"1":@"9",@"2":@"8",@"3":@"7",@"4":@"6"};
 */

//[[JKFilePathOperationExtension new]jKWriteToFile:nil withWriteToType:2 withWriteToContent:nil];

/** 1.代表文本、2.代表图片、3.代表数组、4.代表字典 */
-(void)jKWriteToFile:(NSString *)folderName withWriteToType:(int)type withWriteToContent:(id)content{
    
    NSString *filePath = [NSString stringWithFormat:@"%@",folderName];
    /** 1.代表文本、2.代表图片、代表数组、代表字典 */
    switch (type) {
        case 1:
            
            [content writeToFile:filePath atomically:YES encoding:NSUTF8StringEncoding error:nil];
            break;
        case 2:
            
            [content writeToFile:filePath atomically:YES];
            
            break;
        default:
            break;
    }
}

#pragma mark 12、复制文件
/** 复制文件 fromeFile: 被复制的文件路径  toFile: 复制后的文件路径*/
-(BOOL)jKCopyFromFilePath:(NSString *)fromPath withCopyToFilePath:(NSString *)toPath{
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    BOOL isCopySuccess = [fileManager copyItemAtPath:fromPath toPath:toPath error:nil];
    return isCopySuccess;
}

#pragma mark 13.移动文件
/** 移动文件 fromeFile: 被复制的文件路径  toFile: 复制后的文件路径*/
-(BOOL)jKmoveFileFromPath:(NSString *)fromPath withToPath:(NSString *)toPath{
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    BOOL isMoveSuccess = [fileManager moveItemAtPath:fromPath toPath:toPath error:nil];
    return isMoveSuccess;
}

#pragma mark 14.读出文本
/** 读出文本*/
-(NSString *)jKReadTextToFilePath:(NSString *)path{
    
    NSString *textString = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    return textString;
}

#pragma mark 15.写入沙盒图片
/** customPath:图片存储的路径 imageStr: 网络图片的链接*/
+(void)jKwriteImageToFilePath:(NSString *)customPath withImageUrl:(NSString *)imageStr{
    
    NSString *catchsImageStr = [imageStr lastPathComponent];
    NSString *path = [NSString stringWithFormat:@"%@/%@",customPath,catchsImageStr];
    
    NSData *data = [NSData dataWithContentsOfURL:[NSURL  URLWithString:imageStr]];
    //转换为图片保存到以上的沙盒路径中
    UIImage * currentImage = [UIImage imageWithData:data];
    //其中参数0.5表示压缩比例，1表示不压缩，数值越小压缩比例越大
    [UIImageJPEGRepresentation(currentImage, 0.5) writeToFile:path  atomically:YES];
}

#pragma mark 16.读出图片(没有图片直接写入再取出，图片直接放入JKImage文件夹下面)
/** 读出图片 imageUrl: 图片的链接*/
+(void)jKReadImageWithImageUrl:(NSString *)imageUrl withReadImage:(ReadImage)readImage{
    
    NSString *catchsImageStr = [imageUrl lastPathComponent];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *filePath = [NSString stringWithFormat:@"%@/Library/Caches/JKImage/%@",NSHomeDirectory(),catchsImageStr];
    
    // fileExistsAtPath 判断一个文件或目录是否有效
    BOOL existed = [fileManager fileExistsAtPath:filePath];
    
    if ( !(existed == YES) ) {
        
        NSString *folderPath = [NSString stringWithFormat:@"%@/Library/Caches/JKImage",NSHomeDirectory()];
        BOOL isDir = NO;
        // fileExistsAtPath 判断一个文件或目录是否有效，isDirectory判断是否一个目录
        BOOL existedFolder = [fileManager fileExistsAtPath:folderPath isDirectory:&isDir];
        if ( !(isDir == YES && existedFolder == YES) ) {
            
            // 不存在的路径才会创建
            [fileManager createDirectoryAtPath:folderPath withIntermediateDirectories:YES attributes:nil error:nil];
        }
        
        // 文件夹存在就把图片缓存进去
        // 图片不存在
        NSData *data = [NSData dataWithContentsOfURL:[NSURL  URLWithString:imageUrl]];
        //转换为图片保存到以上的沙盒路径中
        UIImage * currentImage = [UIImage imageWithData:data];
        //其中参数0.5表示压缩比例，1表示不压缩，数值越小压缩比例越大
        [UIImageJPEGRepresentation(currentImage, 0.5) writeToFile:[NSString stringWithFormat:@"%@/%@",folderPath,catchsImageStr] atomically:YES];
        readImage(currentImage,YES);
        
    }else{
        
        NSData *data = [NSData dataWithContentsOfFile:filePath];
        UIImage *image = [UIImage imageWithData:data];
        readImage(image,YES);
    }
    
}

#pragma mark 17、获取文件属性（创建时间，修改时间，文件大小，文件类型等信息）
/** path: 文件的路径 获取文件属性（创建时间，修改时间，文件大小，文件类型等信息）*/
+(NSDictionary *)jKGetFileAttributesFilePath:(NSString *)path{
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSDictionary *fileAttributes = [fileManager attributesOfItemAtPath:path error:nil];
    
    return fileAttributes;
}

#pragma mark 18、计算文件夹的大小
/** 计算文件夹的大小 folderPath: 文件夹的大小*/
-(NSString *)jKCalculateTheSizeOfTheFolderPath:(NSString *)folderPath{
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    BOOL isExist = [fileManager fileExistsAtPath:folderPath];
    if (isExist) {
        
        unsigned long long folderSize = 0;
        
        NSArray *childerFiles=[fileManager subpathsAtPath:folderPath];
        
        
        if (childerFiles.count != 0) {
            
            for (NSString *fileName in childerFiles) {
                
                NSString *fileAbsolutePath=[folderPath stringByAppendingPathComponent:fileName];
                folderSize +=[self jKCalculateTheSizeOfTheFilePath:fileAbsolutePath];
            }
            
        }else{
            
            folderSize = [self jKCalculateTheSizeOfTheFilePath:folderPath];
        }
        
        NSString *sizeString;
        
        if (folderSize >= 1024.0 * 1024.0) {
            
            sizeString = [NSString stringWithFormat:@"%.2fMB",folderSize / (1024.0 * 1024.0)];
        }else if (folderSize >= 1024.0){
            
            sizeString = [NSString stringWithFormat:@"%.fkb",folderSize / (1024.0)];
        }else{
            
            sizeString = [NSString stringWithFormat:@"%llub",folderSize];
        }
        
        // unsigned long long
        return sizeString;
        
    } else {
        
        // NSLog(@"file is not exist");
        return @"0MB";
    }
}

#pragma mark 19、计算文件的大小
/** 计算文件的大小*/
-(unsigned long long)jKCalculateTheSizeOfTheFilePath:(NSString *)filePath{
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    BOOL isExist = [fileManager fileExistsAtPath:filePath];
    if (isExist) {
        unsigned long long fileSize = [[fileManager attributesOfItemAtPath:filePath error:nil] fileSize];
        return fileSize;
    } else {
        // NSLog(@"file is not exist");
        return 0;
    }
}

@end
