//
//  IQService.h
//  IQService
//
//  Created by lobster on 2019/4/28.
//  Copyright © 2019 lobster. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface IQService : NSObject

+ (void)registerMicroServices;

/**
 同步、异步调用

 @param sevice 微服务名
 */
+ (void)invokeMicroService:(NSString *)sevice,...;

/**
 同步调用

 @param service 微服务名
 @return 同步调用返回值
 */
+ (id)invokeMicroServiceSync:(NSString *)service,...;

@end
