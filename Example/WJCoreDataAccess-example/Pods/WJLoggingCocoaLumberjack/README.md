# WJLoggingCocoaLumberjack

WJLoggingAPI实现，对CocoaLumberjack封装

### CocoaPods 安装
    pod WJLoggingCocoaLumberjack
    
### 要求
* ARC支持
* iOS 5.0+

### 使用方法

使用前请确认 WJLogger 文件中 ddLogLevel 参数定义是否正确，定义日志级别。上层依赖日志调用依赖于WJLoggingAPI

配置CocoaLumberjack

```objective-c
	1、程序启动处添加配置
	-(BOOL)application:application didFinishLaunchingWithOptions:launchOptions
	
	/**
	 * 添加Xcode控制台日志记录器
	 */
   [DDLog addLogger:[DDTTYLogger sharedInstance] withLevel:DDLogLevelAll];
   /**
	 * 添加苹果后台日志记录器
	 */
   [DDLog addLogger:[DDASLLogger sharedInstance] withLevel:DDLogLevelAll];
   /**
	 * 让控制台日志支持颜色显示（需先安装XcodeColors插件，并配置）
	 */
   [[DDTTYLogger sharedInstance] setColorsEnabled:YES];
	
	
	2、根据需求修改WJLogger.h文件中的全局日志级别,下面是默认配置，可根据自己需求修改
	
	#ifdef DEBUG
		static const DDLogLevel ddLogLevel = DDLogLevelAll;
	#else
		static const DDLogLevel ddLogLevel = DDLogLevelError;
	#endif
```

配置XcodeColor插件
	
	1、先安装插件XcodeColor
	2、工程中 "Edit Scheme" -> "Run" -> "Arguments" -> "Environment Variables"
		添加key：XcodeColors  value:YES