//
//  UserCell.h
//  WJCoreDataAccess-example
//
//  Created by 吴云海 on 16/9/10.
//  Copyright © 2016年 WJ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UserCellContentView.h"
#import "BaseWJTableCell.h"

@interface UserCell : BaseWJTableCell
@property(nonatomic, weak) UserCellContentView *cellContentView;
@end
