//
//  RewardVideoViewController.m
//  YhsADSProject
//
//  Created by 熊俊 on 2019/11/8.
//  Copyright © 2019 熊俊. All rights reserved.
//

#import "RewardVideoViewController.h"
#import <OSETSDK/OSETSDK.h>

@interface RewardVideoViewController ()<OSETRewardVideoAdDelegate>

@property (nonatomic,strong) UIButton *playBtn;

@end

@implementation RewardVideoViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"激励视频";
    [self setupPlay];
    // 激励视频初始化
    self.rewardVideoAd = [[OSETRewardVideoAd alloc] initWithSlotId:self.slotId];
    self.rewardVideoAd.delegate = self;
    // Do any additional setup after loading the view from its nib.
}

- (void)setupPlay{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btn setTitle:@"播放视频" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    btn.frame = CGRectMake(0, 200, 100, 30);
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(preloadPlay) forControlEvents:UIControlEventTouchUpInside];
    self.playBtn = btn;
}

- (void)preloadPlay{
//    showFromRootViewController 一定要在 rewardVideoDidReceiveSuccess之后调用
//    每次loadAdData之后都要等回调rewardVideoDidReceiveSuccess走了才能showFromRootViewController
//    loadAdData 只是请求广告 但是并不播放   showFromRootViewController是播放视频
    [self.rewardVideoAd showFromRootViewController:self];
}

- (void)showAd{
    //可选是否校验  isCheck
    //校验可选是否使用userid  userId可传空字符串
    [self.rewardVideoAd loadAdData];
}

- (void)rewardVideoDidReceiveSuccess:(nonnull id)rewardVideoAd slotId:(nonnull NSString *)slotId {
    NSLog(@"加载成功");
    [self.playBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];

}

- (void)rewardVideoLoadToFailed:(nonnull id)rewardVideoAd error:(nonnull NSError *)error {
    NSLog(@"rewardVideoLoadToFailed加载失败%@",error);
}

- (void)rewardVideoDidClick:(nonnull id)rewardVideoAd {
    NSLog(@"点击");
}
/// 激励视频关闭
- (void)rewardVideoDidClose:(id)rewardVideoAd checkString:(NSString *)checkString{
    NSLog(@"关闭");
    [self.playBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
}
//激励视频播放结束
- (void)rewardVideoPlayEnd:(id)rewardVideoAd  checkString:(NSString *)checkString{
    NSLog(@"rewardVideoPlayEnd");

}
//激励视频开始播放
//- (void)rewardVideoPlayStart:(id)rewardVideoAd{
//    NSLog(@"激励视频开始播放");
//}
//激励视频奖励 //checkString 将在OSETRewardVideoAd对象 loadAdData 后失效
- (void)rewardVideoOnReward:(id)rewardVideoAd checkString:(NSString *)checkString{
    NSLog(@"rewardVideoOnReward");
//    [self.rewardVideoAd checkRerverWith:checkString success:^(id  _Nonnull responseObject) {
//        NSDictionary * dict = [NSDictionary dictionaryWithDictionary:responseObject];
//        if ([dict[@"code"] intValue] == 0) {
//            NSLog(@"Demo rewardVideoOnReward激励视频激励验证成功");
//        }else{
//            NSLog(@"DemorewardVideoOnReward OSET激励视频激励验证失败%@",responseObject);
//        }
//    } failure:^(NSError * _Nonnull error) {
//        NSLog(@"rewardVideoOnReward OSET激励视频激励验证失败%@",error);
//    }];
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
