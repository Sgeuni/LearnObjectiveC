//
//  TodayViewController.h
//  Widget
//
//  Created by Yeongeun Song on 2017. 8. 24..
//  Copyright © 2017년 Yeongeun Song. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TodayViewController : UIViewController

@property (strong, nonatomic) UIView *page01View ;
@property (strong, nonatomic) UIView *page02View ;
@property (strong, nonatomic) UIButton *buttonPage02Close;

@property (weak, nonatomic) IBOutlet UIView *page01FrameView;
@property (weak, nonatomic) IBOutlet UIView *page01ExpandFrameView;
@property (weak, nonatomic) IBOutlet UIButton *button01;
@property (weak, nonatomic) IBOutlet UIButton *button02;
@property (weak, nonatomic) IBOutlet UIButton *button03;
@property (weak, nonatomic) IBOutlet UIButton *buttonExpand;
@property (weak, nonatomic) IBOutlet UIButton *buttonGoApp;
@property (weak, nonatomic) IBOutlet UILabel *testLabel;

@end
