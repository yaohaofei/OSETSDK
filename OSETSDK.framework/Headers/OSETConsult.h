//
//  OSETConsult.h
//  YhsADSProject
//
//  Created by 熊俊 on 2020/7/21.
//  Copyright © 2020 熊俊. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol OSETConsultAdDelegate <NSObject>
/**
 * 用户点击咨询列表
 * @param isAd 点击的是否是广告
 */
- (void)OSETConsultDidSelectItemWithIsAd:(BOOL)isAd;

@end
@interface OSETConsult : NSObject
@property (nonatomic,weak) id<OSETConsultAdDelegate> delegate;

/// 资讯广告初始化
/// @param slotId 资讯广告id
/// @param count 1
/// @param time 1
/// @param interstitialSlotId 插屏广告位id
/// @param bannerSlotId banner广告位id
- (instancetype)initWithSlotId:(NSString *)slotId
                  showAdsCount:(NSInteger)count
                  maxTimeCount:(NSInteger)maxTimeCount
                    timeLength:(NSInteger)time
        withInterstitialSlotId:(NSString *)interstitialSlotId
              withBannerSlotId:(NSString *)bannerSlotId;

- (instancetype)initWithSlotId:(NSString *)slotId showAdsCount:(NSInteger)count maxTimeCount:(NSInteger)maxTimeCount timeLength:(NSInteger)time;

- (void)showFromRootViewController:(UIViewController *)rootViewController watchCallback:(void(^)(void))watchCallback;


- (UIViewController *)getOSETConsultViewControllerWatchCallback:(void(^)(void))watchCallback;

@end

NS_ASSUME_NONNULL_END
