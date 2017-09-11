//
//  TestView.m
//  exViewAction
//
//  Created by 엠텔레텍 on 2017. 9. 7..
//  Copyright © 2017년 mteletech. All rights reserved.
//

#import "TestView.h"

@implementation TestView

-(id)initWithNumber:(CGRect)frame testNumber:(NSUInteger)number {
    
    self = [super initWithFrame:frame];
    if (self != nil) {
        _number = &number;
    }
    return self;
}

- (void)drawNumber {
    UILabel *label = [[UILabel alloc] initWithFrame:self.frame];
    label.center = CGPointMake(self.center.x, 0);
    [label setText:[NSString stringWithFormat:@"%lu", (unsigned long)_number]];
}

- (void)drawButton {
    UIButton *button = [[UIButton alloc] initWithFrame:self.frame];
    button.center = self.center;
    [button setTitle:@"test" forState:UIControlStateNormal];
}

@end
