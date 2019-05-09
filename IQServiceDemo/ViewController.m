//
//  ViewController.m
//  IQServiceDemo
//
//  Created by lobster on 2019/4/28.
//  Copyright © 2019 lobster. All rights reserved.
//

#import "ViewController.h"
#import <IQService/IQService.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
#warning 卧槽，神奇的崩溃，崩溃原因与函数返回值有很大的关系。
    /*
     1.返回值英文、无拼接->不崩溃
     2.返回值英文、有拼接->崩溃
     3.返回值中文、无拼接->崩溃
     4.返回值中文、有拼接->崩溃
     */
    
    NSString *cookie = [IQService invokeMicroServiceSync:@"GetCookieSyncService",@"我是同步调用",nil];
    NSLog(@"%@",cookie);
    
//    NSString *cookie = [IQService invokeMicroServiceSync:@"GetCookieSyncService",@"asd",nil];
//    NSLog(@"%@",cookie);
    
//    NSString *cookie = [IQService invokeMicroServiceSync:@"GetCookieSyncService",@"asd",nil];
//    NSLog(@"%@",cookie);
//
//    NSString *cookie = [IQService invokeMicroServiceSync:@"GetCookieSyncService",@"中文",nil];
//    NSLog(@"%@",cookie);
//
//    NSString *cookie = [IQService invokeMicroServiceSync:@"GetCookieSyncService",@"中文",nil];
//    NSLog(@"%@",cookie);

    void (^callBack)(NSString *) = ^(NSString *cookie){
        NSLog(@"%@",cookie);
    };
    [IQService invokeMicroService:@"GetCookieAsyncService",@"我是异步调用",callBack,nil];



    // Do any additional setup after loading the view.
}


@end
