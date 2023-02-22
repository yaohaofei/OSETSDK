//
//  OSETCrazyDreamAd.h
//  YhsADSProject
//
//  Created by Shens on 2021/4/6.
//  Copyright © 2021 熊俊. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol OSETCrazyDreamAdRewardVideoDelegate <NSObject>
@optional

/// 激励视频加载成功
/// @param rewardVideoAd 激励视频实例
/// @param slotId 广告位ID
- (void)OSETCrazyDreamRewardVideoDidReceiveSuccess:(id)rewardVideoAd slotId:(NSString *)slotId;

/// 激励视频加载失败
- (void)OSETCrazyDreamRewardVideoLoadToFailed:(id)rewardVideoAd error:(NSError *)error;

/// 激励视频点击
- (void)OSETCrazyDreamRewardVideoDidClick:(id)rewardVideoAd;

/// 激励视频关闭
- (void)OSETCrazyDreamRewardVideoDidClose:(id)rewardVideoAd checkString:(NSString *)checkString;

//激励视频播放出错
- (void)OSETCrazyDreamRewardVideoPlayError:(id)rewardVideoAd error:(NSError *)error;

//激励视频播放结束
- (void)OSETCrazyDreamRewardVideoPlayEnd:(id)rewardVideoAd  checkString:(NSString *)checkString;
//激励视频开始播放
- (void)OSETCrazyDreamRewardVideoPlayStart:(id)rewardVideoAd;
//激励视频奖励
- (void)OSETCrazyDreamRewardVideoOnReward:(id)rewardVideoAd checkString:(NSString *)checkString;


@end


@interface OSETCrazyDreamAd : NSObject
@property (nonatomic,weak) id <OSETCrazyDreamAdRewardVideoDelegate> delegate;
//app用户id 在调用show方法之前设置有效
@property (nonatomic,copy)   NSString *appUserId;

/// c广告初始化方法
/// @param slotId 激励视频广告id   必传
/// @param bannerSlotId banner广告id
/// @param appUserId app用户id
- (instancetype)initWithSlotId:(NSString *)slotId
              withBannerSlotId:(NSString *)bannerSlotId
                 withAppUserId:(NSString *)appUserId;
//显示
- (void)showFromRootViewController:(UIViewController *)rootViewController;
- (UIViewController *)OSETGetViewController;
@end

NS_ASSUME_NONNULL_END
