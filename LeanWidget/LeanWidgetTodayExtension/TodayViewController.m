//
//  TodayViewController.m
//  LeanWidgetTodayExtension
//
//  Created by Yeongeun Song on 2017. 8. 22..
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
    // Do any additional setup after loading the view from its nib.
}

- (void)userDefaultsDidChange:(NSNotification *) notification {
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

- (id) initWithCoder: (NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    
    if (self) {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(userDefaultsDidChange:) name:NSUserDefaultsDidChangeNotification object:nil];
    }
    
    return self;
}

- (void) refresh {
    NSUserDefaults * sharedUserDefaults = [[NSUserDefaults alloc] initWithSuiteName:@"group.leanGeuni.widget"];
    self.label.text = [sharedUserDefaults objectForKey:@"ExtensionString"];
}

- (IBAction)buttonOpenApp:(id)sender {
    NSURL *url = [NSURL URLWithString:@"AppName://edu.geuni.LeanWidget"];
    [self.extensionContext openURL: url completionHandler:nil];
}

@end
