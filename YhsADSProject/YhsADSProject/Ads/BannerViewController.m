//
//  BannerViewController.m
//  YhsADSProject
//
//  Created by 熊俊 on 2019/11/8.
//  Copyright © 2019 熊俊. All rights reserved.
//

#import "BannerViewController.h"

@interface BannerViewController ()<OSETBannerAdDelegate>

@end

@implementation BannerViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Banner";
    // Do any additional setup after loading the view.
}

- (void)showAd{
    self.bannerAd = [[OSETBannerAd alloc] initWithSlotId:self.slotId rootViewController:self containView:self.view rect:CGRectMake(0, 88, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.width*90/600)];
    self.bannerAd.delegate = self;
    [self.bannerAd loadAdDataAndShow];
}

- (void)bannerDidReceiveSuccess:(id)bannerView slotId:(NSString *)slotId{
    NSLog(@"========加载成功%@",bannerView);
}
/// banner加载失败
- (void)bannerLoadToFailed:(id)bannerView error:(NSError *)error{
    NSLog(@"========bannerLoadToFailed%@",error);
}
- (void)bannerDidClose:(id)bannerView{
    UIView *view = (UIView *)bannerView;
    [view removeFromSuperview];
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
