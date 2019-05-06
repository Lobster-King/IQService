# IQService
iOS端模块间通信解决方案。

## 使用方式  
**一、通过Cocoapods引入工程。**  

暂未支持，按照计划应该很快支持。  

可临时把IQService拖拽到工程中，自行打成私有库。  

**二、编写一个服务类。**

```
首先创建LoginModuleCookieService类，并将该类注册到LoginModule中。

```
```
.h声明
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LoginModuleCookieService : NSObject

- (NSString *)getCookieWithSignature:(NSString *)signature;

@end

NS_ASSUME_NONNULL_END
```

```
.m实现
#import "LoginModuleCookieService.h"

@implementation LoginModuleCookieService

- (NSString *)getCookieWithSignature:(NSString *)signature {
    return [NSString stringWithFormat:@"%@->cookie",signature];
}

@end
```

**三、调用该服务：** 

```
同步调用
NSString *cookie = [IQService invokeMicroServiceSync:@"GetCookieSyncService",@"我是同步调用",nil];
NSLog(@"%@",cookie);
```

```
异步调用
void (^callBack)(NSString *) = ^(NSString *cookie){
        NSLog(@"%@",cookie);
    };
[IQService invokeMicroService:@"GetCookieAsyncService",@"我是异步调用",callBack,nil];
```

## IQService路线图

* 支持多种注册方式，动态注册，注解方案等。目前仅支持静态注册。
* 在编译器进行参数有效性校验。

## 联系我
PRs or Issues.  
Email:[zhiwei.geek@gmail.com](mailto:zhiwei.geek@gmail.com)

