//
//  ViewController.m
//  exUIViewTouchEffect
//
//  Created by 엠텔레텍 on 2017. 9. 13..
//  Copyright © 2017년 mteletech. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _btnUiViewTap = [[UILongPressGestureRecognizer alloc]initWithTarget:self
                                                                 action:@selector(btnUiViewTapped:)];
    _btnUiViewTap.minimumPressDuration = 0;
    [_btnUiView addGestureRecognizer:_btnUiViewTap];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)btnUiViewTapped: (UITapGestureRecognizer*) sender {
    if ([self viewTapOpactity:_btnUiView tapGesture:sender.state]) {
        NSLog(@"Event Action!!");
    }
}

- (BOOL)viewTapOpactity:(UIView*)view tapGesture:(UIGestureRecognizerState)state {
    CGFloat defaultOpacity = 1.0f;
    CGFloat tapDownOpacity = 0.6f;
    
    if (state == UIGestureRecognizerStateBegan) {
        [self setAlphaViews:view opacity:tapDownOpacity];
        _labelGesture.text = @"Touch Began";
        return NO;
    } else if (state == UIGestureRecognizerStateEnded) {
        [self setAlphaViews:view opacity:defaultOpacity];
        _labelGesture.text = @"Geuni Example";
        return YES;
    } else {
        [self setAlphaViews:view opacity:defaultOpacity];
        _labelGesture.text = @"Touch Cancel";
        return NO;
    }
}

// 클릭하는 뷰의 하위 뷰에도 같은 효과를 적용하기
- (void)setAlphaViews:(UIView*)view opacity:(CGFloat)opacity {
    view.alpha = opacity;
    NSArray *subViews = [view subviews];
    for (UIView *subView in subViews) {
        subView.alpha = opacity;
    }
}



@end
