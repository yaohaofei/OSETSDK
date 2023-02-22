//
//  OSETConstellatoryAd.h
//  YhsADSProject
//
//  Created by Shens on 2021/2/23.
//  Copyright © 2021 熊俊. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN
@protocol OSETConstellatoryAdDelegate <NSObject>
@optional
/// 激励视频关闭
- (void)OSETConstellatoryRewardVideoDidClose:(id)rewardVideoAd checkString:(NSString *)checkString;
//激励视频激励
- (void)OSETConstellatoryRewardVideoOnReward:(id)rewardVideoAd checkString:(NSString *)checkString;
/// 激励视频加载成功
/// @param rewardVideoAd 激励视频实例
/// @param slotId 广告位ID
- (void)OSETConstellatoryRewardVideoDidReceiveSuccess:(id)rewardVideoAd slotId:(NSString *)slotId;

/// 激励视频加载失败
- (void)OSETConstellatoryRewardVideoLoadToFailed:(id)rewardVideoAd error:(NSError *)error;

/// 激励视频点击
- (void)OSETConstellatoryRewardVideoDidClick:(id)rewardVideoAd;

//激励视频播放出错
- (void)OSETConstellatoryRewardVideoPlayError:(id)rewardVideoAd error:(NSError *)error;

//激励视频播放结束
- (void)OSETConstellatoryRewardVideoPlayEnd:(id)rewardVideoAd  checkString:(NSString *)checkString;
//激励视频开始播放
- (void)OSETConstellatoryRewardVideoPlayStart:(id)rewardVideoAd;
@end

@interface OSETConstellatoryAd : NSObject

@property (nonatomic,weak) id<OSETConstellatoryAdDelegate> delegate;

// 星座运势初始化 rewardVideoSlotId 激励视频id 必传
// 可传入interstitialSlotId 插屏广告id  可传入空字符串@""
// 可传入bannerSlotId banner广告id  可传入空字符串@""
- (instancetype)initWithRewardVideoSlotId:(NSString *)rewardVideoSlotId
                   withInterstitialSlotId:(NSString *)interstitialSlotId
                         withBannerSlotId:(NSString *)bannerSlotId;

- (void)showFromRootViewController:(UIViewController *)rootViewController;

@end

NS_ASSUME_NONNULL_END
