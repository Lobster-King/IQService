//
//  LoginModuleCookieService.m
//  IQServiceDemo
//
//  Created by 秦志伟 on 2019/4/30.
//  Copyright © 2019 lobster. All rights reserved.
//

#import "LoginModuleCookieService.h"

@implementation LoginModuleCookieService

- (NSString *)getCookieWithSignature:(NSString *)signature {
    return [NSString stringWithFormat:@"%@",signature];
}

@end
