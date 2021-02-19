//
//  BaseViewController.m
//  MarkListDemo
//
//  Created by 胡俊峰 on 12/21/20.
//

#import "BaseViewController.h"

#define kBlueColor [UIColor colorWithRed:0.2 green:0.46 blue:0.72 alpha:1.0]

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 设置导航栏颜色、状态栏样式
    self.navigationController.navigationBar.barTintColor = kBlueColor;
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
}

// 所有VC通用设置导航栏标题的方法
- (void)setTitleWithText:(NSString *)text {
    // 创建一个自定义的UILable作为navigationItem的titleView
    UILabel *titleLable = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 60, 40)];
    // 颜色相关
    titleLable.textColor = [UIColor whiteColor];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor]; // 设置导航栏的barButtonItem等的文字颜色
    // 文字相关
    titleLable.textAlignment = NSTextAlignmentCenter;
    titleLable.text = text;
    titleLable.font = [UIFont boldSystemFontOfSize:18.0f];
    
    self.navigationItem.titleView = titleLable;
}

@end
