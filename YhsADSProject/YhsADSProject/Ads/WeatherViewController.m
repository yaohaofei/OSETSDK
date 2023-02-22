//
//  WeatherViewController.m
//  YhsADSProject
//
//  Created by Shens on 2021/8/4.
//  Copyright © 2021 熊俊. All rights reserved.
//

#import "WeatherViewController.h"
@interface WeatherViewController ()<OSETWeatherAdDelegate>
@property(nonatomic,strong)OSETWeatherAd * weatherAd;

@end

@implementation WeatherViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.weatherAd = [[OSETWeatherAd alloc]initWithSlotId:@"971D11E82E1009B5CAA2D00EFBC4E372"
                                   withInterstitialSlotId:@"4FD8476AE54A3DBA39CCD635BBD48957"
                                         withBannerSlotId:@"58A0BB27A707FD48ECACF89B0E8A9657"];
    self.weatherAd.delegate = self;
    [self.weatherAd showFromRootViewController:self];
    
    // Do any additional setup after loading the view.
}
- (void)OSETWeatherRewardVideoDidReceiveSuccess:(id)rewardVideoAd slotId:(NSString *)slotId{
    NSLog(@"OSETWeatherRewardVideoDidReceiveSuccess");
}

/// 激励视频加载失败
- (void)OSETWeatherRewardVideoLoadToFailed:(id)rewardVideoAd error:(NSError *)error{
    NSLog(@"OSETWeatherRewardVideoLoadToFailed== %@",error);
}

/// 激励视频点击
- (void)OSETWeatherRewardVideoDidClick:(id)rewardVideoAd{
    NSLog(@"OSETWeatherRewardVideoDidClick");
}

/// 激励视频关闭
- (void)OSETWeatherRewardVideoDidClose:(id)rewardVideoAd checkString:(NSString *)checkString{
    NSLog(@"OSETWeatherRewardVideoDidClose");
}

//激励视频播放出错
- (void)OSETWeatherRewardVideoPlayError:(id)rewardVideoAd error:(NSError *)error{
    NSLog(@"OSETWeatherRewardVideoPlayError == %@",error);
}

//激励视频播放结束
- (void)OSETWeatherRewardVideoPlayEnd:(id)rewardVideoAd  checkString:(NSString *)checkString{
    NSLog(@"OSETWeatherRewardVideoPlayEnd");
}
//激励视频开始播放
- (void)OSETWeatherRewardVideoPlayStart:(id)rewardVideoAd{
    NSLog(@"OSETWeatherRewardVideoPlayStart");
}
//激励视频奖励
- (void)OSETWeatherRewardVideoOnReward:(id)rewardVideoAd checkString:(NSString *)checkString{
    NSLog(@"OSETWeatherRewardVideoOnReward");
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
