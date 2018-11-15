//
//  MyModule.h
//  DP2_4
//
//  Created by jianqiang on 17/3/23.
//  Copyright © 2017年 jianqiang. All rights reserved.
//

#import "React/RCTEventEmitter.h"
#import "React/RCTBridgeModule.h"

@interface MyModule : RCTEventEmitter <RCTBridgeModule>

- (void)tellJS;

@end
