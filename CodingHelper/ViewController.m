//
//  ViewController.m
//  CodingHelper
//
//  Created by 徐伟博 on 2019/12/29.
//  Copyright © 2019 徐伟博. All rights reserved.
//

#import "ViewController.h"
#import "CodingHelper.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.cyanColor;
    
    UIView *red = viewWithFrameAndBackgroundColor(CGRectMake(100, 100, 100, 100), UIColor.redColor);
    [self.view addSubview:red];
}

@end
