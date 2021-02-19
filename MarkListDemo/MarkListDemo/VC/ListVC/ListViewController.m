//
//  ListViewController.m
//  MarkListDemo
//
//  Created by 胡俊峰 on 12/21/20.
//

#import "ListViewController.h"
#import "ScreenSizeUtility.h"
#import "PostViewController.h"
#import "PersistentManager.h"

static NSString * const cellIdentifier = @"cellIdentifier";

@interface ListViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, copy) NSArray *dataArray;

@end

@implementation ListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 设置 VC 背景色与导航栏标题
    self.view.backgroundColor = [UIColor whiteColor];
    [self setTitleWithText:@"收藏"];
    
    // 设置导航栏添加笔记按钮
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addNote)];
    
    // tableView初始化、添加到父view
    self.tableView = [[UITableView alloc] initWithFrame:kscreenFrame];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    self.dataArray = [PersistentManager getNotes];
    // 每一次页面ListView出现的时候都获取笔记数据，刷新tableViw
    [self.tableView reloadData];
}

#pragma mark - private
-(void)addNote {
    PostViewController *postVC = [PostViewController new];
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:postVC];
    navController.modalPresentationStyle = UIModalPresentationFullScreen; // 设置为FullScreen，完成笔记后PostVC消失后，才会触发ListView的ViewDidAppear
    [self presentViewController:navController animated:YES completion:nil];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // 先写个默认的
    return [self.dataArray count];
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
