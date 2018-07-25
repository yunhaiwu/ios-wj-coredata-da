# WJCoreDataDA

 CoreData-DataAccess,CoreData API 封装，支持多线程并发
 

### CocoaPods 安装
    pod WJCoreDataDA

### 要求
* ARC支持
* iOS 5.0+

### 依赖Frameworks
	Foundation.framework
	UIKit.framework
	CoreData.framework
	
### 依赖CocoaPods（dependency）
	WJCommon/Core
	WJCommon/Utils
	WJLoggingAPI

### 使用方法

下面列出比较常用的使用方法（如果深究，请看源码）

```objective-c
    
	@interface UserMO : NSManagedObject
	@property (nullable, nonatomic, retain) NSString *nick;
	@property (nonatomic) int16_t age;
	@property (nonatomic) int64_t uid;
	@end

	@implementation UserMO
	@dynamic nick;
	@dynamic age;
	@dynamic uid;
	@end

	//添加
	UserMO *user = [UserMO create];
	
	//删除
	[user delete];//删除 user
	[UserMO deleteAll];//删除所有用户
	
	//保存
	[user save];
	
	//查询所有User
	NSArray *users = [UserMO all];
	
	//根据条件查询
	NSArray *users = [UserMO where:@"uid > 1000"];
	
	//User记录数量
	NSUInteger count = [UserMO count];
	NSUInteger count = [UserMO countWhere:@"uid > 1000"];
		
		
	//多线程并发（异步线程）
	NSManagedObjectContext *context = [NSManagedObjectContext defaultContext];
	UserMO *user = [UserMO createInContext:context];
	[user save];	
		
```

### 注意事项
在主线程中可以不用传入NSManagedObjectContext，但是在异步线程中必须先声明一个NSManagedObjectContext，要不然无法保存或者出错

原因：因为每个异步线程都会创建一个NSManagedObjectContext，并与主线程同步数据，如果不先声明，这个对象可能被内存回收，等保存时就会出错，而主线程中的NSManagedObjectContext，在程序使用时就已经创建，生命周期会一直保持

例如

```objective-c
	dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
		//一定要先声明定义
        NSManagedObjectContext *context = [NSManagedObjectContext defaultContext];
        UserMO *user = [UserMO createInContext:context];
        [user save];
    });

```
