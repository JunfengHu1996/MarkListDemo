//
//  ListViewController.m
//  MarkListDemo
//
//  Created by 胡俊峰 on 12/21/20.
//

#import "ListViewController.h"
#import "ScreenSizeUtility.h"
#import "PostViewController.h"

static NSString * const cellIdentifier = @"cellIdentifier";

@interface ListViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation ListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 设置 VC 背景色与导航栏标题
    self.view.backgroundColor = [UIColor whiteColor];
    [self setTitleWithText:@"收藏"];
    
    // tableView初始化、添加到父view
    self.tableView = [[UITableView alloc] initWithFrame:kscreenFrame];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // 先写个默认的
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    // 先写个默认的
    UITableViewCell *tableViewCell = [self.tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (tableViewCell == nil) {
        tableViewCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    return tableViewCell;
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    PostViewController *postVC = [PostViewController new];
    [self.navigationController pushViewController:postVC animated:YES];
}

@end
