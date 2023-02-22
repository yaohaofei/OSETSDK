//
//  OSETBannerAd.h
//  YhsADSProject
//
//  Created by 熊俊 on 2020/4/26.
//  Copyright © 2020 熊俊. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol OSETBannerAdDelegate <NSObject>
@optional

/// banner加载成功
/// @param bannerView banner实例
/// @param slotId 广告位ID
- (void)bannerDidReceiveSuccess:(id)bannerView slotId:(NSString *)slotId;

/// banner加载失败
- (void)bannerLoadToFailed:(id)bannerView error:(NSError *)error;

/// banner点击
- (void)bannerDidClick:(id)bannerView;

/// banner关闭
- (void)bannerDidClose:(id)bannerView;

@end

@interface OSETBannerAd : NSObject

@property (nonatomic,weak) id <OSETBannerAdDelegate> delegate;

/// 初始化banner
/// @param slotId 广告位Id
/// @param rootViewController 当前控制器
/// @param containView 容器view
- (instancetype)initWithSlotId:(NSString *)slotId
            rootViewController:(UIViewController *)rootViewController
                   containView:(UIView *)containView
                          rect:(CGRect)rect;


/// 加载并且显示
- (void)loadAdDataAndShow;

@end

NS_ASSUME_NONNULL_END
