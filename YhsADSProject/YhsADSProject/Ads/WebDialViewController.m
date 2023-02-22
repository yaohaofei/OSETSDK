//
//  WebDialViewController.m
//  YhsADSProject
//
//  Created by Shens on 2021/3/30.
//  Copyright © 2021 熊俊. All rights reserved.
//

#import "WebDialViewController.h"
#import <OSETSDK/OSETSDK.h>
@interface WebDialViewController ()<OSETWebDialAdDelegate>
@property (nonatomic,strong)  OSETWebDialAd* luckAd;


@end

@implementation WebDialViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.luckAd = [[OSETWebDialAd alloc] initWithSlotId:@"971D11E82E1009B5CAA2D00EFBC4E372"
                                 withInterstitialSlotId:@"4FD8476AE54A3DBA39CCD635BBD48957"
                                       withBannerSlotId:@"58A0BB27A707FD48ECACF89B0E8A9657"
                                          withAppUserId:@"123"];
    self.luckAd.delegate = self;
    [self.luckAd showFromRootViewController:self];
    // Do any additional setup after loading the view.
}
-(void)showAd{
    [self.luckAd showFromRootViewController:self];
}
- (void)OSETRewardVideoDidReceiveSuccess:(id)rewardVideoAd slotId:(NSString *)slotId{
    
}

/// 激励视频加载失败
- (void)OSETRewardVideoLoadToFailed:(id)rewardVideoAd error:(NSError *)error{
    
}

/// 激励视频点击
- (void)OSETRewardVideoDidClick:(id)rewardVideoAd{
    
}

/// 激励视频关闭
- (void)OSETRewardVideoDidClose:(id)rewardVideoAd checkString:(NSString *)checkString{
    
}

//激励视频播放出错
- (void)OSETRewardVideoPlayError:(id)rewardVideoAd error:(NSError *)error{
    
}

//激励视频播放结束
- (void)OSETRewardVideoPlayEnd:(id)rewardVideoAd  checkString:(NSString *)checkString{
    
}
//激励视频开始播放
- (void)OSETRewardVideoPlayStart:(id)rewardVideoAd{
    
}
//激励视频奖励
- (void)OSETRewardVideoOnReward:(id)rewardVideoAd checkString:(NSString *)checkString{
    
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
