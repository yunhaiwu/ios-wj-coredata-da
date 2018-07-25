//
//  UserCellContentView.m
//  WJCoreDataAccess-example
//
//  Created by 吴云海 on 16/9/10.
//  Copyright © 2016年 WJ. All rights reserved.
//

#import "UserCellContentView.h"
#import "Masonry.h"

@interface UserCellContentView ()
@property(nonatomic, weak) IBOutlet UILabel *refLabName;
@property(nonatomic, weak) IBOutlet UILabel *refLabAge;
@property(nonatomic, weak) IBOutlet UILabel *refLabUserId;
@property(nonatomic, weak) IBOutlet UILabel *refLabCreateTime;

@end

@implementation UserCellContentView

-(void)setUser:(id<IUser>)user {
    [self.refLabName setText:[user name]];
    [self.refLabAge setText:[NSString stringWithFormat:@"%@",[user age]]];
    [self.refLabUserId setText:[user userId]];
    [self.refLabCreateTime setText:[NSString stringWithFormat:@"%@",[user createTime]]];
}

@end
