//
//  OSETSuspendAd.h
//  YhsADSProject
//
//  Created by Shens on 2021/7/22.
//  Copyright © 2021 熊俊. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@protocol OSETSuspendAdDelegate <NSObject>
@optional

/// banner加载成功
/// @param suspendView  suspendView实例
/// @param slotId 广告位ID
- (void)suspendDidReceiveSuccess:(UIView *)suspendView slotId:(NSString *)slotId;

/// banner加载失败
- (void)suspendLoadToFailed:(id)suspendAd error:(NSError *)error;

/// banner点击
- (void)suspendDidClick:(id)suspendAd;

@end



@interface OSETSuspendAd : NSObject

@property (nonatomic,weak) id <OSETSuspendAdDelegate> delegate;
@property (nonatomic,strong) UIView  * suspendView;
- (instancetype)initWithSlotId:(NSString *)slotId;

-(void)loadData;

@end

NS_ASSUME_NONNULL_END
