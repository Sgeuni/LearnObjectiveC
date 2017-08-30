//
//  Page01ViewController.m
//  exWidget
//
//  Created by Yeongeun Song on 2017. 8. 25..
//  Copyright © 2017년 Yeongeun Song. All rights reserved.
//

#import "Page01ViewController.h"

@interface Page01ViewController ()

@end

@implementation Page01ViewController

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


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
