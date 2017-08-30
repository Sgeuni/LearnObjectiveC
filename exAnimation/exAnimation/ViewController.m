//
//  ViewController.m
//  exAnimation
//
//  Created by Yeongeun Song on 2017. 8. 29..
//  Copyright © 2017년 Yeongeun Song. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self saveImageViewFrame];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)saveImageViewFrame {
    
    self.imageOrginRect = CGRectMake(self.testImageView.frame.origin.x
                                     , self.testImageView.frame.origin.y
                                     , self.testImageView.frame.size.width
                                     , self.testImageView.frame.size.height);
    
}


- (IBAction)button01Action:(id)sender {
    if (self.testImageView.hidden == false) {
        return;
    }
    
    self.testImageView.hidden = false;
    self.testImageView.alpha = 0.0;
    self.testImageView.frame = CGRectMake( self.imageOrginRect.origin.x + 200
                                          , self.imageOrginRect.origin.y
                                          , self.imageOrginRect.size.width
                                          , self.imageOrginRect.size.height);
    [UIView animateWithDuration:0.5
                          delay:0.0
                        options:UIViewAnimationOptionCurveEaseOut
                     animations:^{
                         self.testImageView.alpha = 1.0;
                         self.testImageView.frame = self.imageOrginRect;
                     }
                     completion:nil];
}

- (IBAction)button02Action:(id)sender {
    if (self.testImageView.hidden == false) {
        return;
    }
    
    self.testImageView.hidden = false;
    self.testImageView.alpha = 0.0;
    self.testImageView.frame = CGRectMake( self.imageOrginRect.origin.x + 200
                                          , self.imageOrginRect.origin.y
                                          , self.imageOrginRect.size.width
                                          , self.imageOrginRect.size.height);
    [UIView animateWithDuration:0.7
                          delay:0.0
                        options:UIViewAnimationOptionCurveEaseOut
                     animations:^{
                         self.testImageView.alpha = 1.0;
                         self.testImageView.frame = self.imageOrginRect;
                     }
                     completion:nil];
}

- (IBAction)button03Action:(id)sender {
    if (self.testImageView.hidden == false) {
        return;
    }
    
    self.testImageView.hidden = false;
    self.testImageView.alpha = 0.0;
    self.testImageView.frame = CGRectMake( self.imageOrginRect.origin.x + 200
                                          , self.imageOrginRect.origin.y
                                          , self.imageOrginRect.size.width
                                          , self.imageOrginRect.size.height);
    [UIView animateWithDuration:1.0
                          delay:0.0
                        options:UIViewAnimationOptionCurveEaseOut
                     animations:^{
                         self.testImageView.alpha = 1.0;
                         self.testImageView.frame = self.imageOrginRect;
                     }
                     completion:nil];
}

- (IBAction)button04Action:(id)sender {
    if (self.testImageView.hidden == true) {
        return;
    }
    
    [UIView animateWithDuration:0.5
                          delay:0.0
                        options:UIViewAnimationOptionCurveEaseOut
                     animations:^{
                         self.testImageView.alpha = 0.0;
                         self.testImageView.frame = CGRectMake( self.imageOrginRect.origin.x + 200
                                                               , self.imageOrginRect.origin.y
                                                               , self.imageOrginRect.size.width
                                                               , self.imageOrginRect.size.height);
                     }
                     completion:^(BOOL finished){
                         self.testImageView.hidden = true;
                     }];
}

- (IBAction)button05Action:(id)sender {
    if (self.testImageView.hidden == true) {
        return;
    }
    
    [UIView animateWithDuration:0.7
                          delay:0.0
                        options:UIViewAnimationOptionCurveEaseOut
                     animations:^{
                         self.testImageView.alpha = 0.0;
                         self.testImageView.frame = CGRectMake( self.imageOrginRect.origin.x + 200
                                                               , self.imageOrginRect.origin.y
                                                               , self.imageOrginRect.size.width
                                                               , self.imageOrginRect.size.height);
                     }
                     completion:^(BOOL finished){
                         self.testImageView.hidden = true;
                     }];
}

- (IBAction)button06Action:(id)sender {
    if (self.testImageView.hidden == true) {
        return;
    }
    
    [UIView animateWithDuration:1.0
                          delay:0.0
                        options:UIViewAnimationOptionCurveEaseOut
                     animations:^{
                         self.testImageView.alpha = 0.0;
                         self.testImageView.frame = CGRectMake( self.imageOrginRect.origin.x + 200
                                                               , self.imageOrginRect.origin.y
                                                               , self.imageOrginRect.size.width
                                                               , self.imageOrginRect.size.height);
                     }
                     completion:^(BOOL finished){
                         self.testImageView.hidden = true;
                     }];
}

- (IBAction)button07Action:(id)sender {
    self.testImageView.hidden = false;
    self.testImageView.alpha = 0.0;
    self.testImageView.frame = CGRectMake( self.imageOrginRect.origin.x + 200
                                          , self.imageOrginRect.origin.y
                                          , self.imageOrginRect.size.width
                                          , self.imageOrginRect.size.height);
    [UIView animateWithDuration:1.0
                          delay:0.0
                        options:UIViewAnimationOptionCurveEaseIn
                     animations:^{
                         self.testImageView.alpha = 1.0;
                         self.testImageView.frame = self.imageOrginRect;
                     }
                     completion:nil];
}

- (IBAction)button08Action:(id)sender {
    self.testImageView.hidden = false;
    self.testImageView.alpha = 0.0;
    self.testImageView.frame = CGRectMake( self.imageOrginRect.origin.x + 200
                                          , self.imageOrginRect.origin.y
                                          , self.imageOrginRect.size.width
                                          , self.imageOrginRect.size.height);
    [UIView animateWithDuration:1.0
                          delay:0.0
                        options:UIViewAnimationOptionCurveEaseOut
                     animations:^{
                         self.testImageView.alpha = 1.0;
                         self.testImageView.frame = self.imageOrginRect;
                     }
                     completion:nil];

}

- (IBAction)button09Action:(id)sender {
    self.testImageView.hidden = false;
    self.testImageView.alpha = 0.0;
    self.testImageView.frame = CGRectMake( self.imageOrginRect.origin.x + 200
                                          , self.imageOrginRect.origin.y
                                          , self.imageOrginRect.size.width
                                          , self.imageOrginRect.size.height);
    [UIView animateWithDuration:1.0
                          delay:0.0
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         self.testImageView.alpha = 1.0;
                         self.testImageView.frame = self.imageOrginRect;
                     }
                     completion:nil];
}


@end
