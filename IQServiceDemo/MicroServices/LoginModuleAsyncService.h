//
//  LoginModuleAsyncService.h
//  IQServiceDemo
//
//  Created by 秦志伟 on 2019/4/30.
//  Copyright © 2019 lobster. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LoginModuleAsyncService : NSObject

- (void)getCookieWithSignature:(NSString *)signature callBack:(void (^)(NSString *))callBack;

@end

NS_ASSUME_NONNULL_END
