//
//  HYBInsertedCell.h
//  CellInsertRowDemo
//
//  Created by huangyibiao on 16/4/13.
//  Copyright © 2016年 huangyibiao. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef void(^HYBInsertedCallback)();

@interface HYBInsertedCell : UITableViewCell

@property (nonatomic, copy) HYBInsertedCallback callback;

@end
