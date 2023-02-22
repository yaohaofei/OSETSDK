//
//  ConstellatoryViewController.m
//  YhsADSProject
//
//  Created by Shens on 2021/2/23.
//  Copyright © 2021 熊俊. All rights reserved.
//

#import "ConstellatoryViewController.h"
#import <OSETSDK/OSETConstellatoryAd.h>

@interface ConstellatoryViewController ()<OSETConstellatoryAdDelegate>
@property(nonatomic,strong)OSETConstellatoryAd * constellatoryAd;
@end

@implementation ConstellatoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"星座运势";
    self.constellatoryAd = [[OSETConstellatoryAd alloc] initWithRewardVideoSlotId:@"971D11E82E1009B5CAA2D00EFBC4E372"
                                                           withInterstitialSlotId:@"B8E8DD447385EA743BC21F5CA4E5D1B5"
                                                                 withBannerSlotId:@"58A0BB27A707FD48ECACF89B0E8A9657"];
    
    self.constellatoryAd.delegate = self;
    [self.constellatoryAd showFromRootViewController:self];
    // Do any additional setup after loading the view.
}
/// 激励视频关闭
- (void)OSETConstellatoryRewardVideoDidClose:(id)rewardVideoAd checkString:(NSString *)checkString{
    NSLog(@"ConstellatoryViewController --- rewardVideoDidClose ");
}
-(void)showAd{
    [self.constellatoryAd showFromRootViewController:self];
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
