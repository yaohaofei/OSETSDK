//
//  LuckyDrawViewController.m
//  OSETDemo
//
//  Created by Shens on 2021/1/8.
//

#import "LuckyDrawViewController.h"
#import <OSETSDK/OSETDialAd.h>
#import <OSETSDK/OSETCorrespondenceAd.h>

@interface LuckyDrawViewController ()<OSETDialAdDelegate>
@property (nonatomic,strong) OSETDialAd *consultAd;
@property (nonatomic,strong) OSETCorrespondenceAd *correspondenceAd;

@end

@implementation LuckyDrawViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"幸运抽奖";
    self.consultAd = [[OSETDialAd alloc] initWithRewardVideoSlotId:@"971D11E82E1009B5CAA2D00EFBC4E372"
                                            withInterstitialSlotId:@"4FD8476AE54A3DBA39CCD635BBD48957"
                                                  withBannerSlotId:@"58A0BB27A707FD48ECACF89B0E8A9657"
                                                    withAwardsName:@"大大大奖"
                                                    withAwardsOdds:30//中大奖的概率
                                                   withDefaultName:@"小小小奖"
                                                    withLotteryNum:1
                                                 withLotteryMaxNum:3];
    self.consultAd.delegate = self;
    [self.consultAd showFromRootViewController:self];
    //或者addChildViewController 添加到自己的VC上
//    UIViewController * vc = [self.consultAd OSETGetViewController];
//    [self addChildViewController:vc];
//    vc.view.frame = CGRectMake(0, -88, self.view.frame.size.width, self.view.frame.size.height);
//    [self.view addSubview:vc.view];


    // Do any additional setup after loading the view.
}
-(void)showAd{
}

-(void)OSETDialAwardsCompleteWithIsAwards:(BOOL)isAwards{
    if (isAwards) {
        NSLog(@"LuckyDrawViewController -- 中了Awards奖项");
    }else{
        NSLog(@"LuckyDrawViewController -- 中了Default奖项");
    }
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
