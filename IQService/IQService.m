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

@interface IQService ()

@end

@implementation IQService

+ (instancetype)sharedService {
    static IQService *service;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        service = [[IQService alloc]init];
    });
    return service;
}

+ (void)invokeMicroService:(NSString *)service,... {
    va_list arguments;
    va_start(arguments, service);
    [[IQService sharedService] invokeService:arguments];
    va_end(arguments);
}

- (void)invokeService:(va_list)arguments {
    NSMutableArray *argsArray = [NSMutableArray array];
    id param = nil;
    while ((param = va_arg(arguments, id))) {
        [argsArray addObject:param];
    }
    
    Class serviceCls = NSClassFromString(@"IQPrintClassNameService");
    id instance = [[serviceCls alloc]init];
    unsigned int count;
    Method *methods = class_copyMethodList(serviceCls, &count);
    Method oneMethod = methods[0];
    SEL selector = method_getName(oneMethod);
    
    NSMethodSignature *mSignature = [instance methodSignatureForSelector:selector];
    NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:mSignature];
    invocation.selector = selector;
    NSInteger index = 2;
    for (id arg in argsArray) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wincompatible-pointer-types-discards-qualifiers"
        [invocation setArgument:&arg atIndex:index];
#pragma clang diagnostic pop
        index++;
    }
    [invocation invokeWithTarget:instance];
    
    
}

+ (void)registerServices {
    [[IQService sharedService] registerServices];
}

- (void)registerServices {
    NSString *servicePath = [[NSBundle mainBundle] pathForResource:@"IQService" ofType:@"plist"];
    NSArray *servicesList = [NSArray arrayWithContentsOfFile:servicePath];
    
    
}


@end
