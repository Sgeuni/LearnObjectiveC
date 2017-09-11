//
//  TestView.h
//  exViewAction
//
//  Created by 엠텔레텍 on 2017. 9. 7..
//  Copyright © 2017년 mteletech. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TestView : UIView

-(id)initWithNumber:(CGRect)frame testNumber:(NSUInteger)number;
@property NSUInteger* number;
@end
