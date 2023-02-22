//
//  BaseViewController.h
//  YhsADSProject
//
//  Created by 熊俊 on 2019/11/8.
//  Copyright © 2019 熊俊. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <OSETSDK/OSETSDK.h>


NS_ASSUME_NONNULL_BEGIN

@interface BaseViewController : UIViewController

@property (nonatomic,strong) UILabel *adLab;
@property (nonatomic,strong) UITextField *textField;
@property (nonatomic,strong) UIButton *showBtn;

@property (nonatomic,strong) NSString *slotId;

@property (nonatomic,strong) OSETBannerAd *bannerAd;

@property (nonatomic,strong) OSETSplashAd *splashAd;

@property (nonatomic,strong) OSETInterstitialAd *interstitialAd;

@property (nonatomic,strong) OSETRewardVideoAd *rewardVideoAd;

@property (nonatomic,strong) OSETFullscreenVideoAd *fullscreenVideoAd;

- (void)showAd;

@end

NS_ASSUME_NONNULL_END
