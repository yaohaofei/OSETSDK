//
//  ContentFullscreenViewController.m
//  YhsADSProject
//
//  Created by 熊俊 on 2020/7/15.
//  Copyright © 2020 熊俊. All rights reserved.
//

#import "ContentFullscreenViewController.h"
#import <OSETSDK/OSETSDK.h>
@interface ContentFullscreenViewController ()<OSETFullContentAdDelegate>

@property (nonatomic,strong) OSETFullContentAd *contentAd;

@property (nonatomic,strong) UIViewController *vc;

@end

@implementation ContentFullscreenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"内容广告";
    
    self.contentAd = [[OSETFullContentAd alloc] initWithSlotId:@"B39A857D51D32ED3DD0DD230A3F2A7E0"
                                                          type:OSETContentTypeFullscreen
                                            rootViewController:self];
    [self.contentAd loadAdDataComplete:^(id _Nonnull result, BOOL isSuccess) {
        if (isSuccess) {

        }else{
            NSError *error = (NSError *)result;
            NSLog(@"%@",error);
        }
    } watchCallback:^{
        
    }];
    self.contentAd.delegate = self;
    
    // Do any additional setup after loading the view.
}

-(void)viewWillAppear:(BOOL)animated{
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}
- (void)showAd{
    [self.contentAd showFromRootViewController:self];
    [self.contentAd setNavBarHidden:NO animated:YES];
}
/**
 * 视频开始播放
 * @param videoContent 内容模型
 */
- (void)videoDidStartPlay:(id)videoContent withIsAd:(BOOL)isAd{
    NSLog(@"videoDidStartPlay");
}
/**
* 视频暂停播放
* @param videoContent 内容模型
*/
- (void)videoDidPause:(id)videoContent{
    NSLog(@"videoDidPause");
}
/**
* 视频恢复播放
* @param videoContent 内容模型
*/
- (void)videoDidResume:(id)videoContent{
    NSLog(@"videoDidResume");
}
/**
* 视频停止播放
* @param videoContent 内容模型
* @param finished     是否播放完成
*/
- (void)videoDidEndPlay:(id)videoContent isFinished:(BOOL)finished{
    NSLog(@"videoDidEndPlay");
}
/**
* 视频播放失败
* @param videoContent 内容模型
* @param error        失败原因
*/
- (void)videoDidFailedToPlay:(id)videoContent withError:(NSError *)error{
    NSLog(@"videoDidFailedToPlay");
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
