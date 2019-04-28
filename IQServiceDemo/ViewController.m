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
    [IQService invokeMicroService:@"name",@"我是调用者",nil];
    // Do any additional setup after loading the view.
}


@end
