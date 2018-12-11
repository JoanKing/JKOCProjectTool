//
//  NSMutableArray+JKMutableArray.m
//  JKOCProjectToolDemo
//
//  Created by 王冲 on 2018/12/3.
//  Copyright © 2018年 JK科技有限公司. All rights reserved.
//

#import "NSMutableArray+JKMutableArray.h"

@implementation NSMutableArray (JKMutableArray)

-(void)sortAscending:(BOOL)ascending withKey:(NSString *)key{
    
    NSArray *sortDescriptors =[NSArray arrayWithObject:[NSSortDescriptor sortDescriptorWithKey:key ascending:ascending]];
    [self sortUsingDescriptors:sortDescriptors];
}

@end
