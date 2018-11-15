//
//  Navigator.h
//  DP2_4
//
//  Created by jianqiang on 16/8/4.
//  Copyright (c) 2016年. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import <React/RCTBridgeModule.h>
#import <React/RCTLog.h>

@interface Navigator : NSObject<RCTBridgeModule> {
    UINavigationController *_nav;
}

@property (nonatomic, retain) UINavigationController *nav;

+ (Navigator *)getInstance;

+ (void)navigateTo:(NSString *)viewController;

+ (void)navigateTo:(NSString *)viewController withData:(NSMutableDictionary *)param;

@end
