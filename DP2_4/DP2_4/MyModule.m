//
//  MyModule.m
//  DP2_4
//
//  Created by jianqiang on 17/3/23.
//  Copyright © 2017年 jianqiang. All rights reserved.
//

#import "MyModule.h"

@implementation MyModule

+(id)allocWithZone:(NSZone *)zone {
    static RCTBridge *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [super allocWithZone:zone];
    });
    return sharedInstance;
}

RCT_EXPORT_MODULE();

- (NSArray<NSString *> *)supportedEvents {
    return @[@"sayHello"];
}

- (void)tellJS {
    [self sendEventWithName:@"sayHello" body:@"Hello"];
}

@end
