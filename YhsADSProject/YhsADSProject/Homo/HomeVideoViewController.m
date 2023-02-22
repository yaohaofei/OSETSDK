//
//  HomeVideoViewController.m
//  YhsADSProject
//
//  Created by Shens on 2021/3/22.
//  Copyright © 2021 熊俊. All rights reserved.
//

#import "HomeVideoViewController.h"
#import "ExampleViewController.h"
#import <OSETSDK/OSETSDK.h>
//#import <KSAdSDK/KSAdSDK.h>
#import <KSAdSDK/KSCUContentPage.h>
//#import <KSAdSDK/KSCUEntryElement.h>

@interface HomeVideoViewController ()<OSETFullContentAdDelegate,UIScrollViewDelegate>

@property (nonatomic,strong) OSETFullContentAd *contentAd;
@property (nonatomic,strong) KSCUContentPage *contentEcology;

@property (nonatomic,strong) UIViewController *vc;

@end

@implementation HomeVideoViewController
-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    NSLog(@"viewDidDisappear");
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    NSLog(@"viewWillDisappear");
}
-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    NSLog(@"viewDidAppear");
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.contentAd = [[OSETFullContentAd alloc] initWithSlotId:@"B39A857D51D32ED3DD0DD230A3F2A7E0" type:OSETContentTypeFullscreen rootViewController:self];
    NSLog(@"请求广告");
    [self.contentAd loadAdDataComplete:^(id _Nonnull result, BOOL isSuccess) {
        if (isSuccess) {
                NSLog(@"加载成功");
                //通过pageVC添加 样式仅供参考 可自定义UIPageViewController实现
                self.vc = (UIViewController *)self.contentAd.fullscreenAdVC;
                [self addChildViewController:self.vc];
                UIWindow *window = UIApplication.sharedApplication.keyWindow;
            if (@available(iOS 11.0, *)) {
                CGFloat bottomPadding = window.safeAreaInsets.bottom;
                self.vc.view.frame =CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width , [UIScreen mainScreen].bounds.size.height - 49-bottomPadding);
            } else {
                // Fallback on earlier versions
            }
                [self.view addSubview:self.vc.view];
            NSLog(@"添加成功");
                [self.contentAd setBackHidden:YES];
        }else{
            NSError *error = (NSError *)result;
            NSLog(@"%@",error);
        }
    }watchCallback:^{
        
    }];
    self.contentAd.delegate = self;
    // Do any additional setup after loading the view.
}
/**
 * 视频开始播放
 * @param videoContent 内容模型
 */
- (void)videoDidStartPlay:(id<KSCUContentInfo>)videoContent withIsAd:(BOOL)isAd{

    NSLog(@"");
    if (isAd) {
        NSLog(@"播放广告%@",videoContent);
    }else{
        NSLog(@"播放视频");
    }
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
- (void)videoDidEndPlay:(id<KSCUContentInfo>)videoContent isFinished:(BOOL)finished{
 
    NSLog(@"videoDidEndPlay%@",videoContent.publicContentId);
}
/**
* 视频播放失败
* @param videoContent 内容模型
* @param error        失败原因
*/
- (void)videoDidFailedToPlay:(id<KSCUContentInfo>)videoContent withError:(NSError *)error{
    NSLog(@"videoDidFailedToPlay%@",videoContent.publicContentId);
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
