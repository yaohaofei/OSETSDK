//
//  OSETRewardVideoAd.h
//  YhsADSProject
//
//  Created by 熊俊 on 2020/4/27.
//  Copyright © 2020 熊俊. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol OSETRewardVideoAdDelegate <NSObject>
@optional

/// 激励视频加载成功
/// @param rewardVideoAd 激励视频实例
/// @param slotId 广告位ID
- (void)rewardVideoDidReceiveSuccess:(id)rewardVideoAd slotId:(NSString *)slotId;

/// 激励视频加载失败
- (void)rewardVideoLoadToFailed:(id)rewardVideoAd error:(NSError *)error;

/// 激励视频点击
- (void)rewardVideoDidClick:(id)rewardVideoAd;

/// 激励视频关闭
- (void)rewardVideoDidClose:(id)rewardVideoAd checkString:(NSString *)checkString;
//激励视频播放出错
- (void)rewardVideoPlayError:(id)rewardVideoAd error:(NSError *)error;
//激励视频播放结束
- (void)rewardVideoPlayEnd:(id)rewardVideoAd  checkString:(NSString *)checkString;
//激励视频开始播放
- (void)rewardVideoPlayStart:(id)rewardVideoAd;
//激励视频奖励
- (void)rewardVideoOnReward:(id)rewardVideoAd checkString:(NSString *)checkString;
@end


@interface OSETRewardVideoAd : NSObject
@property (nonatomic,weak) id <OSETRewardVideoAdDelegate> delegate;
@property(nonatomic,readonly,copy)NSString * slotId;

@property (nonatomic,copy)   NSString *userId;//userId 用户标识符show之前设置有效
@property (nonatomic,assign) BOOL check;//是否开启激励验证 （开启后可在rewardVideoOnReward之后 调用checkRerverWith方法验证）show之前设置有效
@property (nonatomic,assign) BOOL serverCheck;//是否开启服务端激励验证（开启后可在rewardVideoOnReward之后 通知服务端发放奖励）show之前设置有效

/// 激励视频初始化 服务端验证
/// @param slotId 广告位ID
/// @param check   是否需要 服务器校验
/// @param userId  用户id   （选择服务器接收验证 必须传入UserId）   （与 OSETManager configureLogsWithUid 不共用）
- (instancetype)initWithSlotId:(NSString *)slotId isServerCheck:(BOOL)check withUserId:(NSString *)userId;

/// 激励视频初始化  前端验证  请求接口（[NSString stringWithFormat:@"http://open-set-api.shenshiads.com/reward/check/%@",checkString]  GET请求）
/// @param slotId 广告位ID
/// @param check   是否需要参数校验
/// @param userId  用户id   可选   （与 OSETManager configureLogsWithUid 不共用）
- (instancetype)initWithSlotId:(NSString *)slotId isCheck:(BOOL)check withUserId:(NSString *)userId;
/// 激励视频初始化
/// @param slotId 广告位ID
/// @param check   是否需要参数校验
- (instancetype)initWithSlotId:(NSString *)slotId isCheck:(BOOL)check;
/// 激励视频初始化 （默认不验证）
/// @param slotId 广告位ID
- (instancetype)initWithSlotId:(NSString *)slotId;

/// 加载
- (void)loadAdData;
//广告是否有效，以下情况会返回NO，建议在展示广告之前判断
- (BOOL)adIsValid;
/// 显示
/// @param rootViewController 当前控制器
- (void)showFromRootViewController:(UIViewController *)rootViewController;

//checkString 将在OSETRewardVideoAd对象 loadAdData 后失效
- (void)checkRerverWith:(NSString *)checkString success:(void(^)(id responseObject))successful failure:(void(^)(NSError *error))failure;

@end

NS_ASSUME_NONNULL_END
