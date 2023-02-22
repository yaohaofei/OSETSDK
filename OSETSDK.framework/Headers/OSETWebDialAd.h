//
//  OSETWebDialAd.h
//  YhsADSProject
//
//  Created by Shens on 2021/3/29.
//  Copyright © 2021 熊俊. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN
@protocol OSETWebDialAdDelegate <NSObject>
/// 激励视频加载成功
/// @param rewardVideoAd 激励视频实例
/// @param slotId 广告位ID
- (void)OSETRewardVideoDidReceiveSuccess:(id)rewardVideoAd slotId:(NSString *)slotId;

/// 激励视频加载失败
- (void)OSETRewardVideoLoadToFailed:(id)rewardVideoAd error:(NSError *)error;

/// 激励视频点击
- (void)OSETRewardVideoDidClick:(id)rewardVideoAd;

/// 激励视频关闭
- (void)OSETRewardVideoDidClose:(id)rewardVideoAd checkString:(NSString *)checkString;

//激励视频播放出错
- (void)OSETRewardVideoPlayError:(id)rewardVideoAd error:(NSError *)error;

//激励视频播放结束
- (void)OSETRewardVideoPlayEnd:(id)rewardVideoAd  checkString:(NSString *)checkString;
//激励视频开始播放
- (void)OSETRewardVideoPlayStart:(id)rewardVideoAd;
//激励视频奖励
- (void)OSETRewardVideoOnReward:(id)rewardVideoAd checkString:(NSString *)checkString;


@end


@interface OSETWebDialAd : NSObject
@property (nonatomic,weak) id <OSETWebDialAdDelegate> delegate;

//app用户id 在调用show方法之前设置有效
@property (nonatomic,copy)   NSString *appUserId;
//此app用来跳转的Scheme  info.plist里配置的URL Schemes
@property (nonatomic,copy)   NSString *appScheme;

/// c广告初始化方法
/// @param slotId 激励视频广告id   必传
/// @param interstitialSlotId 插屏广告id
/// @param bannerSlotId banner广告id
/// @param appUserId app用户id
- (instancetype)initWithSlotId:(NSString *)slotId
        withInterstitialSlotId:(NSString *)interstitialSlotId
              withBannerSlotId:(NSString *)bannerSlotId
                 withAppUserId:(NSString *)appUserId;
//显示激励视频面
- (void)showFromRootViewController:(UIViewController *)rootViewController;
//获取广告VC 可以自己通过addChildViewController:等方式添加在自己的VC上 以达到自定义导航栏等功能
- (UIViewController *)OSETGetViewController;
@end

NS_ASSUME_NONNULL_END
