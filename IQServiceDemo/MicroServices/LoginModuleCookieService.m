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
    /*
     1.返回值英文、无拼接->不崩溃
     2.返回值英文、有拼接->崩溃
     3.返回值中文、无拼接->崩溃
     4.返回值中文、有拼接->崩溃
     
     */
    return [NSString stringWithFormat:@"%@",signature];
//    return [NSString stringWithFormat:@"%@->cookie",signature];
}

@end
