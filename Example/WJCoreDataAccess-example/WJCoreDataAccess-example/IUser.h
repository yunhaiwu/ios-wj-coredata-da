//
//  IUser.h
//  WJCoreDataAccess-example
//
//  Created by 吴云海 on 16/9/10.
//  Copyright © 2016年 WJ. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol IUser <NSObject>

-(NSString*)userId;

-(NSNumber*)age;

-(NSString*)name;

-(NSDate*)createTime;

@end
