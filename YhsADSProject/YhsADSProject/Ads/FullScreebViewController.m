//
//  FullScreebViewController.m
//  YhsADSProject
//
//  Created by 熊俊 on 2019/11/8.
//  Copyright © 2019 熊俊. All rights reserved.
//

#import "FullScreebViewController.h"

@interface FullScreebViewController ()<OSETFullscreenVideoAdDelegate>

@property (nonatomic,strong) UIButton *playBtn;

@end

@implementation FullScreebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"全屏视频";
    
    [self setupPlay];
    // Do any additional setup after loading the view.
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
    [self.fullscreenVideoAd showFromRootViewController:self];
}

- (void)showAd{
    self.fullscreenVideoAd = [[OSETFullscreenVideoAd alloc] initWithSlotId:self.slotId];
    self.fullscreenVideoAd.delegate = self;
    [self.fullscreenVideoAd loadAdData];
}

- (void)fullscreenVideoDidReceiveSuccess:(nonnull id)fullscreenVideoAd slotId:(nonnull NSString *)slotId {
    
    NSLog(@"加载成功");
    [self.playBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
}

- (void)fullscreenVideoLoadToFailed:(nonnull id)fullscreenVideoAd error:(nonnull NSError *)error {
    NSLog(@"加载失败%@",error);
}

- (void)fullscreenVideoDidClick:(nonnull id)fullscreenVideoAd {
    NSLog(@"点击");
}

- (void)fullscreenVideoDidClose:(nonnull id)fullscreenVideoAd {
    NSLog(@"关闭");
    [self.playBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
}
- (void)fulllscreenVideoPlayEnd:(id)fullscreenVideoAd{
    NSLog(@"全屏视频结束播放");
}
- (void)fulllscreenVideoPlayStart:(id)fullscreenVideoAd{
    NSLog(@"全屏视频开始播放");
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
