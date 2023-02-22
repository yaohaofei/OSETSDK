//
//  CalendarViewController.m
//  YhsADSProject
//
//  Created by Shens on 2021/4/9.
//  Copyright © 2021 熊俊. All rights reserved.
//

#import "CalendarViewController.h"

@interface CalendarViewController ()<OSETCalendarAdRewardVideoDelegate>
@property(nonatomic,strong)OSETCalendarAd * calendarAd;
@end

@implementation CalendarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.calendarAd  = [[OSETCalendarAd alloc]initWithSlotId:@"971D11E82E1009B5CAA2D00EFBC4E372" withBannerSlotId:@"58A0BB27A707FD48ECACF89B0E8A9657" withAppUserId:@""];
    self.calendarAd.delegate = self;
    [self.calendarAd showFromRootViewController:self];
    
    // Do any additional setup after loading the view.
}
/// 激励视频加载成功
/// @param rewardVideoAd 激励视频实例
/// @param slotId 广告位ID
- (void)OSETCalendarRewardVideoDidReceiveSuccess:(id)rewardVideoAd slotId:(NSString *)slotId{
    NSLog(@"%s",__FUNCTION__);
}

/// 激励视频加载失败
- (void)OSETCalendarRewardVideoLoadToFailed:(id)rewardVideoAd error:(NSError *)error{
    NSLog(@"%s",__FUNCTION__);
}

/// 激励视频点击
- (void)OSETCalendarRewardVideoDidClick:(id)rewardVideoAd{
    NSLog(@"%s",__FUNCTION__);
}

/// 激励视频关闭
- (void)OSETCalendarRewardVideoDidClose:(id)rewardVideoAd checkString:(NSString *)checkString{
    NSLog(@"%s",__FUNCTION__);
}

//激励视频播放出错
- (void)OSETCalendarRewardVideoPlayError:(id)rewardVideoAd error:(NSError *)error{
    NSLog(@"%s",__FUNCTION__);
}

//激励视频播放结束
- (void)OSETCalendarRewardVideoPlayEnd:(id)rewardVideoAd  checkString:(NSString *)checkString{
    NSLog(@"%s",__FUNCTION__);
}
//激励视频开始播放
- (void)OSETCalendarRewardVideoPlayStart:(id)rewardVideoAd{
    NSLog(@"%s",__FUNCTION__);
}
//激励视频奖励
- (void)OSETCalendarRewardVideoOnReward:(id)rewardVideoAd checkString:(NSString *)checkString{
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
