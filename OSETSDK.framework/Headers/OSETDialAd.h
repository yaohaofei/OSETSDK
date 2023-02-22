//
//  OSETDialAd.h
//  YhsADSProject
//
//  Created by Shens on 2021/3/1.
//  Copyright © 2021 熊俊. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol OSETDialAdDelegate <NSObject>
@optional
/// 中奖
-(void)OSETDialAwardsCompleteWithIsAwards:(BOOL)isAwards;
@end

@interface OSETDialAd : NSObject

@property (nonatomic,weak) id<OSETDialAdDelegate> delegate;
@property (nonatomic,strong)   UIColor * navBgColor;
@property (nonatomic,strong)   UIColor * navTitleColor;
@property (nonatomic,strong)   UIColor * bgColor;
@property (nonatomic,strong)   UIImage * backImage;
/// 抽奖广告初始化
/// @param rewardVideoSlotId 激励视频id 必传
/// @param interstitialSlotId 插屏广告id
/// @param bannerSlotId banner广告id
/// @param awardsName 大奖名称
/// @param awardsOdds 大奖中奖几率 （0-100）
/// @param defaultName 小奖名称  小奖概率=（100 - 大奖中奖概率）
/// @param lotteryNum  免费抽奖次数
/// @param lotteryMaxNum  当前最多抽奖次数
- (instancetype)initWithRewardVideoSlotId:(NSString *)rewardVideoSlotId
                   withInterstitialSlotId:(NSString *)interstitialSlotId
                         withBannerSlotId:(NSString *)bannerSlotId
                           withAwardsName:(NSString *)awardsName
                           withAwardsOdds:(NSInteger)awardsOdds
                          withDefaultName:(NSString *)defaultName
                           withLotteryNum:(NSInteger)lotteryNum
                        withLotteryMaxNum:(NSInteger)lotteryMaxNum;

//int(免费摇奖次数), int(每天最多摇奖次数)
- (void)showFromRootViewController:(UIViewController *)rootViewController;
//获取广告VC 可以自己通过addChildViewController:等方式添加在自己的VC上 以达到自定义导航栏等功能
- (UIViewController *)OSETGetViewController;
@end

NS_ASSUME_NONNULL_END
