//
//  ViewController.m
//  CellInsertRowDemo
//
//  Created by huangyibiao on 16/4/13.
//  Copyright © 2016年 huangyibiao. All rights reserved.
//

#import "ViewController.h"
#import "HYBNormalCell.h"
#import "HYBInsertedCell.h"
#import "HYBNormalModel.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSMutableArray *dataSources;

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  
  UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
  [self.view addSubview:tableView];
  tableView.dataSource = self;
  tableView.delegate = self;
  
  [tableView registerClass:[HYBNormalCell class] forCellReuseIdentifier:@"HYBNormalCell"];
  [tableView registerClass:[HYBInsertedCell class] forCellReuseIdentifier:@"HYBInsertedCell"];
  for (NSUInteger i = 0; i < 20; ++i) {
    HYBNormalModel *model = [[HYBNormalModel alloc] init];
    model.isOpen = NO;
    [self.dataSources addObject:model];
  }
}

- (NSMutableArray *)dataSources {
  if (_dataSources == nil) {
    _dataSources = [[NSMutableArray alloc] init];
  }
  
  return _dataSources;
}

#pragma mark - UITableViewDataSource
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  id obj = [self.dataSources objectAtIndex:indexPath.row];
  
  if ([obj isKindOfClass:[HYBNormalModel class]]) {
    HYBNormalCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HYBNormalCell"
                                                          forIndexPath:indexPath];
    cell.model = obj;
    cell.callback = ^(BOOL insert) {
      if (insert) {// 点击时插入行
        ((HYBNormalModel *)obj).isOpen = YES;// 记得标记状态
        [self.dataSources insertObject:@(2) atIndex:indexPath.row + 1];
        NSIndexPath *insertedIndexPath = [NSIndexPath indexPathForRow:indexPath.row + 1
                                                          inSection:indexPath.section];
        [tableView insertRowsAtIndexPaths:@[insertedIndexPath]
                         withRowAnimation:UITableViewRowAnimationFade];
      } else {
        ((HYBNormalModel *)obj).isOpen = NO;// 记得标记状态
        [self.dataSources removeObjectAtIndex:indexPath.row + 1];
        NSIndexPath *deletedIndexPath = [NSIndexPath indexPathForRow:indexPath.row + 1
                                                           inSection:indexPath.section];
        [tableView deleteRowsAtIndexPaths:@[deletedIndexPath]
                         withRowAnimation:UITableViewRowAnimationFade];
      }
    };
    
    return cell;
  }
  
  HYBInsertedCell *insertedCell = [tableView dequeueReusableCellWithIdentifier:@"HYBInsertedCell"
                                                                  forIndexPath:indexPath];

  insertedCell.callback = ^() {
    // 将被插入行的按钮状态设置为关闭：
   HYBNormalModel *model = [self.dataSources objectAtIndex:indexPath.row - 1];
    model.isOpen = NO;
    // 删除插入的行
    [self.dataSources removeObjectAtIndex:indexPath.row];
    [tableView deleteRowsAtIndexPaths:@[indexPath]
                     withRowAnimation:UITableViewRowAnimationFade];
  };
  
  return insertedCell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return self.dataSources.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
  id obj = self.dataSources[indexPath.row];
  
  return [obj isKindOfClass:[HYBNormalModel class]] ? 100 : 35;
}

@end
