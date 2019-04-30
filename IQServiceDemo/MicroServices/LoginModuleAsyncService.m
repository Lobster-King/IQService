//
//  LoginModuleAsyncService.m
//  IQServiceDemo
//
//  Created by 秦志伟 on 2019/4/30.
//  Copyright © 2019 lobster. All rights reserved.
//

#import "LoginModuleAsyncService.h"

@implementation LoginModuleAsyncService

- (void)getCookieWithSignature:(NSString *)signature callBack:(void (^)(NSString *))callBack {
    if (callBack) {
        callBack([NSString stringWithFormat:@"%@->cookie",signature]);
    }
}

@end
