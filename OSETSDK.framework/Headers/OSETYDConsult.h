//
//  OSETYDConsult.h
//  OSETSDK
//
//  Created by Shens on 2021/6/15.
//  Copyright © 2021 熊俊. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN
@protocol OSETYDConsultDelegate <NSObject>
@optional
/// 激励视频加载失败
- (void)OSETYDConsultLoadToFailed:(NSString *)slotId error:(NSError *)error;

///  分享回调
- (void)OSETYDConsultShareWithTitle:(NSString *)title withUrl:(NSString *)url withImageUrl:(NSString *)imageUrl withContext:(NSString *)context;
@end
@interface OSETYDConsult : NSObject

@property (nonatomic,weak) id <OSETYDConsultDelegate> delegate;

/// 资讯广告初始化
/// @param slotId 资讯广告id
/// @param time 1
/// @param interstitialSlotId 插屏广告位id
/// @param bannerSlotId banner广告位id
- (instancetype)initWithSlotId:(NSString *)slotId
                    timeLength:(NSInteger)time
                   withIsShare:(BOOL)isShare
        withInterstitialSlotId:(NSString *)interstitialSlotId
              withBannerSlotId:(NSString *)bannerSlotId;

- (instancetype)initWithSlotId:(NSString *)slotId showAdsCount:(NSInteger)count timeLength:(NSInteger)time;

- (void)showFromRootViewController:(UIViewController *)rootViewController watchCallback:(void(^)(void))watchCallback;


- (UIViewController *)getOSETConsultViewControllerWatchCallback:(void(^)(void))watchCallback;
@end

NS_ASSUME_NONNULL_END

