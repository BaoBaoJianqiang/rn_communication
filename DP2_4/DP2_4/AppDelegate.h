//
//  AppDelegate.h
//  DP2_4
//
//  Created by jianqiang on 16/8/4.
//  Copyright © 2016年 jianqiang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "APageViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) UINavigationController *navigationController;

@property (strong, nonatomic) APageViewController *rootViewController;

@end

