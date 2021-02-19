//
//  PostViewController.m
//  MarkListDemo
//
//  Created by 胡俊峰 on 12/22/20.
//

#import "PostViewController.h"
#import "ScreenSizeUtility.h"
#import "PersistentManager.h"

@interface PostViewController ()

@property (nonatomic, strong) UITextView *textView;

@end

@implementation PostViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 设置TextVeiw
    self.view.backgroundColor = [UIColor whiteColor];
    self.textView = [[UITextView alloc] initWithFrame:kscreenFrame];
    [self.view addSubview:self.textView];
    
    // 设置导航栏标题
    [self setTitleWithText:@"写笔记"];
    
    // 导航栏左侧ButtonItem
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(cancel)];
    
    // 导航栏右侧ButtonItems
    UIBarButtonItem *editBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemEdit target:self action:@selector(edit)];
    UIBarButtonItem *finishBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(finish)];
    self.navigationItem.rightBarButtonItems = @[editBarButtonItem, finishBarButtonItem];
}

// 导航栏左侧按钮点击
- (void)cancel {
    [self.navigationController popViewControllerAnimated:YES];
}

// 导航栏右侧按钮编辑
- (void)edit {
    
}

// 导航栏右侧按钮点击，完成 textView 中文字内容的存储
- (void)finish {
    NSString *note = self.textView.text;
    if (note.length == 0) {
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"提示" message:@"你什么都没写呦" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *alreadyKnownAction = [UIAlertAction actionWithTitle:@"我知道了" style:UIAlertActionStyleDefault handler:nil];
        [alertController addAction:alreadyKnownAction];
        [self presentViewController:alertController animated:YES completion:nil];
        return;
    }
    
    // 持久化存储
    [PersistentManager saveNote:note];
    
}

@end
