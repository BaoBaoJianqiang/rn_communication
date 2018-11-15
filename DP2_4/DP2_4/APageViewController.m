//
//  APageViewController.m
//  MyApp
//
//  Created by jax on 13-9-2.
//  Copyright (c) 2013年 Bao. All rights reserved.
//

#import "APageViewController.h"
#import "Navigator.h"
#import "AboutUsViewController.h"

@interface APageViewController () {
    UIButton* jump1Button;
    UIButton* jump2Button;
    UIButton* jumpRNButton;
    UIButton* jumpRNButton2;
}

@end

@implementation APageViewController

-(void)loadView {
    //1.从xib中获取View
    NSArray* list = [[NSBundle mainBundle] loadNibNamed: @"APageView" owner: self options: nil];
    self.view = list.lastObject;
    
    jump1Button = (UIButton*)[self.view viewWithTag: 500];
    [jump1Button addTarget: self action: @selector(jumpTo1) forControlEvents:UIControlEventTouchUpInside];

    jump2Button = (UIButton*)[self.view viewWithTag: 600];
    [jump2Button addTarget: self action: @selector(jumpTo2) forControlEvents:UIControlEventTouchUpInside];
    
    jumpRNButton = (UIButton*)[self.view viewWithTag: 1000];
    [jumpRNButton addTarget: self action: @selector(jumpToRN) forControlEvents:UIControlEventTouchUpInside];
    
    jumpRNButton2 = (UIButton*)[self.view viewWithTag: 1001];
    [jumpRNButton2 addTarget: self action: @selector(jumpToRN2) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void) jumpTo1 {
    AboutUsViewController* b = [[AboutUsViewController alloc] init];
    b.version = @"5.7.1";
    [self.navigationController pushViewController: b animated:YES];
}

- (void) jumpTo2 {
    NSMutableDictionary* dict = [NSMutableDictionary dictionary];
    [dict setObject: @"5.7.1" forKey:@"version"];
    
    [Navigator navigateTo: @"AboutUsViewController2" withData: dict];
}

- (void) jumpToRN {
    NSMutableDictionary* dict = [NSMutableDictionary dictionary];
    [Navigator navigateTo: @"RNViewController"];
}

- (void) jumpToRN2 {
    NSMutableDictionary* dict = [NSMutableDictionary dictionary];
    [dict setObject: @"manyun" forKey:@"firstname"];
    [dict setObject: @"guo" forKey:@"lastname"];
    [Navigator navigateTo: @"RNViewController" withData: dict];
}

@end
