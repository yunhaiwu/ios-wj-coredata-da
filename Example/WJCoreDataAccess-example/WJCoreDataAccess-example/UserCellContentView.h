//
//  UserCellContentView.h
//  WJCoreDataAccess-example
//
//  Created by 吴云海 on 16/9/10.
//  Copyright © 2016年 WJ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseWJView.h"
#import "IUser.h"

@interface UserCellContentView : BaseWJView

-(void)setUser:(id<IUser>)user;

@end
