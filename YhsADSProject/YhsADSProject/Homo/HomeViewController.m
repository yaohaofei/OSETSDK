//
//  HomeViewController.m
//  YhsADSProject
//
//  Created by Shens on 2021/3/22.
//  Copyright © 2021 熊俊. All rights reserved.
//

#import "HomeViewController.h"
#import "HomeCollectionViewCell.h"
#import "HomeCollectionReusableHeaderView.h"

#import "RewardVideoViewController.h"
#import "InsertViewController.h"
#import "BannerViewController.h"
#import "SplashViewController.h"
#import "FullScreebViewController.h"
#import "NativeViewController.h"
#import "DrawNativeViewController.h"
#import "ContentFullscreenViewController.h"
#import "ContentSmallViewController.h"
#import "NewsViewController.h"
#import "YDNewsViewController.h"
#import "ConstellatoryViewController.h"
#import "LuckyDrawViewController.h"
#import "OSETIntegralWallViewController.h"
#import "LootTreasureViewController.h"
#import "WeChatReadViewController.h"
#import "WebDialViewController.h"
#import "CrazyDreamViewController.h"
#import "CalendarViewController.h"
#import "WeatherViewController.h"
#import "AnswerAdViewController.h"
#import "CorrespondenceAdViewController.h"
#import "VoiceVerificationViewController.h"
#import "XMAdViewController.h"
#import <OSLog/OSLog.h>
//#import "webViewController.h"

#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
//.获取屏幕宽度与高度
#define OSET_SCREEN_WIDTH   [UIScreen mainScreen].bounds.size.width
#define OSET_SCREENH_HEIGHT [UIScreen mainScreen].bounds.size.height
//根据设计稿尺寸的 快捷系数
#define OSET_SSSW(R) (R)*(OSET_SCREEN_WIDTH)/375.0
#define OSET_SSSH(R) (R)*(OSET_SCREEN_WIDTH)/375.0

@interface HomeViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,OSETSuspendAdDelegate>
@property(nonatomic,strong)UICollectionView * collectionView;
@property(nonatomic,strong)NSArray * data;
@property (nonatomic,strong) OSETSuspendAd * suspendAd;

@end

@implementation HomeViewController
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"首页";
    self.view.backgroundColor = [UIColor redColor];
    [self.view addSubview:[[UIView alloc]init]];
    self.navigationController.navigationBar.translucent=NO;
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    self.navigationItem.title= @"AdSet Demo";
    [self initCollectionView];
    // Do any additional setup after loading the view.
    self.suspendAd = [[OSETSuspendAd alloc] initWithSlotId:@"5172584995BB18D05EAB3876E0B70015"];
    self.suspendAd.delegate = self;
//    [self.suspendAd loadData];
}
- (void)suspendDidReceiveSuccess:(UIView *)suspendView slotId:(NSString *)slotId{
    suspendView.frame = CGRectMake(50, 500, 60, 60);
    [self.view addSubview:suspendView];
}
- (void)suspendLoadToFailed:(id)suspendAd error:(NSError *)error{
    NSLog(@"suspendLoadToFailed %@",error);
}

