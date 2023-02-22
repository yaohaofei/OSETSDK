//
//  LootTreasureViewController.m
//  YhsADSProject
//
//  Created by Shens on 2021/3/23.
//  Copyright © 2021 熊俊. All rights reserved.
//

#import "LootTreasureViewController.h"
#import <OSETSDK/OSETSDK.h>
@interface LootTreasureViewController ()<OSETLootRewardVideoAdDelegate>
@property (nonatomic,strong)  OSETLootTreasureAd* luckAd;

@end

@implementation LootTreasureViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"视频夺宝";
    self.luckAd = [[OSETLootTreasureAd alloc]initWithSlotId:@"971D11E82E1009B5CAA2D00EFBC4E372"
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
- (void)OSETLootRewardVideoDidReceiveSuccess:(id)rewardVideoAd slotId:(NSString *)slotId{
    NSLog(@"OSETRewardVideoDidReceiveSuccess");
}

/// 激励视频加载失败
- (void)OSETLootRewardVideoLoadToFailed:(id)rewardVideoAd error:(NSError *)error{
    NSLog(@"激励视频加载失败 ==%@",error);
}

/// 激励视频点击
- (void)OSETLootRewardVideoDidClick:(id)rewardVideoAd{
    NSLog(@"激励视频点击");
}

/// 激励视频关闭
- (void)OSETLootRewardVideoDidClose:(id)rewardVideoAd checkString:(NSString *)checkString{
    NSLog(@"激励视频关闭");
}

//激励视频播放出错
- (void)OSETLootRewardVideoPlayError:(id)rewardVideoAd error:(NSError *)error{
    NSLog(@"激励视频播放出错");
}

//激励视频播放结束
- (void)OSETLootRewardVideoPlayEnd:(id)rewardVideoAd  checkString:(NSString *)checkString{
    NSLog(@"激励视频播放结束");
}
//激励视频开始播放
- (void)OSETLootRewardVideoPlayStart:(id)rewardVideoAd{
    NSLog(@"激励视频开始播放");
}
//激励视频奖励
- (void)OSETLootRewardVideoOnReward:(id)rewardVideoAd checkString:(NSString *)checkString{
    NSLog(@"激励视频奖励");
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
