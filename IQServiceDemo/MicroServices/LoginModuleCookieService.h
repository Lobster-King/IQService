//
//  LoginModuleCookieService.h
//  IQServiceDemo
//
//  Created by 秦志伟 on 2019/4/30.
//  Copyright © 2019 lobster. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LoginModuleCookieService : NSObject

- (NSString *)getCookieWithSignature:(NSString *)signature;

@end

NS_ASSUME_NONNULL_END
