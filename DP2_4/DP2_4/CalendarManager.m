//
//  CalendarManager.m
//  DP2_4
//
//  Created by jianqiang on 17/3/22.
//  Copyright © 2017年 jianqiang. All rights reserved.
//

#import "CalendarManager.h"
#import "RCTConvert.h"

#import "RCTBridge.h"
#import "RCTEventDispatcher.h"

@implementation CalendarManager

@synthesize bridge = _bridge;

RCT_EXPORT_MODULE();

RCT_EXPORT_METHOD(addEvent:(NSString *)name location:(NSString *)location) {
    NSLog(@"%@", name);
}

RCT_EXPORT_METHOD(addEvent2:(NSString *)name location:(NSString *)location date:(nonnull NSNumber *)secondsSinceUnixEpoch) {
    NSDate *date = [RCTConvert NSDate:secondsSinceUnixEpoch];
    NSLog(@"%@", date);
}

RCT_EXPORT_METHOD(addEvent3:(NSString *)name location:(NSString *)location date:(NSString *)ISO8601DateString) {
    NSDate *date = [RCTConvert NSDate:ISO8601DateString];
    NSLog(@"%@", date);
}

RCT_EXPORT_METHOD(addEvent4:(NSString *)name location:(NSString *)location date:(NSDate *)date) {
    // Date is ready to use!
    NSLog(@"%@", date);
}

//可选参数，使用字典
RCT_EXPORT_METHOD(addEvent5:(NSString *)name details:(NSDictionary *)details) {
    NSString *location = [RCTConvert NSString:details[@"location"]];
    NSDate *time = [RCTConvert NSDate:details[@"time"]];
    int a = 1;
}

//回调，js获取app方法执行结果
RCT_EXPORT_METHOD(RNInvokeOCCallBack:(NSDictionary *)dictionary callback:(RCTResponseSenderBlock)callback){
    NSLog(@"接收到RN传过来的数据为:%@",dictionary);
    NSArray *array = [[NSArray alloc] initWithObjects:@"张三",@"李四", nil];
    callback(@[[NSNull null], array]);
}

///Promiss
RCT_REMAP_METHOD(findEvents,
                 resolver:(RCTPromiseResolveBlock)resolve
                 rejecter:(RCTPromiseRejectBlock)reject) {
    NSArray *events = [[NSArray alloc] initWithObjects:@"张三",@"李四", nil];
    if (events) {
        resolve(events);
    } else {
        NSError* error = nil;
        reject(@"name", @"reason", error);
    }
}

@end
