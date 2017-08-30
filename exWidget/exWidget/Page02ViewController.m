//
//  Page02ViewController.m
//  exWidget
//
//  Created by Yeongeun Song on 2017. 8. 25..
//  Copyright © 2017년 Yeongeun Song. All rights reserved.
//

#import "Page02ViewController.h"

@interface Page02ViewController ()

@end

@implementation Page02ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonGoMain:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
    
}

@end
