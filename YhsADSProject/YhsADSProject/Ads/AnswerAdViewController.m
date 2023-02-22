//
//  AnswerAdViewController.m
//  YhsADSProject
//
//  Created by Shens on 2021/8/24.
//  Copyright © 2021 熊俊. All rights reserved.
//

#import "AnswerAdViewController.h"
#import <OSETSDK/OSETSDK.h>
@interface AnswerAdViewController ()<OSETAnswerAdRewardVideoDelegate>
@property(nonatomic,strong)OSETAnswerAd * answerAdAd;

@end

@implementation AnswerAdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.answerAdAd = [[OSETAnswerAd alloc]initWithSlotId:@"971D11E82E1009B5CAA2D00EFBC4E372"
                                   withInterstitialSlotId:@"4FD8476AE54A3DBA39CCD635BBD48957"
                                   withBannerSlotId:@"58A0BB27A707FD48ECACF89B0E8A9657"
                                            withAnswerNum:@"3"];
    
    self.answerAdAd.delegate = self;
    [self.answerAdAd showFromRootViewController:self];
    // Do any additional setup after loading the view.
}
/// 激励视频关闭
- (void)OSETConstellatoryRewardVideoDidClose:(id)rewardVideoAd checkString:(NSString *)checkString{
    NSLog(@"ConstellatoryViewController --- rewardVideoDidClose");
}
-(void)showAd{
    [self.answerAdAd showFromRootViewController:self];
}

/// 激励视频加载成功
/// @param rewardVideoAd 激励视频实例
/// @param slotId 广告位ID
- (void)OSETAnswerAdRewardVideoDidReceiveSuccess:(id)rewardVideoAd slotId:(NSString *)slotId{
    NSLog(@"%s",__FUNCTION__);
}

/// 激励视频加载失败
- (void)OSETAnswerAdRewardVideoLoadToFailed:(id)rewardVideoAd error:(NSError *)error{
    NSLog(@"%s",__FUNCTION__);
}

/// 激励视频点击
- (void)OSETAnswerAdRewardVideoDidClick:(id)rewardVideoAd{
    NSLog(@"%s",__FUNCTION__);
}

/// 激励视频关闭
- (void)OSETAnswerAdRewardVideoDidClose:(id)rewardVideoAd checkString:(NSString *)checkString{
    NSLog(@"%s",__FUNCTION__);
}

//激励视频播放出错
- (void)OSETAnswerAdRewardVideoPlayError:(id)rewardVideoAd error:(NSError *)error{
    NSLog(@"%s",__FUNCTION__);
}

//激励视频播放结束
- (void)OSETAnswerAdRewardVideoPlayEnd:(id)rewardVideoAd  checkString:(NSString *)checkString{
    NSLog(@"%s",__FUNCTION__);
}
//激励视频开始播放
- (void)OSETAnswerAdRewardVideoPlayStart:(id)rewardVideoAd{
    NSLog(@"%s",__FUNCTION__);
}
//激励视频奖励
- (void)OSETAnswerAdRewardVideoOnReward:(id)rewardVideoAd checkString:(NSString *)checkString{
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
