//
//  HYBInsertedCell.m
//  CellInsertRowDemo
//
//  Created by huangyibiao on 16/4/13.
//  Copyright © 2016年 huangyibiao. All rights reserved.
//

#import "HYBInsertedCell.h"

@implementation HYBInsertedCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
  if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(width - 140, 0, 120, 35);
    button.layer.cornerRadius = 10;
    button.backgroundColor = [UIColor greenColor];
    button.layer.borderColor = [UIColor redColor].CGColor;
    button.layer.borderWidth = 1;
    [self.contentView addSubview:button];
    [button setTitle:@"临时插入的Cell" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(onTap:) forControlEvents:UIControlEventTouchUpInside];
    self.contentView.backgroundColor = [UIColor purpleColor];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
  }
  
  return self;
}

- (void)onTap:(UIButton *)sender {
  if (self.callback) {
    self.callback();
  }
}

@end
