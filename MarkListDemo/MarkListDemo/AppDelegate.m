//
//  AppDelegate.m
//  MarkListDemo
//
//  Created by 胡俊峰 on 12/13/20.
//

#import "AppDelegate.h"
#import "ListViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    ListViewController *listVC = [[ListViewController alloc] init];
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:listVC];
    self.window.rootViewController = navController;
    
    [self.window makeKeyAndVisible];
    return YES;
}

@end
