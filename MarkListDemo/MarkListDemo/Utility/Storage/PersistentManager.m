//
//  PersistentManager.m
//  MarkListDemo
//
//  Created by 胡俊峰 on 12/23/20.
//

#import "PersistentManager.h"
#import <UIKit/UIKit.h>

@interface PersistentManager ()

@property (nonatomic, copy) NSString *path;

@end

@implementation PersistentManager

+ (NSArray *)getNotes {
    // 检查是否已经存在文件，如果不存在则创建空数组返回；如果已经存在则从路径文件中解序列化出笔记数组
    BOOL fileExist = [[NSFileManager defaultManager] fileExistsAtPath:[self path]];
    NSArray *notesArray;
    if (fileExist) {
        NSData *existedNotesData = [NSData dataWithContentsOfURL:[NSURL fileURLWithPath:[self path]]];
        notesArray = [NSKeyedUnarchiver unarchivedObjectOfClass:[NSArray class] fromData:existedNotesData error:nil];
    } else {
        notesArray = [[NSArray alloc] init];
    }
    
    return notesArray;
}

+ (void)saveNote:(NSString *)note {
    NSArray *existedNotesArray = [self getNotes]; // 先取出存储了的笔记数组
    NSMutableArray *newestArray = [NSMutableArray arrayWithObject:note]; // 以新笔记为内容创建一个可变数组
    [newestArray addObjectsFromArray:existedNotesArray]; // 将已有的笔记添加到可变数组中
    
    NSData *newNotesData = [NSKeyedArchiver archivedDataWithRootObject:newestArray requiringSecureCoding:YES error:nil];
    // 数据存储到路径
    NSError *error;
    [newNotesData writeToFile:[self path] options:NSDataWritingAtomic error:&error];
    if (error) {
        NSLog(@"存储异常");
    }
}

+ (NSString *)path {
    NSArray *dirArray = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *dirPath = [dirArray firstObject];
    NSString *filePath = [dirPath stringByAppendingPathComponent:@"notes"];
    NSLog(@"文件路径为：%@",filePath);

    return filePath;
}

@end
