//
//  VoiceVerificationViewController.m
//  YhsADSProject
//
//  Created by Shens on 2022/7/14.
//  Copyright © 2022 熊俊. All rights reserved.
//

#import "VoiceVerificationViewController.h"

@interface VoiceVerificationViewController ()//<OSETVoiceVerifyDelegate>
//@property(nonatomic,strong)OSETVoiceVerify * vv;
@end

@implementation VoiceVerificationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //Appkey 请联系运营人员进行配置获取
//    OSETVoiceVerify * vv = [[OSETVoiceVerify alloc]initWithAppkey:@"Appkey" withWindow:[UIApplication sharedApplication].delegate.window withAppUserId:@"APP用户ID或其他参数"];
//    vv.delegate =self;
//    self.vv = vv;
    // Do any additional setup after loading the view.
}
-(void)showAd{
//    [self.vv showVoiceVerify];
}
-(void)dealloc{
//    [self.vv removeVoiceVerify];
}
-(void)OSETVoiceVerifyLoadFail:(NSError *)error{
    NSLog(@"OSETVoiceVerifyLoadFail = %@",error);
}
// 10004  次数不足
// 10005。超过app每日验证上限

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
