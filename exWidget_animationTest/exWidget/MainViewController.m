//
//  ViewController.m
//  exWidget
//
//  Created by Yeongeun Song on 2017. 8. 24..
//  Copyright © 2017년 Yeongeun Song. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonApply:(id)sender {
    NSUserDefaults *sharedUserDefault = [[NSUserDefaults alloc] initWithSuiteName:@"group.geuniTest"];
    [sharedUserDefault setObject:self.textField.text forKey:@"ExtensionString"];
    [sharedUserDefault synchronize];
}

- (IBAction)buttonPage01:(id)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"GeuniWidget://page/page01"] options:@{} completionHandler:^(BOOL success) {
        if (success) {
            NSLog(@"success");
        }
    }];
}

- (IBAction)buttonPage02:(id)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"GeuniWidget://page/page01"] options:@{} completionHandler:^(BOOL success) {
        if (success) {
            NSLog(@"success");
        }
    }];
}

- (IBAction)buttonPage03:(id)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"GeuniWidget://page/page01"] options:@{} completionHandler:^(BOOL success) {
        if (success) {
            NSLog(@"success");
        }
    }];
}


@end
