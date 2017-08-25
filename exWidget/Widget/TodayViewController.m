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

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    NSLog(@"viewDidLayoutSubviews");
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

- (UIEdgeInsets)widgetMarginInsetsForProposedMarginInsets:(UIEdgeInsets)defaultMarginInsets {
    return UIEdgeInsetsZero;
}


- (void) refresh {
    NSUserDefaults * sharedUserDefaults = [[NSUserDefaults alloc] initWithSuiteName:@"group.geuniTest"];
    self.testLabel.text = [sharedUserDefaults objectForKey:@"ExtensionString"];
}

- (id) initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(userDefaultsDidChange:) name:NSUserDefaultsDidChangeNotification object:nil];
    }
    return self;
}

- (void) userDefaultsDidChange:(NSNotification *)notification {
    NSLog(@"userDefaultsDidChange");
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
    NSURL * url = [NSURL URLWithString:@"GeuniWidget://edu.geuni.exWidget"];
    [self.extensionContext openURL:url completionHandler:nil];
}

- (IBAction)button01Click:(id)sender {
    NSExtensionContext *context=[self extensionContext];
    [context openURL:[NSURL URLWithString:@"GeuniWidget://page/page01"] completionHandler:nil];
}

- (IBAction)button02Click:(id)sender {
    NSExtensionContext *context=[self extensionContext];
    [context openURL:[NSURL URLWithString:@"GeuniWidget://page/page02"] completionHandler:nil];
}

- (IBAction)button03Click:(id)sender {
    NSExtensionContext *context=[self extensionContext];
    [context openURL:[NSURL URLWithString:@"GeuniWidget://page/page03"] completionHandler:nil];
}


- (void) buildViewPage02 {
    self.page02View = [[UIView alloc] initWithFrame:self.view.frame];
    [self.page02View setBackgroundColor:[UIColor redColor]];
    [self.view addSubview:self.page02View];
}
@end
