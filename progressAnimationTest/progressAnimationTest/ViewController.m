//
//  ViewController.m
//  progressAnimationTest
//
//  Created by 엠텔레텍 on 2017. 9. 11..
//  Copyright © 2017년 mteletech. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    _circleProgress.backgroundColor = [UIColor clearColor];
    _circleProgress.maxValue = 0;
    _circleProgress.value = 0;
    _circleProgress.progressAngle = 50;
    _circleProgress.progressLineWidth = 7;
    _circleProgress.emptyLineWidth = 3;
    _circleProgress.unitString = @"MB";
    _circleProgress.valueFontName = @"Arial-BoldMT";
    _circleProgress.valueFontSize = 20;
    _circleProgress.unitFontSize = 10;
    
}
- (IBAction)resetButtonTapped:(id)sender {
    _circleProgress.maxValue = 100;
    _circleProgress.value = 0;
}

- (IBAction)testButtonTapped:(id)sender {
    _circleProgress.maxValue = 100;
    _circleProgress.value = 0;
    [UIView animateWithDuration:1.0f delay:0.0f options:UIViewAnimationOptionCurveEaseInOut animations:^{
        _circleProgress.value = 50;
    } completion:^(BOOL finished) {
        
     
    }];

    
    [UIView commitAnimations];
}


- (void) setDataCircleProgress:(NSString*)maxValue currentValue:(NSString*)value {
    CGFloat max = (CGFloat)[maxValue floatValue];
    CGFloat current = (CGFloat)[value floatValue];
    _circleProgress.maxValue = max;
    _circleProgress.value = 0;
    
    [UIView animateWithDuration:10.0f animations:^{
        _circleProgress.value = current;
    }];
    
    [UIView commitAnimations];
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
