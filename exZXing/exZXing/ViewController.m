//
//  ViewController.m
//  exZXing
//
//  Created by 엠텔레텍 on 2017. 9. 4..
//  Copyright © 2017년 mteletech. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self showBarcde:@"2013011195647013"];
}


- (void)showBarcde :(NSString*)barcodeString {
    
    NSError *error = nil;
    ZXMultiFormatWriter *writer = [ZXMultiFormatWriter writer];
    ZXBitMatrix *result = [writer encode:barcodeString format:kBarcodeFormatCodabar width:500 height:100 error:&error];
    
    if (result) {
        CGImageRef image = [[ZXImage imageWithMatrix:result] cgimage];
        UIImage *barcodeImage = [[UIImage alloc]initWithCGImage:image];
        self.barcodeView.layer.borderWidth = 2;
        self.barcodeView.layer.borderColor = [[UIColor yellowColor] CGColor];
        self.barcodeView.image = barcodeImage;
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
