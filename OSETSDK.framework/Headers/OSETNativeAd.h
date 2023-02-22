//
//  OSETNaiveAd.h
//  YhsADSProject
//
//  Created by 熊俊 on 2020/4/28.
//  Copyright © 2020 熊俊. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol OSETNativeAdDelegate <NSObject>
@optional

/// 信息流加载成功
/// @param nativeExpressViews 信息流广告View数组
- (void)nativeExpressAdLoadSuccess:(NSArray *)nativeExpressViews;

/// 渲染成功
/// @param nativeExpressView view
- (void)nativeExpressAdRenderSuccess:(id)nativeExpressView;

/// 加载失败
/// @param nativeExpressAd 信息流实例
/// @param error 错误信息
- (void)nativeExpressAdFailedToLoad:(id)nativeExpressAd error:(NSError *)error;

/// 信息流渲染失败
/// @param nativeExpressView view
- (void)nativeExpressAdFailedToRender:(id)nativeExpressView;

/// 信息流点击事件
/// @param nativeExpressView view
- (void)nativeExpressAdDidClick:(id)nativeExpressView;

/// 信息流关闭事件
/// @param nativeExpressView view
- (void)nativeExpressAdDidClose:(id)nativeExpressView;

///视频完成播放
- (void)nativeExpressAdViewPlayerDidPlayFinish:(id)nativeExpressAd;
///视频开始播放
- (void)nativeExpressAdVideoDidStart:(id)nativeExpressAd;
///视频暂停播放
- (void)nativeExpressAdVideoDidPause:(id)nativeExpressAd;

@end

@interface OSETNativeAd : NSObject

@property (nonatomic,weak) id <OSETNativeAdDelegate> delegate;

/// 信息流初始化
/// @param slotId 广告位ID
/// @param size 广告尺寸
/// @param drawNative 信息流广告类型(YES:draw信息流 NO:普通信息流)
- (instancetype)initWithSlotId:(NSString *)slotId size:(CGSize)size rootViewController:(UIViewController *)rootViewController isDrawNative:(BOOL)drawNative;

/// 加载信息流
/// @param count 一次请求数量
- (void)loadAdData:(NSInteger)count;


@end

NS_ASSUME_NONNULL_END
