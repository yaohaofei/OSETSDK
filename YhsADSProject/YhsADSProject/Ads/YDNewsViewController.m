//
//  YDNewsViewController.m
//  YhsADSProject
//
//  Created by Shens on 2021/6/16.
//  Copyright © 2021 熊俊. All rights reserved.
//

#import "YDNewsViewController.h"
#import <OSETSDK/OSETSDK.h>
@interface YDNewsViewController ()<OSETYDConsultDelegate>
@property (nonatomic,strong) OSETYDConsult *consultAd;

@end

@implementation YDNewsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    

    self.consultAd = [[OSETYDConsult alloc] initWithSlotId:@"3DC02F7040314936B50936F5FD21D577"//资讯广告位id
                                                timeLength:0
                                               withIsShare:YES//是否支持分享
                                    withInterstitialSlotId:@"4FD8476AE54A3DBA39CCD635BBD48957"//详情页插屏广告 （可选）
                                          withBannerSlotId:@"58A0BB27A707FD48ECACF89B0E8A9657"];//详情页banner广告  （可选）
    self.consultAd.delegate = self;
}
-(void)OSETYDConsultLoadToFailed:(NSString *)slotId error:(NSError *)error{
    NSLog(@"OSETYDConsultLoadToFailed========%@",error);
}
///  分享回调
- (void)OSETYDConsultShareWithTitle:(NSString *)title withUrl:(NSString *)url withImageUrl:(NSString *)imageUrl withContext:(NSString *)context{
    NSLog(@"OSETYDConsultShareWithTitle========title = %@\n url = %@\n imageUrl = %@\n context = %@",title,url,imageUrl,context);
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (void)showAd {
    [self.consultAd showFromRootViewController:self watchCallback:^{
        NSLog(@"showFromRootViewControllerwatchCallback");
    }];
}
@end

