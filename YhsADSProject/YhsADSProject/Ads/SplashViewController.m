//
//  SplashViewController.m
//  YhsADSProject
//
//  Created by 熊俊 on 2019/11/8.
//  Copyright © 2019 熊俊. All rights reserved.
//

#import "SplashViewController.h"

@interface SplashViewController ()<OSETSplashAdDelegate>

@end

@implementation SplashViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"开屏广告";
    // Do any additional setup after loading the view.
}

- (void)showAd{
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    self.splashAd = [[OSETSplashAd alloc] initWithSlotId:self.slotId window:window bottomView:[UIView new]];
    self.splashAd.delegate = self;
    [self.splashAd loadAdDataAndShow];
}

- (void)splashDidReceiveSuccess:(id)splashAd slotId:(NSString *)slotId{
    NSLog(@"加载成功");
}

- (void)splashLoadToFailed:(id)splashAd error:(NSError *)error{
    NSLog(@"加载失败%@",error);
}

-(void)splashDidClick:(id)splashAd{
    NSLog(@"点击");
}

- (void)splashDidClose:(id)splashAd{
    NSLog(@"关闭");
}
- (void)splashWillClose:(id)splashAd{
    NSLog(@"splashWillClose");
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
