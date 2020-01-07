//
//  NextViewController.m
//  CodingHelper_Xcode_9_2
//
//  Created by 徐伟博 on 2018/2/8.
//  Copyright © 2018年 徐伟博. All rights reserved.
//

#import "NextViewController.h"

#define kInitialNumber 10
#define kLabelFont     200
#define kInterval      1.0

@interface NextViewController ()

@property (nonatomic) NSInteger number;
@property (nonatomic) NSTimer *timer;

@end

@implementation NextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Next";
    self.view.backgroundColor = kCyan;
    
    self.number = kInitialNumber;
    
    UILabel *lb = [CodingHelper createLabelWithFrame:kScreenB backgroundColor:kWhite text:kIntString(self.number) lines:1 font:kSysFont(kLabelFont) textColor:kOrange align:kCenter breakMode:kWord];
    [self.view addSubview:lb];
    
    kWEAK_SELF;
    self.timer = [CodingHelper safeTimerWithTimeInterval:kInterval repeats:YES block:^{
        kSTRONG_SELF;
        strongSelf.number -= 1;
        if (strongSelf.number) {
            lb.text = kIntString(strongSelf.number);
        } else {
            [strongSelf.navigationController popViewControllerAnimated:YES];
        }
    }];
}

- (void)dealloc {
    [_timer invalidate];
    _timer = nil;
    kLogFuncName;
}

@end
