//
//  ViewController.m
//  Euler_22
//
//  Created by Yeongeun Song on 2017. 8. 31..
//  Copyright © 2017년 mteletech. All rights reserved.
//

/*
 여기 5천개 이상의 영문 이름들이 들어있는 46KB짜리 텍스트 파일 names.txt 이 있습니다
 (우클릭해서 다운로드 받으세요).
 이제 각 이름에 대해서 아래와 같은 방법으로 점수를 매기고자 합니다.
 
 먼저 모든 이름을 알파벳 순으로 정렬합니다.
 각 이름에 대해서, 그 이름을 이루는 알파벳에 해당하는 숫자(A=1, B=2, ..., Z=26)를 모두 더합니다.
 여기에 이 이름의 순번을 곱합니다.
 예를 들어 "COLIN"의 경우, 알파벳에 해당하는 숫자는 3, 15, 12, 9, 14이므로 합이 53, 그리고 정렬했을 때 938번째에 오므로 최종 점수는 938 × 53 = 49714가 됩니다.
 
 names.txt에 들어있는 모든 이름의 점수를 계산해서 더하면 얼마입니까?
 */

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSUInteger totalSum = 0;
    NSString *path = [[NSBundle mainBundle] pathForResource:@"names" ofType:@"txt"];
    NSString *content = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    NSArray* strings = [content componentsSeparatedByString:@","];
    NSArray* sortedStrings = [strings sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
    
    for (int i = 0 ; i < [sortedStrings count] ; i++ ) {
        totalSum = totalSum + ([self sumOfString: sortedStrings[i]] * (i+1));
    }
    NSLog(@"totalSum = %ld" , totalSum);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSUInteger)sumOfString: (NSString *)string {
    NSUInteger sum = 0;
    for (int i = 0 ; i < string.length ; i++ ) {
        unichar ch = [string characterAtIndex:i];
        sum = sum + [self indexOfChar:[NSString stringWithFormat: @"%C", ch]];
    }
    return sum;
}

- (NSUInteger)indexOfChar: (NSString*)string{
    NSString* alpabet = @"ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    NSRange range = [alpabet rangeOfString:string];
    if (range.location != NSNotFound)
    {
        return range.location+1;
    } else {
        return 0;
    }
}
@end
