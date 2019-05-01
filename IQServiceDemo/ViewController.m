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
    NSString *cookie = [IQService invokeMicroServiceSync:@"LoginModuleCookieService",@"我是同步调用",nil];
    NSLog(@"%@",cookie);
    
    void (^callBack)(NSString *) = ^(NSString *cookie){
        NSLog(@"%@",cookie);
    };
    [IQService invokeMicroService:@"LoginModuleAsyncService",@"我是异步调用",callBack,nil];
    // Do any additional setup after loading the view.
}


@end