- (void)suspendDidClick:(id)suspendAd{
    NSLog(@"suspendDidClick");

}
#pragma mark  设置CollectionView的的参数
- (void) initCollectionView
{
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    //设置CollectionView的属性
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, OSET_SCREEN_WIDTH, OSET_SCREENH_HEIGHT - [[UIApplication sharedApplication] statusBarFrame].size.height-49) collectionViewLayout:flowLayout];
    self.collectionView.backgroundColor = [UIColor whiteColor];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    self.collectionView.scrollEnabled = YES;
    [self.view addSubview:self.collectionView];
    //注册Cell
    [self.collectionView registerClass:[HomeCollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    [self.collectionView registerClass:[HomeCollectionReusableHeaderView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HomeCollectionReusableHeaderView"];
}
-(NSArray *)data{
    if (!_data) {
        _data = @[@{@"title":@"广告对接",@"data":@[@{@"title":@"Banner广告",@"color":@"#00B767",@"imageName":@"banner"},
//                                               @{@"title":@"身份认证",@"color":@"#FF9E00",@"imageName":@"kaiping"},
                                               @{@"title":@"开屏广告",@"color":@"#FF9E00",@"imageName":@"kaiping"},
                                               @{@"title":@"插屏广告",@"color":@"#FF6D00",@"imageName":@"danchuangxuanze"},
                                               @{@"title":@"全屏视频",@"color":@"#368DFF",@"imageName":@"quanping"},
                                               @{@"title":@"激励视频",@"color":@"#8F48FF",@"imageName":@"jili"},
                                               @{@"title":@"原生信息流",@"color":@"#B27D5D",@"imageName":@"yuansheng"},
                                               @{@"title":@"Draw信息流",@"color":@"#FF4B4A",@"imageName":@"Draw"}]},
        @{@"title":@"内容对接",@"data":@[@{@"title":@"资讯内容",@"color":@"#FF6B99",@"imageName":@"zixun"},
//                                     @{@"title":@"一点资讯",@"color":@"#67AFE8",@"imageName":@"zixun"},
//                                     @{@"title":@"小说内容",@"color":@"#7D4130",@"imageName":@"duxiaoshuo"},
                                     @{@"title":@"短视频内容",@"color":@"#454EDC",@"imageName":@"shipinneirong"},
                                     @{@"title":@"短视频Small",@"color":@"#7D4130",@"imageName":@"shipinneirong"},
                                     @{@"title":@"转盘抽奖",@"color":@"#67AFE8",@"imageName":@"zhuanpanshezhi"},
                                     @{@"title":@"Web转盘",@"color":@"#67AFE8",@"imageName":@"zhuanpanshezhi"},
                                     @{@"title":@"十二星座",@"color":@"#00BA93",@"imageName":@"xingzuo"},
                                     @{@"title":@"视频夺宝",@"color":@"#E86767",@"imageName":@"duobao"},
//                                     @{@"title":@"游戏试玩",@"color":@"#454EDC",@"imageName":@"youxi"},
                                     @{@"title":@"微信阅读",@"color":@"#38BE6F",@"imageName":@"weixin"},
                                     @{@"title":@"任务墙",@"color":@"#787A8C",@"imageName":@"renwuqiang"},
                                     @{@"title":@"周公解梦",@"color":@"#8F48FF",@"imageName":@"youxi"},
                                     @{@"title":@"黄历",@"color":@"#FF6D00",@"imageName":@"youxi"},
                                     @{@"title":@"天气",@"color":@"#4662EA",@"imageName":@"tianqi"},
                                     @{@"title":@"答题",@"color":@"#C82C15",@"imageName":@"dati"},
//                                     @{@"title":@"话费",@"color":@"#C82C15",@"imageName":@"dati"},
                                     @{@"title":@"喜马拉雅",@"color":@"#4662EA",@"imageName":@"tianqi"},
                                     @{@"title":@"语音验证",@"color":@"#C82C15",@"imageName":@"dati"}
        ]}];
    }
    return  _data;
}
#pragma mark  设置CollectionView的组数
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return self.data.count;
}

#pragma mark  设置CollectionView每组所包含的个数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    NSArray * array = self.data[section][@"data"];
    return array.count;
    
}

#pragma mark  设置CollectionCell的内容
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identify = @"cell";
    HomeCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identify forIndexPath:indexPath];
    NSArray * array = self.data[indexPath.section][@"data"];
//    cell.backgroundColor = [self colorWithHexString:array[indexPath.row][@"color"]];
    [cell fillCellWithIndexPath:indexPath withDataDict:array[indexPath.row]];
    return cell;
}



#pragma mark  定义每个UICollectionView的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return  CGSizeMake(self.view.frame.size.width/2,OSET_SSSH(68));
}



#pragma mark  定义整个CollectionViewCell与整个View的间距
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0, 0, 0, 0);//（上、左、下、右）
}


#pragma mark  定义每个UICollectionView的横向间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 0;
}

#pragma mark  定义每个UICollectionView的纵向间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 0;
}

