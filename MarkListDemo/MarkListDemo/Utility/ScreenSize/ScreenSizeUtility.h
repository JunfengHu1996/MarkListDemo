//
//  ScreenSizeUtility.h
//  MarkListDemo
//
//  Created by 胡俊峰 on 12/22/20.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

#define knavigationbarAndStatusbarHeight [ScreenSizeUtility navigationbarAndStatusbarHeight]
#define kscreenWidth [ScreenSizeUtility screenWidth]
#define kscreenHeight [ScreenSizeUtility screenHeight]
#define kscreenFrame [ScreenSizeUtility screenFrame]

@interface ScreenSizeUtility : NSObject

// 导航栏+状态栏高度
+ (CGFloat)navigationbarAndStatusbarHeight;

// 屏幕宽度
+ (CGFloat)screenWidth;

// 屏幕高度
+ (CGFloat)screenHeight;

// 导航栏之下的frame
+ (CGRect)screenFrame;

@end

NS_ASSUME_NONNULL_END
