//
//  ViewController.h
//  exUIViewTouchEffect
//
//  Created by 엠텔레텍 on 2017. 9. 13..
//  Copyright © 2017년 mteletech. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIView *btnUiView;

@property UILongPressGestureRecognizer *btnUiViewTap;
@property (strong, nonatomic) IBOutlet UILabel *labelGesture;

@end

