//
//  CrazyDreamViewController.m
//  YhsADSProject
//
//  Created by Shens on 2021/4/9.
//  Copyright © 2021 熊俊. All rights reserved.
//

#import "CrazyDreamViewController.h"
#import <OSETSDK/OSETSDK.h>
@interface CrazyDreamViewController ()<OSETCrazyDreamAdRewardVideoDelegate>
@property (nonatomic,strong)  OSETCrazyDreamAd* crazyDream;

@end

@implementation CrazyDreamViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.crazyDream = [[OSETCrazyDreamAd alloc]initWithSlotId:@"971D11E82E1009B5CAA2D00EFBC4E372"
                                             withBannerSlotId:@"58A0BB27A707FD48ECACF89B0E8A9657"
                                                withAppUserId:@"123"];
    self.crazyDream.delegate = self;
    [self.crazyDream showFromRootViewController:self];
    
    // Do any additional setup after loading the view.
}
/// 激励视频加载成功
/// @param rewardVideoAd 激励视频实例
/// @param slotId 广告位ID
- (void)OSETCrazyDreamRewardVideoDidReceiveSuccess:(id)rewardVideoAd slotId:(NSString *)slotId{
    NSLog(@"%s",__FUNCTION__);
}

/// 激励视频加载失败
- (void)OSETCrazyDreamRewardVideoLoadToFailed:(id)rewardVideoAd error:(NSError *)error{
    NSLog(@"%s",__FUNCTION__);
}

/// 激励视频点击
- (void)OSETCrazyDreamRewardVideoDidClick:(id)rewardVideoAd{
    NSLog(@"%s",__FUNCTION__);
}

/// 激励视频关闭
- (void)OSETCrazyDreamRewardVideoDidClose:(id)rewardVideoAd checkString:(NSString *)checkString{
    NSLog(@"%s",__FUNCTION__);
}

//激励视频播放出错
- (void)OSETCrazyDreamRewardVideoPlayError:(id)rewardVideoAd error:(NSError *)error{
    NSLog(@"%s",__FUNCTION__);
}

//激励视频播放结束
- (void)OSETCrazyDreamRewardVideoPlayEnd:(id)rewardVideoAd  checkString:(NSString *)checkString{
    NSLog(@"%s",__FUNCTION__);
}
//激励视频开始播放
- (void)OSETCrazyDreamRewardVideoPlayStart:(id)rewardVideoAd{
    NSLog(@"%s",__FUNCTION__);
}
//激励视频奖励
- (void)OSETCrazyDreamRewardVideoOnReward:(id)rewardVideoAd checkString:(NSString *)checkString{
    NSLog(@"%s",__FUNCTION__);
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
