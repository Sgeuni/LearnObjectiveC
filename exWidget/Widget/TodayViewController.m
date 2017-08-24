//
//  TodayViewController.m
//  Widget
//
//  Created by Yeongeun Song on 2017. 8. 24..
//  Copyright © 2017년 Yeongeun Song. All rights reserved.
//

#import "TodayViewController.h"
#import <NotificationCenter/NotificationCenter.h>

@interface TodayViewController () <NCWidgetProviding>

@end

@implementation TodayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self refresh];
    [self setPage01FrameView:self.page01View];
    self.extensionContext.widgetLargestAvailableDisplayMode = NCWidgetDisplayModeExpanded;
    [self setButtonStyle:self.button01];
    [self setButtonStyle:self.button02];
    [self setButtonStyle:self.button03];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)widgetPerformUpdateWithCompletionHandler:(void (^)(NCUpdateResult))completionHandler {
    // Perform any setup necessary in order to update the view.
    
    // If an error is encountered, use NCUpdateResultFailed
    // If there's no update required, use NCUpdateResultNoData
    // If there's an update, use NCUpdateResultNewData

    completionHandler(NCUpdateResultNewData);
}

- (void)widgetActiveDisplayModeDidChange:(NCWidgetDisplayMode)activeDisplayMode withMaximumSize:(CGSize)maxSize {
    if (activeDisplayMode == NCWidgetDisplayModeExpanded) {
        self.preferredContentSize = CGSizeMake(0.0, 150.0);
    } else if (activeDisplayMode == NCWidgetDisplayModeCompact) {
        self.preferredContentSize = maxSize;
    }
}


- (void) refresh {
    NSUserDefaults * sharedUserDefaults = [[NSUserDefaults alloc] initWithSuiteName:@"group.geuniTest"];
//    self.label.text = [sharedUserDefaults objectForKey:@"ExtensionString"];
}

- (id) initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(userDefaultsDidChange:) name:NSUserDefaultsDidChangeNotification object:nil];
    }
    return self;
}

- (void) userDefaultsDidChange:(NSNotification *)notification {
    [self refresh];
}

- (void) setButtonStyle:(UIButton *)button {
    [button.layer setBorderWidth:2.0f];
    [button.layer setBorderColor:[UIColor greenColor].CGColor];
}

- (void)setPage01FrameView:(UIView*)view{
    [view.layer setBorderWidth:2.0f];
    [view.layer setBorderColor:[UIColor blueColor].CGColor];
}


- (IBAction)buttonGoApp:(id)sender {
    NSURL * url = [NSURL URLWithString:@"AppName://edu.geuni.exWidget"];
    [self.extensionContext openURL:url completionHandler:nil];
}
- (IBAction)button01Click:(id)sender {
    NSLog(@"click Test1");
}

- (IBAction)button02Click:(id)sender {
    NSLog(@"click Test2");
}

- (IBAction)button03Click:(id)sender {
    NSLog(@"click Test3");
}


- (IBAction)testButtonAction:(id)sender {

}

- (void) buildViewPage02 {
    self.page02View = [[UIView alloc] initWithFrame:self.view.frame];
    [self.page02View setBackgroundColor:[UIColor redColor]];
    [self.view addSubview:self.page02View];
}
@end