#pragma mark  点击CollectionView触发事件
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSString * string = self.data[indexPath.section][@"data"][indexPath.row][@"title"];
    NSLog(@"---------------------%@",string);
    
    BaseViewController *showADVC = nil;
    NativeViewController *nativeVC = nil;
    DrawNativeViewController *drawNativeVC = nil;

    if ([string isEqualToString:@"激励视频"]) {
        showADVC = [[RewardVideoViewController alloc] init];
        showADVC.slotId = @"971D11E82E1009B5CAA2D00EFBC4E372";
    }else if ([string isEqualToString:@"插屏广告"]) {
        showADVC = [[InsertViewController alloc] init];
        showADVC.slotId = @"4FD8476AE54A3DBA39CCD635BBD48957";
    }else if ([string isEqualToString:@"Banner广告"]) {
        showADVC = [[BannerViewController alloc] init];
        showADVC.slotId = @"58A0BB27A707FD48ECACF89B0E8A9657";
    }else if ([string isEqualToString:@"开屏广告"]) {
        showADVC = [[SplashViewController alloc] init];
        showADVC.slotId = @"7B1DB0A0A7191FEFB4B0E59881A09041";
    }else if ([string isEqualToString:@"全屏视频"]) {
        showADVC = [[FullScreebViewController alloc] init];
        showADVC.slotId = @"1E2A37E7BD27790D9615323944FCE4DB";
    }else if ([string isEqualToString:@"原生信息流"]) {
        nativeVC = [NativeViewController new];
    }else if ([string isEqualToString:@"Draw信息流"]) {
        drawNativeVC = [DrawNativeViewController new];//
    }else if ([string isEqualToString:@"资讯内容"]) {
        NewsViewController *newsVC = [NewsViewController new];
        newsVC.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:newsVC animated:YES];
    }
