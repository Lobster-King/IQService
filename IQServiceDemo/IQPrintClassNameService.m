//
//  IQPrintClassNameService.m
//  IQServiceDemo
//
//  Created by lobster on 2019/4/28.
//  Copyright © 2019 lobster. All rights reserved.
//

#import "IQPrintClassNameService.h"

@implementation IQPrintClassNameService

- (void)printClassNameWithCaller:(NSString *)caller {
    NSLog(@"%@--%@",caller,NSStringFromClass([self class]));
}

@end
