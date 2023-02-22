//
//  CorrespondenceAdViewController.m
//  YhsADSProject
//
//  Created by Shens on 2021/10/28.
//  Copyright © 2021 熊俊. All rights reserved.
//

#import "CorrespondenceAdViewController.h"

@interface CorrespondenceAdViewController ()
@property (nonatomic,strong)  OSETCorrespondenceAd* correspondenceAd;
@end

@implementation CorrespondenceAdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    /*
     
     话费充值对接
     
     AppDelegate 导入头文件
     #import <AlipaySDK/AlipaySDK.h>
     
     实现 以下两个方法
     - (BOOL)application:(UIApplication *)application
                 openURL:(NSURL *)url
       sourceApplication:(NSString *)sourceApplication
              annotation:(id)annotation {
         if ([url.host isEqualToString:@"safepay"]) {
             //跳转支付宝钱包进行支付，处理支付结果
             [[AlipaySDK defaultService] processOrderWithPaymentResult:url standbyCallback:nil];
         }
         return YES;
     }
     // NOTE: 9.0以后使用新API接口
     - (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<NSString*, id> *)options
     {
         if ([url.host isEqualToString:@"safepay"]) {
             //跳转支付宝钱包进行支付，处理支付结果
             [[AlipaySDK defaultService] processOrderWithPaymentResult:url standbyCallback:nil];
         }
         return YES;
     }
     
     AppScheme 支付宝跳转会APP需要  在Info.plist配置
     */
    self.correspondenceAd = [[OSETCorrespondenceAd alloc] initWithAppUserId:@"123" withAppScheme:@"OSETDemo"];
    [self.correspondenceAd showFromRootViewController:self];
    // Do any additional setup after loading the view.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
