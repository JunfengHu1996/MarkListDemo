//
//  TableViewCell.m
//  MarkListDemo
//
//  Created by 胡俊峰 on 2/19/21.
//

#import "TableViewCell.h"

@interface TableViewCell ()

@property(nonatomic, strong) UILabel *contentLabel;

@end

@implementation TableViewCell

// TableViewCell初始化
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    // 设置 contentLable
    self.contentLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
    self.contentLabel.textColor = [UIColor blackColor];
    self.contentLabel.textAlignment = NSTextAlignmentCenter;
    self.contentLabel.font = [UIFont fontWithName:@"HelveticaNeue-UltraLight" size:20.0f];
    [self.contentView addSubview:self.contentLabel];
    
    return self;
}

+ (UITableViewCell *)prepareCellForTableView:(UITableView *)tableView{
    NSString *identifier = @"note";
    UITableViewCell *tableViewCell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (tableViewCell == nil) {
        tableViewCell = [[self alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    return tableViewCell;
}

- (void)setContentWithNote:(NSString *)note{
    self.contentLabel.text = note;
    self.contentLabel.numberOfLines = 0;
    // 随意设置的rect，只是展示
    CGRect rect = CGRectMake(([UIScreen mainScreen].bounds.size.width - 260)/2, 25, 260, 88);
    [self.contentLabel setFrame:rect];
}

@end
