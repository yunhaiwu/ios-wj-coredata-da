//
//  UserCell.m
//  WJCoreDataAccess-example
//
//  Created by 吴云海 on 16/9/10.
//  Copyright © 2016年 WJ. All rights reserved.
//

#import "UserCell.h"
#import "Masonry.h"

@interface UserCell ()

@end

@implementation UserCell

-(void)wj_loadSubViews {
    [super wj_loadSubViews];
    if (!_cellContentView) {
        UserCellContentView *v = [UserCellContentView wj_instance];
        [self.contentView addSubview:v];
        [v mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.contentView).with.insets(UIEdgeInsetsMake(0, 0, 0, 0));
        }];
        _cellContentView = v;
    }
}

@end
