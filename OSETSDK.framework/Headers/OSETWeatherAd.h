//
//  OSETWeatherAd.h
//  YhsADSProject
//
//  Created by Shens on 2021/8/4.
//  Copyright © 2021 熊俊. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@protocol OSETWeatherAdDelegate <NSObject>
/// 激励视频加载成功
/// @param rewardVideoAd 激励视频实例
/// @param slotId 广告位ID
- (void)OSETWeatherRewardVideoDidReceiveSuccess:(id)rewardVideoAd slotId:(NSString *)slotId;

/// 激励视频加载失败
- (void)OSETWeatherRewardVideoLoadToFailed:(id)rewardVideoAd error:(NSError *)error;

/// 激励视频点击
- (void)OSETWeatherRewardVideoDidClick:(id)rewardVideoAd;

/// 激励视频关闭
- (void)OSETWeatherRewardVideoDidClose:(id)rewardVideoAd checkString:(NSString *)checkString;

//激励视频播放出错
- (void)OSETWeatherRewardVideoPlayError:(id)rewardVideoAd error:(NSError *)error;

//激励视频播放结束
- (void)OSETWeatherRewardVideoPlayEnd:(id)rewardVideoAd  checkString:(NSString *)checkString;
//激励视频开始播放
- (void)OSETWeatherRewardVideoPlayStart:(id)rewardVideoAd;
//激励视频奖励
- (void)OSETWeatherRewardVideoOnReward:(id)rewardVideoAd checkString:(NSString *)checkString;


@end

NS_ASSUME_NONNULL_BEGIN

@interface OSETWeatherAd : NSObject
@property (nonatomic,weak) id <OSETWeatherAdDelegate> delegate;

@property (nonatomic,strong)   UIColor * navBgColor;
@property (nonatomic,strong)   UIColor * navTitleColor;
@property (nonatomic,strong)   UIColor * bgColor;
@property (nonatomic,strong)   UIImage * backImage;



/// c广告初始化方法
/// @param slotId 激励视频广告id   必传
/// @param interstitialSlotId 插屏广告id
/// @param bannerSlotId banner广告id
- (instancetype)initWithSlotId:(NSString *)slotId
        withInterstitialSlotId:(NSString *)interstitialSlotId
              withBannerSlotId:(NSString *)bannerSlotId;
//显示激励视频面
- (void)showFromRootViewController:(UIViewController *)rootViewController;
//获取广告VC 可以自己通过addChildViewController:等方式添加在自己的VC上 以达到自定义导航栏等功能
- (UIViewController *)OSETGetViewController;
@end

NS_ASSUME_NONNULL_END
