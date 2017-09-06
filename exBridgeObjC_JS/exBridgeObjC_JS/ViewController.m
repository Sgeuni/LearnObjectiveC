//
//  ViewController.m
//  exBridgeObjC_JS
//
//  Created by 엠텔레텍 on 2017. 9. 6..
//  Copyright © 2017년 mteletech. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIWebViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.webView.delegate = self;
    self.webView.layer.borderColor = [UIColor greenColor].CGColor;
    self.webView.layer.borderWidth = 2.0f;
    
    NSString *htmlFile = [[NSBundle mainBundle] pathForResource:@"sample" ofType:@"html"];
    NSString *htmlString = [NSString stringWithContentsOfFile:htmlFile encoding:NSUTF8StringEncoding error:nil];
    
    [self.webView loadHTMLString:htmlString baseURL:nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

- (IBAction)testButtonTap:(id)sender {
    [self.webView stringByEvaluatingJavaScriptFromString:@"changeDocument()"];
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(nonnull NSError *)error {
    NSLog(@"Error : %@", error);
}

- (void)objcFuncFromJS {
    static int testFlag = 0;
    if (testFlag % 2 == 0) {
        self.testLabel.text = @"Hello World";
    } else {
        self.testLabel.text = @"Bye World";
    }
    testFlag++;
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    
    if([[[request URL]absoluteString]hasPrefix:@"hybrid:"]) {
        
        NSString *requestString = [[request URL]absoluteString];
        NSArray *components = [requestString componentsSeparatedByString:@"://"];
        NSString *functionName = [components objectAtIndex:1];
        
        [self performSelector:NSSelectorFromString(functionName)];
        
        return NO;
    } else {
        return YES;
    }
    
}


@end
