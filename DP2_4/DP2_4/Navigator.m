//
//  Navigator.m
//  DP2_4
//
//  Created by jianqiang on 16/8/4.
//  Copyright (c) 2016年. All rights reserved.
//

#import "Navigator.h"
#import "BaseViewController.h"
#import "SingletonScript.h"

@implementation Navigator

@synthesize nav = _nav;

SYNTHESIZE_SINGLETON_FOR_CLASS(Navigator);

+ (void)navigateTo:(NSString *)viewController {
    [[self getInstance] navigateTo:viewController withData:nil];
}

+ (void)navigateTo:(NSString *)viewController
          withData:(NSMutableDictionary *)param {
    [[self getInstance] navigateTo:viewController withData:param];
}

- (void)navigateTo:(NSString *)viewController withData:(NSMutableDictionary*)param {
    BaseViewController * classObject = (BaseViewController *)[[NSClassFromString(viewController) alloc] init];
    classObject.param = param;
    
    [_nav pushViewController:classObject animated:YES];
}

RCT_EXPORT_MODULE();

RCT_EXPORT_METHOD(navigatorTo:(NSString *)viewController param:(NSDictionary *)param)
{
    dispatch_async(dispatch_get_main_queue(), ^{
        BaseViewController * classObject = (BaseViewController *)[[NSClassFromString(viewController) alloc] init];
        classObject.param = param;
        
        [_nav pushViewController:classObject animated:YES];
    });
}

@end