//    else if ([string isEqualToString:@"一点资讯"]) {
//        YDNewsViewController *newsVC = [YDNewsViewController new];
//        newsVC.hidesBottomBarWhenPushed = YES;
//        [self.navigationController pushViewController:newsVC animated:YES];
//    }
    else if ([string isEqualToString:@"短视频内容"]) {
        ContentFullscreenViewController *contentVC = [ContentFullscreenViewController new];
        contentVC.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:contentVC animated:YES];
    }else if ([string isEqualToString:@"短视频Small"]) {
        ContentSmallViewController *smallVC = [ContentSmallViewController new];
        smallVC.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:smallVC animated:YES];
    }else if ([string isEqualToString:@"十二星座"]) {
        ConstellatoryViewController *constellatoryVC = [ConstellatoryViewController new];
        constellatoryVC.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:constellatoryVC animated:YES];
    }else if ([string isEqualToString:@"转盘抽奖"]) {
        LuckyDrawViewController *LuckyDrawVC = [LuckyDrawViewController new];
        LuckyDrawVC.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:LuckyDrawVC animated:YES];
    }else if ([string isEqualToString:@"Web转盘"]) {
        WebDialViewController *LuckyDrawVC = [WebDialViewController new];
        LuckyDrawVC.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:LuckyDrawVC animated:YES];
    }else if ([string isEqualToString:@"任务墙"]) {
        OSETIntegralWallViewController *IntegralWallVC = [OSETIntegralWallViewController new];
        
        IntegralWallVC.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:IntegralWallVC animated:YES];
    }else if ([string isEqualToString:@"小说内容"]) {
//        NovelViewController *NovelVC = [NovelViewController new];
//        NovelVC.hidesBottomBarWhenPushed = YES;
//        [self.navigationController pushViewController:NovelVC animated:YES];
    }else if ([string isEqualToString:@"视频夺宝"]) {
        LootTreasureViewController *LootTreasureVC = [LootTreasureViewController new];
        LootTreasureVC.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:LootTreasureVC animated:YES];
    }else if ([string isEqualToString:@"游戏试玩"]) {
//        GameViewController *GameVC = [GameViewController new];
//        GameVC.hidesBottomBarWhenPushed = YES;
//        [self.navigationController pushViewController:GameVC animated:YES];
    }else if ([string isEqualToString:@"微信阅读"]) {
        WeChatReadViewController *WeChatReadVC = [WeChatReadViewController new];
        WeChatReadVC.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:WeChatReadVC animated:YES];
    }else if ([string isEqualToString:@"周公解梦"]) {
        CrazyDreamViewController *CalendarVC = [CrazyDreamViewController new];
        CalendarVC.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:CalendarVC animated:YES];
    }else if ([string isEqualToString:@"黄历"]) {
        CalendarViewController *CalendarVC = [CalendarViewController new];
        CalendarVC.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:CalendarVC animated:YES];
    }else if ([string isEqualToString:@"天气"]) {
        WeatherViewController *CalendarVC = [WeatherViewController new];
        CalendarVC.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:CalendarVC animated:YES];
    }else if ([string isEqualToString:@"答题"]) {
        AnswerAdViewController *CalendarVC = [AnswerAdViewController new];
        CalendarVC.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:CalendarVC animated:YES];
    }else if ([string isEqualToString:@"喜马拉雅"]) {
        XMAdViewController *CalendarVC = [XMAdViewController new];
        CalendarVC.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:CalendarVC animated:YES];
    }else if ([string isEqualToString:@"话费"]) {
        CorrespondenceAdViewController *CalendarVC = [CorrespondenceAdViewController new];
        CalendarVC.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:CalendarVC animated:YES];
    }else if ([string isEqualToString:@"语音验证"]) {
        VoiceVerificationViewController *voiceVerificationVC = [VoiceVerificationViewController new];
        voiceVerificationVC.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:voiceVerificationVC animated:YES];
    }else if ([string isEqualToString:@"身份认证"]) {
//        webViewController *voiceVerificationVC = [webViewController new];
//        voiceVerificationVC.hidesBottomBarWhenPushed = YES;
//        [self.navigationController pushViewController:voiceVerificationVC animated:YES];
//        NSString * urlString =[NSString stringWithFormat:@"alipayqr://platformapi/startapp?sald=10000007&qrcode=https://openapi.alipay.com/gateway.do?alipay_sdk=alipay-sdk-java-3.7.105.ALL&app_id=2021001155661340&biz_content=%7B%22certify_id%22%3A%220d545c909db2842ff12c5a5db4a30756%22%7D&charset=UTF-8&format=JSON&method=alipay.user.certify.open.certify&sign=o5iQbbHZqpN2Xjlk5g%2FJG08y2d%2BwrXWAjIOXS6yhqp5mA0ayvvGwybtn%2FrXv3dQnzKC7A5mXQ0rJ5pqAcbC%2FZDCqugwnrRwDYWDgtN76MVY7qe81bRrkZS3BSmD3hM1ZER1AbPxNseWoF8n9b%2BS7denKRKAwINWAzQ9ycfHE3q%2BAGxw1EMdKLzHoApeI1Tg0M1AR3rfTfZR4eMFf3Vp7zsuuV1ZnGC5xCtnWS%2FfGFMhtUiFCSD96WFLZTDdnyj6Nj4SbUrTVuUP2Zs1vLKEQbnjL%2Bp9KVC5KJNw5uRhm%2FTHc7YirhZjelQGlyByoDNktKmlD%2Bfe%2Fi5%2B%2FW7j1ARhCBA%3D%3D&sign_type=RSA2&timestamp=2022-09-21+10%3A46%3A49&version=1.0"];
//        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:urlString] options:@{UIApplicationOpenURLOptionUniversalLinksOnly:@NO} completionHandler:^(BOOL success) {
//            NSLog(@"success = %i",success);
//        }];
    }
    if (showADVC) {
        showADVC.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:showADVC animated:YES];
    }
    if (nativeVC) {
        nativeVC.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:nativeVC animated:YES];
    }
    if (drawNativeVC) {
        drawNativeVC.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:drawNativeVC animated:NO];
    }
    
    
}

#pragma mark  设置CollectionViewCell是否可以被点击
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}
// 设置区头尺寸高度
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    CGSize size = CGSizeMake(OSET_SCREEN_WIDTH, 60);
    return size;
}
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    UICollectionReusableView *reusableView = nil;
    if (kind == UICollectionElementKindSectionHeader) {
        HomeCollectionReusableHeaderView *headerView = (HomeCollectionReusableHeaderView *)[collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HomeCollectionReusableHeaderView" forIndexPath:indexPath];
        headerView.titleLabel.text = self.data[indexPath.section][@"title"];
        reusableView = headerView;
    }
    return reusableView;
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
