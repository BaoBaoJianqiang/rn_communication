//
//  AboutUsViewController.m
//

#import "AboutUsViewController2.h"
#import "Navigator.h"

@interface AboutUsViewController2 () {
    UILabel* versionLabel;
    NSString* version;
}

@end

@implementation AboutUsViewController2

- (void)loadView {
    if(self.param!=nil){
        version = [self.param objectForKey: @"version"];
    }
    
    //1.从xib中获取View
    NSArray* list = [[NSBundle mainBundle] loadNibNamed: @"AboutUsView" owner: self options: nil];
    self.view = list.lastObject;
    
    versionLabel = (UILabel*)[self.view viewWithTag: 200];
    versionLabel.text = version;

}

@end
