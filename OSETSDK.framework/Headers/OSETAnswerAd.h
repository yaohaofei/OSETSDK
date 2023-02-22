//
//  OSETAnswerAd.h
//  YhsADSProject
//
//  Created by Shens on 2021/8/24.
//  Copyright © 2021 熊俊. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN
@protocol OSETAnswerAdRewardVideoDelegate <NSObject>
@optional
/// 激励视频加载成功
/// @param rewardVideoAd 激励视频实例
/// @param slotId 广告位ID
- (void)OSETAnswerAdRewardVideoDidReceiveSuccess:(id)rewardVideoAd slotId:(NSString *)slotId;

/// 激励视频加载失败
- (void)OSETAnswerAdRewardVideoLoadToFailed:(id)rewardVideoAd error:(NSError *)error;

/// 激励视频点击
- (void)OSETAnswerAdRewardVideoDidClick:(id)rewardVideoAd;

/// 激励视频关闭
- (void)OSETAnswerAdRewardVideoDidClose:(id)rewardVideoAd checkString:(NSString *)checkString;

//激励视频播放出错
- (void)OSETAnswerAdRewardVideoPlayError:(id)rewardVideoAd error:(NSError *)error;

//激励视频播放结束
- (void)OSETAnswerAdRewardVideoPlayEnd:(id)rewardVideoAd  checkString:(NSString *)checkString;
//激励视频开始播放
- (void)OSETAnswerAdRewardVideoPlayStart:(id)rewardVideoAd;
//激励视频奖励
- (void)OSETAnswerAdRewardVideoOnReward:(id)rewardVideoAd checkString:(NSString *)checkString;


@end
@interface OSETAnswerAd : NSObject
@property (nonatomic,weak) id <OSETAnswerAdRewardVideoDelegate> delegate;
//app用户id 在调用show方法之前设置有效
@property (nonatomic,copy)   NSString *appUserId;

/// c广告初始化方法
/// @param slotId 激励视频广告id   必传
/// @param interstitialSlotId 插屏广告id
/// @param bannerSlotId banner广告id
/// @param answerNum  答题次数
- (instancetype)initWithSlotId:(NSString *)slotId
        withInterstitialSlotId:(NSString *)interstitialSlotId
              withBannerSlotId:(NSString *)bannerSlotId
                 withAnswerNum:(NSString *)answerNum;
//显示
- (void)showFromRootViewController:(UIViewController *)rootViewController;
- (UIViewController *)OSETGetViewController;
@end

NS_ASSUME_NONNULL_END
