//
//  OSETLuckyDrawAd.h
//  OSETDemo
//
//  Created by Shens on 2021/1/8.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN


@protocol OSETLootRewardVideoAdDelegate <NSObject>
@optional

/// 激励视频加载成功
/// @param rewardVideoAd 激励视频实例
/// @param slotId 广告位ID
- (void)OSETLootRewardVideoDidReceiveSuccess:(id)rewardVideoAd slotId:(NSString *)slotId;

/// 激励视频加载失败
- (void)OSETLootRewardVideoLoadToFailed:(id)rewardVideoAd error:(NSError *)error;

/// 激励视频点击
- (void)OSETLootRewardVideoDidClick:(id)rewardVideoAd;

/// 激励视频关闭
- (void)OSETLootRewardVideoDidClose:(id)rewardVideoAd checkString:(NSString *)checkString;

//激励视频播放出错
- (void)OSETLootRewardVideoPlayError:(id)rewardVideoAd error:(NSError *)error;

//激励视频播放结束
- (void)OSETLootRewardVideoPlayEnd:(id)rewardVideoAd  checkString:(NSString *)checkString;
//激励视频开始播放
- (void)OSETLootRewardVideoPlayStart:(id)rewardVideoAd;
//激励视频奖励
- (void)OSETLootRewardVideoOnReward:(id)rewardVideoAd checkString:(NSString *)checkString;


@end

@interface OSETLootTreasureAd : NSObject
@property (nonatomic,weak) id <OSETLootRewardVideoAdDelegate> delegate;
//是否是测试环境 默认为NO 弃用 请使用[OSETManager setIsDebug:YES];
@property (nonatomic,assign) BOOL isDebug;
//app用户id 在调用show方法之前设置有效
@property (nonatomic,copy)   NSString *appUserId;
//此app用来跳转的Scheme  info.plist里配置的URL Schemes
@property (nonatomic,copy)   NSString *appScheme;

/// c广告初始化方法
/// @param slotId 激励视频广告id   必传
/// @param interstitialSlotId 插屏广告id
/// @param bannerSlotId banner广告id
/// @param appUserId app用户id
/// @param appScheme app跳转字段 info.plist里配置的URL Schemes
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
