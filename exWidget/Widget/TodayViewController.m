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

- (void) refresh {
    NSUserDefaults * sharedUserDefaults = [[NSUserDefaults alloc] initWithSuiteName:@"group.geuniTest"];
    self.label.text = [sharedUserDefaults objectForKey:@"ExtensionString"];
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

- (IBAction)buttonGoApp:(id)sender {
    NSURL * url = [NSURL URLWithString:@"AppName://edu.geuni.exWidget"];
    [self.extensionContext openURL:url completionHandler:nil];
}

@end
