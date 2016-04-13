//
//  HYBNormalCell.m
//  CellInsertRowDemo
//
//  Created by huangyibiao on 16/4/13.
//  Copyright © 2016年 huangyibiao. All rights reserved.
//

#import "HYBNormalCell.h"

@interface HYBNormalCell ()

@property (nonatomic, strong) UIButton *button;

@end

@implementation HYBNormalCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
  if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(80, 40, width - 160, 45);
    button.layer.cornerRadius = 10;
    button.backgroundColor = [UIColor redColor];
    button.layer.borderColor = [UIColor yellowColor].CGColor;
    button.layer.borderWidth = 2;
    [self.contentView addSubview:button];
    [button setTitle:@"正常显示的Cell" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(onTap:) forControlEvents:UIControlEventTouchUpInside];
    self.contentView.backgroundColor = [UIColor lightGrayColor];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.button = button;
  }
  
  return self;
}

- (void)onTap:(UIButton *)sender {
  self.model.isOpen = !self.model.isOpen;
  
  if (self.callback) {
    self.callback(self.model.isOpen);
  }
}

- (void)setModel:(HYBNormalModel *)model {
  if (_model != model) {
    _model = model;
    self.button.selected = model.isOpen;
  }
}

@end
