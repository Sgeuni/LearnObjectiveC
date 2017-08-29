//
//  TodayViewController.m
//  Widget
//
//  Created by Yeongeun Song on 2017. 8. 24..
//  Copyright © 2017년 Yeongeun Song. All rights reserved.
//

#import "TodayViewController.h"
#import <NotificationCenter/NotificationCenter.h>

#define PREFERRED_CONTENT_HEIGHT 250
#define WIDGET_HEIGHT 110

@interface TodayViewController () <NCWidgetProviding>

@end

@implementation TodayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self refresh];
    [self setPage01FrameViewStyle:self.page01View];
    [self setButtonStyle:self.button01];
    [self setButtonStyle:self.button02];
    [self setButtonStyle:self.button03];
    [self setButtonStyle:self.buttonExpand];
    
    [self buildViewPage02];
    self.extensionContext.widgetLargestAvailableDisplayMode = NCWidgetDisplayModeExpanded;
    
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)widgetPerformUpdateWithCompletionHandler:(void (^)(NCUpdateResult))completionHandler {
    completionHandler(NCUpdateResultNewData);
}

- (void)widgetActiveDisplayModeDidChange:(NCWidgetDisplayMode)activeDisplayMode withMaximumSize:(CGSize)maxSize {
    if (activeDisplayMode == NCWidgetDisplayModeExpanded) {
        [self widgetModeExpand:CGSizeMake(0.0f, PREFERRED_CONTENT_HEIGHT)];
        
    } else if (activeDisplayMode == NCWidgetDisplayModeCompact) {
        [self widgetModeCompact:maxSize];
    }
}

- (UIEdgeInsets)widgetMarginInsetsForProposedMarginInsets:(UIEdgeInsets)defaultMarginInsets {
    return UIEdgeInsetsZero;
}


- (void) refresh {
    NSUserDefaults * sharedUserDefaults = [[NSUserDefaults alloc] initWithSuiteName:@"group.geuniTest"];
    self.testLabel.text = [sharedUserDefaults objectForKey:@"ExtensionString"];
}

- (id) initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(userDefaultsDidChange:) name:NSUserDefaultsDidChangeNotification object:nil];
    }
    return self;
}

- (void) userDefaultsDidChange:(NSNotification *)notification {
    NSLog(@"userDefaultsDidChange");
    [self refresh];
}

- (void) setButtonStyle:(UIButton *)button {
    [button.layer setBorderWidth:2.0f];
    [button.layer setBorderColor:[UIColor whiteColor].CGColor];
}

- (void)setPage01FrameViewStyle:(UIView*)view{
    //Test
    [view.layer setBorderWidth:2.0f];
    [view.layer setBorderColor:[UIColor blueColor].CGColor];
}


- (IBAction)buttonGoApp:(id)sender {
    NSURL * url = [NSURL URLWithString:@"GeuniWidget://edu.geuni.exWidget"];
    [self.extensionContext openURL:url completionHandler:nil];
}

- (IBAction)button01Click:(id)sender {
    NSExtensionContext *context=[self extensionContext];
    [context openURL:[NSURL URLWithString:@"GeuniWidget://page/page01"] completionHandler:nil];
}

- (IBAction)button02Click:(id)sender {
    NSExtensionContext *context=[self extensionContext];
    [context openURL:[NSURL URLWithString:@"GeuniWidget://page/page02"] completionHandler:nil];
}

- (IBAction)button03Click:(id)sender {
    [self showViewPage2];
}

- (IBAction)buttonExpand:(id)sender {
    NSLog(@"buttonExpand click");
}

- (void) buildViewPage02 {
    self.page02View = [[UIView alloc] initWithFrame:
                       CGRectMake(0, 0, self.view.frame.size.width, WIDGET_HEIGHT)];
    [self.page02View setBackgroundColor:[UIColor whiteColor]];
    
    /* Local Image */
    UIImage *image = [UIImage imageNamed:@"testImage.png"];
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.page02View.frame];
    imageView.image = image;
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    
    /* Close Button*/
    UIButton *buttonClose = [UIButton buttonWithType:UIButtonTypeCustom];
    [buttonClose addTarget:self action:@selector(hideViewPage2) forControlEvents:UIControlEventTouchUpInside];
    [buttonClose setTitle:@"close" forState:UIControlStateNormal];
    [buttonClose setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    buttonClose.frame = CGRectMake(0, 0, 100, 60);
    
    
    [self.page02View addSubview:imageView];
    [self.page02View addSubview:buttonClose];
    self.page02View.hidden = YES;
    
    [self.view addSubview:self.page02View];
}

- (void)showViewPage2 {
    self.page02View.hidden = NO;
    self.extensionContext.widgetLargestAvailableDisplayMode = NCWidgetDisplayModeCompact;
    [self slideOnAnimation:self.page02View];
}

- (void)hideViewPage2 {
    self.page02View.hidden = YES;
    self.extensionContext.widgetLargestAvailableDisplayMode = NCWidgetDisplayModeExpanded;
    [self slideOffAnimation:self.page02View];
}

//위젯이 확장시 호출
- (void)widgetModeExpand:(CGSize)expandSize{
    self.preferredContentSize = expandSize;
    self.page01ExpandFrameView.hidden = NO;
    self.testLabel.hidden = NO;
    self.buttonGoApp.hidden = NO;
}

//위젯이 축소시 호출
- (void)widgetModeCompact:(CGSize)maxSize{
    self.preferredContentSize = maxSize;
    self.page01ExpandFrameView.hidden = YES;
    self.testLabel.hidden = YES;
    self.buttonGoApp.hidden = YES;
}

- (void)slideOnAnimation : (UIView*)animationView {
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:1];
    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:animationView cache:YES];
    [self.view addSubview:animationView];
    [UIView commitAnimations];
}

- (void)slideOffAnimation : (UIView*)animationView {
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:1];
    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromRight forView:animationView cache:YES];
    [self.view addSubview:animationView];
    [UIView commitAnimations];
}

@end
