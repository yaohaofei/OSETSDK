//
//  AppDelegate.m
//  YhsADSProject
//
//  Created by 熊俊 on 2019/10/29.
//  Copyright © 2019 熊俊. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "HomeTabBarViewController.h"
#import <OSETSDK/OSETSDK.h>

#import <AppTrackingTransparency/AppTrackingTransparency.h>
#import <AdSupport/AdSupport.h>
#import "GDTSDKConfig.h"
#import <WindSDK/WindSDK.h>
#import <KSAdSDK/KSAdSDK.h>
#import <BUAdSDK/BUAdSDK.h>
//#import "XMSDK.h"
//#import <AlipaySDK/AlipaySDK.h>

@interface AppDelegate ()<OSETSplashAdDelegate>

@property (nonatomic,strong) OSETSplashAd *splashAd;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window.rootViewController =[[HomeTabBarViewController alloc] init];
    [self.window makeKeyAndVisible];
    
//     SDK配置日志 用户唯一标识符 推荐设置 （和激励视频广告Userid 不共用） 此userid 仅用于日志， 激励视频userid 仅用作激励视频回调
    [OSETManager configureLogsWithUid:@"DemoTsetUserId"];
//    SDK初始化 appKey
    [OSETManager configure:@"5AA7709E9F38B230"];
//    打开日志模式
    [OSETManager openDebugLog];
    
    NSLog(@"OSETSDKVersion %@ = ",[OSETManager version]);
    NSString *idfa = [[ASIdentifierManager sharedManager].advertisingIdentifier UUIDString];
    NSLog(@"%@",idfa);
    UIImageView *imageView = [UIImageView new];
    imageView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 100);
    imageView.image = [UIImage imageNamed:@"logo"];
    imageView.contentMode = UIViewContentModeCenter;
    imageView.backgroundColor = [UIColor whiteColor];
    self.splashAd = [[OSETSplashAd alloc] initWithSlotId:@"7B1DB0A0A7191FEFB4B0E59881A09041"
                                        window:self.window
                                              bottomView:imageView];
    self.splashAd.delegate = self;
    [self.splashAd loadAdDataAndShow];
    self.window.backgroundColor = [UIColor redColor];
    NSLog(@"KSAdSDK %@ = ",[KSAdSDKManager SDKVersion]);
    NSLog(@"WindSDK %@ = ",[WindAds sdkVersion]);
    NSLog(@"GDTAdSDK %@ = ",[GDTSDKConfig sdkVersion]);
    NSLog(@"BUAdSDK %@ = ",[BUAdSDKManager SDKVersion]);
    return YES;
}

- (void)splashDidReceiveSuccess:(id)splashAd slotId:(NSString *)slotId{
    NSLog(@"load success");
}

- (void)splashLoadToFailed:(id)splashAd error:(NSError *)error{
    NSLog(@"load failed %@",error);
}

- (void)splashDidClick:(id)splashAd{
    NSLog(@"click");
}

- (void)splashDidClose:(id)splashAd{
    NSLog(@"close");
}
- (void)splashWillClose:(id)splashAd{
    NSLog(@"splashWillClose");
//    self.window.rootViewController = [[UINavigationController alloc] initWithRootViewController:[ViewController new]];
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    
    //适配ios15  ios15获取广告追踪权限要写在applicationDidBecomeActive 否则ios15 不弹框可能会被拒
    if (@available(iOS 14, *)) {
        [ATTrackingManager requestTrackingAuthorizationWithCompletionHandler:^(ATTrackingManagerAuthorizationStatus status) {
            // Tracking authorization completed. Start loading ads here.
        }];
    } else {
        // Fallback on earlier versions
    }
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.

}

//
//- (BOOL)application:(UIApplication *)application
//            openURL:(NSURL *)url
//  sourceApplication:(NSString *)sourceApplication
//         annotation:(id)annotation {
//    if ([url.host isEqualToString:@"safepay"]) {
//        //跳转支付宝钱包进行支付，处理支付结果
//        [[AlipaySDK defaultService] processOrderWithPaymentResult:url standbyCallback:nil];
//    }
//    return YES;
//}
//// NOTE: 9.0以后使用新API接口
- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<NSString*, id> *)options
{
    if ([url.host isEqualToString:@"OSETDemo"]) {
        NSLog(@"认证返回app");
        //跳转支付宝钱包进行支付，处理支付结果
//        [[AlipaySDK defaultService] processOrderWithPaymentResult:url standbyCallback:nil];
    }
    return YES;
}
@end
