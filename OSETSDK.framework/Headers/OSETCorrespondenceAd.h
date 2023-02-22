//
//  OSETCorrespondenceAd.h
//  OSETSDK
//
//  Created by Shens on 2021/10/9.
//  Copyright © 2021 熊俊. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface OSETCorrespondenceAd : NSObject

//app用户id 在调用show方法之前设置有效
@property (nonatomic,copy)   NSString *appUserId;
//此app用来跳转的Scheme  info.plist里配置的URL Schemes
@property (nonatomic,copy)   NSString *appScheme;
/// 初始化方法
/// @param appUserId app用户id
- (instancetype)initWithAppUserId:(NSString *)appUserId
                    withAppScheme:(NSString *)appScheme;
//显示激励视频面
- (void)showFromRootViewController:(UIViewController *)rootViewController;
//获取广告VC 可以自己通过addChildViewController:等方式添加在自己的VC上 以达到自定义导航栏等功能
- (UIViewController *)OSETGetViewController;
@end

NS_ASSUME_NONNULL_END
