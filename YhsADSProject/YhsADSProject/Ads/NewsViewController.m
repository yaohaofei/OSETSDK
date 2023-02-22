//
//  NewsViewController.m
//  YhsADSProject
//
//  Created by 熊俊 on 2020/7/21.
//  Copyright © 2020 熊俊. All rights reserved.
//

#import "NewsViewController.h"
#import <OSETSDK/OSETSDK.h>

@interface NewsViewController ()<OSETConsultAdDelegate>

@property (nonatomic,strong) OSETConsult *consultAd;
@property (nonatomic,strong) UIViewController *vc;

@end

@implementation NewsViewController
-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.consultAd = [[OSETConsult alloc] initWithSlotId:@"908FD9663CDD3817B3F0F22B2DCA0277"
                                            showAdsCount:6
                                            maxTimeCount:1
                                              timeLength:0//倒计时回调 调用showFromRootViewController的watchCallback 不用可传0
                                  withInterstitialSlotId:@"4FD8476AE54A3DBA39CCD635BBD48957"
                                        withBannerSlotId:@"58A0BB27A707FD48ECACF89B0E8A9657"];
    self.consultAd.delegate = self;
    
//    self.vc = [self.consultAd getOSETConsultViewControllerWatchCallback:^{
//
//    }];
//    [self addChildViewController:self.vc];
//    self.vc.view.frame = self.view.bounds;
//    [self.view addSubview:self.vc.view];
    // Do any additional setup after loading the view.
}
/**
 * 用户点击咨询列表
 * @param isAd 点击的是否是广告
 */
- (void)OSETConsultDidSelectItemWithIsAd:(BOOL)isAd{
    NSLog(@"点击 ===  %i",isAd);
}
- (void)showAd {
    [self.consultAd showFromRootViewController:self watchCallback:^{
        NSLog(@"showFromRootViewControllerwatchCallback");
    }];
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
