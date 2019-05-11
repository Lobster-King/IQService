//
//  IQService.m
//  IQService
//
//  Created by lobster on 2019/4/28.
//  Copyright © 2019 lobster. All rights reserved.
//

#import "IQService.h"
#import <objc/runtime.h>
#import <objc/message.h>

static NSString *kIQService     = @"IQService";
static NSString *kIQServiceKey  = @"IQServiceKey";

@interface IQService ()

@property (nonatomic, strong) NSMutableDictionary *microServiceMap;/*service map*/
@property (nonatomic, strong) dispatch_semaphore_t semaphore;/*lock*/

@end

@implementation IQService

+ (instancetype)sharedService {
    static id service = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        service = [[self alloc]init];
    });
    return service;
}

+ (void)invokeMicroService:(NSString *)service,... {
    va_list arguments;
    va_start(arguments, service);
    [[IQService sharedService] invokeService:service withArgs:arguments];
    va_end(arguments);
}

+ (id)invokeMicroServiceSync:(NSString *)service,... {
    va_list arguments;
    va_start(arguments, service);
    return [[IQService sharedService] invokeService:service withArgs:arguments];
    va_end(arguments);
}

- (id)invokeService:(NSString *)service withArgs:(va_list)arguments {
    NSMutableArray *argsArray = [NSMutableArray array];
    id param = nil;
    while ((param = va_arg(arguments, id))) {
        [argsArray addObject:param];
    }
    
    NSString *serviceClss = self.microServiceMap[service];
    
    if (!serviceClss.length) {
        return nil;
    }
    
    Class serviceCls = NSClassFromString(serviceClss);
    id instance = [[serviceCls alloc]init];
    unsigned int count;
    Method *methods = class_copyMethodList(serviceCls, &count);
    Method oneMethod = methods[0];
    SEL selector = method_getName(oneMethod);
    
    NSMethodSignature *mSignature = [instance methodSignatureForSelector:selector];
    NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:mSignature];
    invocation.selector = selector;
    __autoreleasing id returnValue = nil;
    NSInteger index = 2;
    for (id arg in argsArray) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wincompatible-pointer-types-discards-qualifiers"
        [invocation setArgument:&arg atIndex:index];
#pragma clang diagnostic pop
        index++;
    }
    [invocation invokeWithTarget:instance];
    if (mSignature.methodReturnLength) {
        [invocation getReturnValue:&returnValue];
    }
    return returnValue;
}

+ (void)registerMicroServices {
    dispatch_semaphore_wait([IQService sharedService].semaphore, DISPATCH_TIME_FOREVER);
    [[IQService sharedService] registerMicroServicesStatic];
    dispatch_semaphore_signal([IQService sharedService].semaphore);
}

/**
 静态注册
 */
- (void)registerMicroServicesStatic {
    
    NSString *servicePath = [[NSBundle mainBundle] pathForResource:kIQService ofType:@"plist"];
    if (!servicePath) {
        return;
    }
    
    NSArray *servicesList = [NSArray arrayWithContentsOfFile:servicePath];
    
    if (!servicesList.count) {
        return;
    }
    
    for (NSString *moduleName in servicesList) {
        NSString *microServicePath = [[NSBundle mainBundle] pathForResource:moduleName ofType:@"plist"];
        if (!microServicePath) {
            continue;
        }
        
        NSArray *moduleService = [NSArray arrayWithContentsOfFile:microServicePath];
        
        [moduleService enumerateObjectsUsingBlock:^(NSDictionary *obj, NSUInteger idx, BOOL * _Nonnull stop) {
            [self.microServiceMap addEntriesFromDictionary:obj];
        }];
        
    }
    
}

#pragma mark--Getters & Setters--
- (NSMutableDictionary *)microServiceMap {
    if (!_microServiceMap) {
        _microServiceMap = [NSMutableDictionary dictionary];
    }
    return _microServiceMap;
}

- (dispatch_semaphore_t)semaphore {
    if (!_semaphore) {
        _semaphore = dispatch_semaphore_create(1);
    }
    return _semaphore;
}

@end
