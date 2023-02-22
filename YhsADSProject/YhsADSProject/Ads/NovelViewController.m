//
//  NovelViewController.m
//  YhsADSProject
//
//  Created by Shens on 2021/3/23.
//  Copyright © 2021 熊俊. All rights reserved.
//

#import "NovelViewController.h"
#import "AppDelegate.h"
#import <OSETSDK/OSETSDK.h>

@interface NovelViewController ()//<OSETNovelAdDelegate>
//@property(nonatomic,strong)OSETNovelAd * novelAd;
@end

@implementation NovelViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"小说";
    //如果出现 初始化失败 -5的弹框 请把小说的初始化方法放在APPdelegate里 然后获取跳转
//    AppDelegate * appdelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
//    self.novelAd = appdelegate.novelAd;
    
    
// 如果出现 初始化失败 -2的弹框 是因为 APPdelegate 里的  applicationDidEnterBackground 函数被删除了 恢复就好  不需要做操作
//    self.novelAd = [[OSETNovelAd alloc] initWithYMID:8052 withAppUserId:@"111"];
//    self.novelAd.delegate = self;
//    [self.novelAd showFromRootViewController:self];
    
    self.textField.placeholder = @"点击shou显示广告";
    // Do any additional setup after loading the view.
}
-(void)showAd{
//    [self.novelAd showFromRootViewController:self];
//    自定义添加模式
//    UIViewController * vc = [self.novelAd OSETGetBookStoreWebviewController];
//    [self.navigationController pushViewController:vc animated:YES];
}
//SDK打开通知
-(void)OSETNovelSdkDidOpen{
    NSLog(@"打开小说");
}

//SDK关闭通知
-(void)OSETNovelSdkDidClose{
    NSLog(@"关闭小说");
}

//通知SVIP状态  初始化后或者用户使用过程中购买了svip，通过这个接口通知app
-(void)OSETNotifySVIPUser{
    NSLog(@"购买了svip");
}
@end
