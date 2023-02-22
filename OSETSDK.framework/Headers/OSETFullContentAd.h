//
//  OSETFullContentAd.h
//  YhsADSProject
//
//  Created by 熊俊 on 2020/7/15.
//  Copyright © 2020 熊俊. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@class OSETFullscreenAdViewController;
typedef NS_ENUM(NSInteger, OSETContentType) {
    OSETContentTypeFullscreen,
    OSETContentTypeFeed
};

NS_ASSUME_NONNULL_BEGIN


@protocol OSETFullContentAdDelegate <NSObject>//只针对OSETContentTypeFullscreen类型
/**
 * 视频开始播放
 * @param videoContent 内容模型
 */
- (void)videoDidStartPlay:(id)videoContent  withIsAd:(BOOL)isAd;
/**
* 视频暂停播放
* @param videoContent 内容模型
*/
- (void)videoDidPause:(id)videoContent;
/**
* 视频恢复播放
* @param videoContent 内容模型
*/
- (void)videoDidResume:(id)videoContent;
/**
* 视频停止播放
* @param videoContent 内容模型
* @param finished     是否播放完成
*/
- (void)videoDidEndPlay:(id)videoContent isFinished:(BOOL)finished;
/**
* 视频播放失败
* @param videoContent 内容模型
* @param error        失败原因
*/
- (void)videoDidFailedToPlay:(id)videoContent withError:(NSError *)error;
@end

@interface OSETFullContentAd : NSObject

@property (nonatomic,weak) id<OSETFullContentAdDelegate> delegate;
@property (nonatomic,strong) OSETFullscreenAdViewController *fullscreenAdVC;
@property (nonatomic,assign)   NSInteger maxTimeCount;
@property (nonatomic,assign)   NSInteger viewerTime;
//初始化
- (instancetype)initWithSlotId:(NSString *)slotId type:(OSETContentType)type rootViewController:(UIViewController *)rootViewController;

/// 加载
/// @param complete 加载结果
- (void)loadAdDataComplete:(nonnull void (^)(id _Nonnull, BOOL))complete watchCallback:(void(^)(void))watchCallback;

///OSETContentTypeFullscreen 类广告加载成功,需手动调起
- (void)showFromRootViewController:(UIViewController *)rootViewController;

- (void)setBackHidden:(BOOL)isHidden;

- (void)setNavBarHidden:(BOOL)isHidden animated:(BOOL)animated;

@end

NS_ASSUME_NONNULL_END
