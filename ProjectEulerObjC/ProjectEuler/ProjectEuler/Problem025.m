//
//  Problem025.m
//  ProjectEuler
//
//  Created by 엠텔레텍 on 2017. 10. 20..
//  Copyright © 2017년 mteletech. All rights reserved.
//

#import "Problem025.h"

@implementation Problem025


- (NSInteger)Fibonacci:(NSInteger)count {

    NSInteger val0 = 1;
    NSInteger val1 = 1;
    NSInteger result = 0;
    
    if(count == 0 || count ==1){
        return 1;
    } else {
        for(int i = 0 ; i < (count-2) ; i++) {
            result = val0 + val1;
            val0 = val1;
            val1 = result;
        }
    }
    
    return result;
}


- (NSString*)result {
    return @"";
}

@end
