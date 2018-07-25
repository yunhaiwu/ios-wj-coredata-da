//
//  UserMO.h
//  WJCoreDataAccess-example
//
//  Created by 吴云海 on 16/9/9.
//  Copyright © 2016年 WJ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "IUser.h"

@interface UserMO : NSManagedObject<IUser>

@property (nullable, nonatomic, retain) NSString *userId;
@property (nullable, nonatomic, retain) NSNumber *age;
@property (nullable, nonatomic, retain) NSString *name;
@property (nullable, nonatomic, retain) NSDate *createTime;

@end
