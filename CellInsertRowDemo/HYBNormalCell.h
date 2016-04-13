//
//  HYBNormalCell.h
//  CellInsertRowDemo
//
//  Created by huangyibiao on 16/4/13.
//  Copyright © 2016年 huangyibiao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HYBNormalModel.h"

typedef void(^HYBNormalCallback)(BOOL show);

@interface HYBNormalCell : UITableViewCell

@property (nonatomic, strong) HYBNormalModel *model;

@property (nonatomic, copy) HYBNormalCallback callback;


@end
