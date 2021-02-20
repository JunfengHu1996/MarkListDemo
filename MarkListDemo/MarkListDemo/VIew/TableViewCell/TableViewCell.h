//
//  TableViewCell.h
//  MarkListDemo
//
//  Created by 胡俊峰 on 2/19/21.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TableViewCell : UITableViewCell

// 为tableView复用cell
+ (TableViewCell *)prepareCellForTableView:(UITableView *)tableView;

// 为cell设置内容
- (void)setContentWithNote:(NSString *)note;

@end

NS_ASSUME_NONNULL_END
