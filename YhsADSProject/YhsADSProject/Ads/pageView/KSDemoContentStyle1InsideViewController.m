//
//  KSDemoContentStyle1InsideViewController.m
//  KSAdSDKGitDemo
//
//  Created by zangmina on 2020/1/21.
//  Copyright © 2020 xuzhijun. All rights reserved.
//

#import "KSDemoContentStyle1InsideViewController.h"
#import "KSAdTestCustomerView.h"
#import <KSAdSDK/KSAdSDK.h>
#import "KSADRewardManager.h"

@interface KSDemoContentStyle1InsideViewController ()<KSCUEmbedAdDataSource>

@property (nonatomic, strong) KSCUContentPage *contentEcology;
@property (nonatomic, strong) KSADRewardManager *rewardManager;
@property (nonatomic, assign) CGFloat topOffsetY;
@property (nonatomic, strong) NSMutableArray *nums;


@end

@implementation KSDemoContentStyle1InsideViewController

- (void)dealloc {
    NSLog(@"dealloc");
}

- (instancetype)initWithTopOffset:(CGFloat)topOffset {
    self = [super init];
    if (self) {
        self.topOffsetY = topOffset;
    }
    
    return self;
}
/// 内容列表样式5
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.edgesForExtendedLayout = UIRectEdgeTop;
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.rewardManager = [KSADRewardManager instance];
    [self.rewardManager showDebugConsole:YES];
    // test-ios-sdk
    // 配置SDK  -  
    NSString *posId = @"90010005";
    self.contentEcology = [[KSCUContentPage alloc] initWithPosId:posId];
    if (self.openEmbedAds) {
        self.nums = [[NSMutableArray alloc] init];
        self.contentEcology.embedAdConfig.allowInsertThirdAd = YES;
        self.contentEcology.embedAdConfig.dataSource = self;
    }
    self.contentEcology.stateDelegate = self.rewardManager;
    self.contentEcology.videoStateDelegate = self.rewardManager;
    UIViewController *vc = self.contentEcology.viewController;
    
    vc.view.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, CGRectGetHeight(self.view.frame) - self.topOffsetY);
    [self addChildViewController:vc];
    [self.view addSubview:vc.view];
    
    UIButton *refreshButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [refreshButton setFrame:CGRectMake(0, 100, 60, 40)];
    [refreshButton setBackgroundColor:[UIColor redColor]];
    [refreshButton setTitle:@"刷新" forState:UIControlStateNormal];
    [refreshButton addTarget:self action:@selector(refreshVideo) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:refreshButton];
}

- (void)refreshVideo {
    [self.contentEcology tryToRefresh];
}

#pragma mark -- KSCUEmbedAdDataSource

- (void)embedAdConfig:(KSCUEmbedAdConfig *)embedAdConfig willBeginRuqest:(KSCUEmbedAdsRequest *)requestAds {
    NSLog(@"embedAdConfig-----请求:%@----请求次数--%@",@(requestAds.lastRequestAdCount),@(requestAds.requestCount));
    if (!requestAds.isLoadMore) {
        [self.nums removeAllObjects];
        for (NSInteger i = 0; i < requestAds.lastRequestAdCount; i++) {
            [self.nums addObject:@(0)];
        }
    }
    
}

- (void)embedAdConfig:(KSCUEmbedAdConfig *)embedAdConfig didEndRuqest:(KSCUEmbedAdsRequest *)requestAds error:(NSError *)error {
     NSLog(@"embedAdConfig-----请求:%@----请求次数--%@---error -%@",@(requestAds.lastRequestAdCount),@(requestAds.requestCount),error);
    if (error == nil) {
        self.title = [NSString stringWithFormat:@"Custom 成功请求 %@",@(requestAds.requestCount)];
    }
    for (NSInteger i = 0; i < requestAds.lastRequestAdCount; i++) {
        [self.nums addObject:@(0)];
    }
}

- (id<KSCUEmbedAdProtocol>)embedAdConfig:(KSCUEmbedAdConfig *)embedAdConfig adAtIndex:(NSInteger)index {
    if (index < self.nums.count) {
         KSAdTestCustomerView *view = [[KSAdTestCustomerView alloc] init];
         view.countLabel.text = [NSString stringWithFormat:@"外置广告数累计-%@---随机数:%@",@(index),@([NSDate date].timeIntervalSince1970 * 1000)];
        view.backgroundColor = [UIColor greenColor];
        return view;
    }
    return nil;
   
}

- (BOOL)shouldAutorotate {
    return NO;
}

@end
