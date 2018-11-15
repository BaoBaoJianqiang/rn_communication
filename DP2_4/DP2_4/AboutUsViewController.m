//
//  AboutUsViewController.m
//

#import "AboutUsViewController.h"
#import "Navigator.h"

@interface AboutUsViewController () {
    UILabel* versionLabel;
}

@end

@implementation AboutUsViewController

@synthesize version;

- (void)loadView {
    //1.从xib中获取View
    NSArray* list = [[NSBundle mainBundle] loadNibNamed: @"AboutUsView" owner: self options: nil];
    self.view = list.lastObject;
    
    versionLabel = (UILabel*)[self.view viewWithTag: 200];
    versionLabel.text = self.version;
}

@end
