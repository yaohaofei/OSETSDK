//
//  ContentSmallViewController.m
//  YhsADSProject
//
//  Created by 熊俊 on 2020/7/15.
//  Copyright © 2020 熊俊. All rights reserved.
//

#import "ContentSmallViewController.h"
#import <OSETSDK/OSETSDK.h>
#import <KSAdSDK/KSCUEntryElement.h>

@interface ContentSmallViewController ()

@property (nonatomic,strong) OSETFullContentAd *contentAd;

@end

@implementation ContentSmallViewController
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
}
-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
//    [self.navigationController setNavigationBarHidden:NO animated:YES];
    [self.navigationController.navigationBar setHidden:NO];

}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.contentAd = [[OSETFullContentAd alloc] initWithSlotId:@"908FD9663CDD3817B3F0F22B2DCA0277" type:OSETContentTypeFeed rootViewController:self];

    // Do any additional setup after loading the view.
}

- (void)showAd{
    [self.contentAd loadAdDataComplete:^(id _Nonnull result, BOOL isSuccess) {
            if (isSuccess) {
                if ([result isKindOfClass:[KSCUEntryElement class]]) {
                    KSCUEntryElement *element = (KSCUEntryElement *)result;
                    UIView *view = element.entryView;
                    CGRect frame = view.frame;
                    frame.origin = CGPointMake(0, 88);
                    view.frame = frame;
                    [self.view addSubview:view];
                }

            } else {
                NSLog(@"加载失败");
            }
    } watchCallback:^{
        
    }];
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
