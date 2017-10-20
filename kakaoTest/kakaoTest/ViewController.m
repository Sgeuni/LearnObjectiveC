//
//  ViewController.m
//  kakaoTest
//
//  Created by 엠텔레텍 on 2017. 10. 19..
//  Copyright © 2017년 mteletech. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"number = %@",[self DecTOBin:12]);
    
}

- (NSString*)DecTOBin:(NSInteger)dec {
    if (dec == 1 || dec == 0) {
        return [NSString stringWithFormat:@"%ld", (long)dec];
    }
    return [NSString stringWithFormat:@"%@%ld", [self DecTOBin:dec/2], dec%2];
}


- (IBAction)testButtonAction:(id)sender {
    [self showAlert];
}

- (void)showAlert {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"" message:@"message" preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [alert dismissViewControllerAnimated:YES completion:nil];
    }];
    
    [alert addAction:ok];
    
    [self presentViewController:alert animated:YES completion:nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
