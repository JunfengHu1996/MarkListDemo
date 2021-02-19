//
//  ScreenSizeUtility.m
//  MarkListDemo
//
//  Created by 胡俊峰 on 12/22/20.
//

#import "ScreenSizeUtility.h"
@implementation ScreenSizeUtility

// 导航栏、状态栏高度
+ (CGFloat)navigationbarAndStatusbarHeight {
    return 44 + [self getStatusBarHight];
}

+ (CGFloat)getStatusBarHight {
   float statusBarHeight = 0;
   if (@available(iOS 13.0, *)) {
       UIStatusBarManager *statusBarManager = [UIApplication sharedApplication].windows.firstObject.windowScene.statusBarManager;
       statusBarHeight = statusBarManager.statusBarFrame.size.height;
   }
   else {
       statusBarHeight = [UIApplication sharedApplication].statusBarFrame.size.height;
   }
   return statusBarHeight;
}

// 屏幕宽度
+ (CGFloat)screenWidth {
    return [UIScreen mainScreen].bounds.size.width;
}

// 屏幕高度
+ (CGFloat)screenHeight {
    return [UIScreen mainScreen].bounds.size.height;
}

+ (CGRect)screenFrame {
    return CGRectMake(0, knavigationbarAndStatusbarHeight, kscreenWidth, kscreenHeight - knavigationbarAndStatusbarHeight);
}

@end
