//
//  ViewController.m
//  CodingHelper
//
//  Created by 徐伟博 on 2019/12/29.
//  Copyright © 2019 徐伟博. All rights reserved.
//

#import "ViewController.h"
#import "NextViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Title";
    self.view.backgroundColor = kCyan;
    
    CGFloat w = 100, h = w, x = (kScreenW - w) / 2, y = (kScreenH - h) / 2;
    UIButton *btn = [CodingHelper createButtonWithType:kCustom frame:CGRectMake(x, y, w, h) backgroundColor:kWhite title:@"GO" font:kSysFont(30) titleColor:kOrange target:self action:@selector(buttonAction)];
    [btn setCornerRadius:w / 2];
    [self.view addSubview:btn];
    
    // https://segmentfault.com/a/1190000013980664
    // 0.代码就绪, 打tag
    // 1.创建.Podspec文件
    // 2.检验.Podspec文件
    // 3.推送到远程的cocoapods, Done!
}

- (void)buttonAction {
    NextViewController *vc = [[NextViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
