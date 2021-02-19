//
//  PersistentManager.h
//  MarkListDemo
//
//  Created by 胡俊峰 on 12/23/20.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface PersistentManager : NSObject

+ (void)saveNote:(NSString *)note;

+ (NSArray *)getNotes;

@end

NS_ASSUME_NONNULL_END
 
