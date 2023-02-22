
//
//  InsertViewController.m
//  YhsADSProject
//
//  Created by 熊俊 on 2019/11/8.
//  Copyright © 2019 熊俊. All rights reserved.
//

#import "InsertViewController.h"

@interface InsertViewController ()<OSETInterstitialAdDelegate>

@end

@implementation InsertViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"插屏";
    // Do any additional setup after loading the view.
}

- (void)showAd{
    self.interstitialAd = [[OSETInterstitialAd alloc] initWithSlotId:self.slotId];
    self.interstitialAd.delegate = self;
    [self.interstitialAd loadAdData];
}

- (void)interstitialDidReceiveSuccess:(nonnull id)interstitialAd slotId:(nonnull NSString *)slotId {
    [self.interstitialAd showFromRootViewController:self];
    NSLog(@"加载成功");
}

- (void)interstitialLoadToFailed:(nonnull id)interstitialAd error:(nonnull NSError *)error {
    NSLog(@"加载失败%@",error);
}

- (void)interstitialDidClick:(nonnull id)interstitialAd {
    NSLog(@"点击");
}

- (void)interstitialDidClose:(nonnull id)interstitialAd {
    NSLog(@"关闭");
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
