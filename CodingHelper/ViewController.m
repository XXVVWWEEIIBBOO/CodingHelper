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
    
    // https://segmentfault.com/a/1190000013980664
    // 0.代码就绪, 打tag
    // 1.创建.Podspec文件
    // 2.检验.Podspec文件
    // 3.推送到远程的cocoapods, Done!
}

@end
