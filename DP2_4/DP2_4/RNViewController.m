//
//  RNViewController.m
//

#import "RNViewController.h"
#import "Navigator.h"

#import "React/RCTBundleURLProvider.h"
#import "RCTRootView.h"
#import "MyModule.h"

@interface RNViewController () {
    UIButton* jump1Button;
    RCTRootView *rootView;
}

@end

@implementation RNViewController

@synthesize firstName;
@synthesize lastName;

-(void)loadView {
    //1.从xib中获取View
    NSArray* list = [[NSBundle mainBundle] loadNibNamed: @"RNView" owner: self options: nil];
    self.view = list.lastObject;
    
    if(self.param) {
        firstName = [self.param objectForKey: @"firstname"];
        lastName = [self.param objectForKey: @"lastname"];
    } else {
        firstName = @"jianqiang";
        lastName = @"bao";
    }
    
    NSDictionary* dic = @{@"firstname": firstName, @"lastname": lastName};

    NSURL *jsCodeLocation;
    jsCodeLocation = [NSURL URLWithString:@"http://100.84.168.163:8081/index.ios.bundle?platform=ios&dev=true"];
    
    rootView = [[RCTRootView alloc] initWithBundleURL:jsCodeLocation
                                                        moduleName:@"RN6"
                                                 initialProperties:dic
                                                     launchOptions:nil];
    
    rootView.frame = CGRectMake(0, 300, 300, 300);
    [self.view addSubview:rootView];
    
    jump1Button = (UIButton*)[self.view viewWithTag: 500];
    [jump1Button addTarget: self action: @selector(jumpTo1) forControlEvents:UIControlEventTouchUpInside];
    
}


- (void) jumpTo1 {
    NSDictionary* dic = @{@"firstname": @"曼云", @"lastname": @"郭"};
    rootView.appProperties = dic;

    MyModule* myModule = [MyModule new];
    [myModule tellJS];
}


@end
