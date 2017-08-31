//
//  ViewController.m
//  ViewSizeTest
//
//  Created by Yeongeun Song on 2017. 8. 24..
//  Copyright © 2017년 Yeongeun Song. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self showView];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
}

- (void)showView {
    NSURL *imageUrl = [NSURL URLWithString:@"http://www.williammalone.com/articles/create-html5-canvas-javascript-game-character/images/character-color.png"];
    NSData *imageData = [NSData dataWithContentsOfURL:imageUrl];
    UIImage *image = [[UIImage alloc] initWithData:imageData];
    self.imageView.backgroundColor = [UIColor yellowColor];
    self.imageView.image = image;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
