//
//  ViewController.m
//  YhsADSProject
//
//  Created by 熊俊 on 2019/10/29.
//  Copyright © 2019 熊俊. All rights reserved.
//

#import "ViewController.h"
#import "TestCell.h"
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
#import "ConstellatoryViewController.h"
#import "LuckyDrawViewController.h"
#import "HomeCollectionViewCell.h"
#import "ExampleViewController.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView *tableView;

@property (nonatomic,strong) NSArray *arrt;

@property (nonatomic,strong) UIView *adView;

@end

@implementation ViewController

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.title = @"聚合SDK";
    [self.navigationController.navigationBar setHidden:NO];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.arrt = @[@"激励视频",@"插屏",@"Banner",@"开屏",@"全屏视频",@"Native",@"Draw_Native_Video",@"内容_fullscreen",@"内容_small",@"资讯模版(native)",@"星座运势",@"转盘抽奖"];
    [self.view addSubview:self.tableView];
    // Do any additional setup after loading the view.
}

-(void)adDidReceiveSuccess:(NSString *)advertId handleTarget:(nonnull id)target{
    NSLog(@"=============加载成功%@",advertId);
//    self.adView = target;
}


-(void)nativeExpressAdLoadSuccess:(NSArray *)nativeExpressViews{
    NSLog(@"=============原生请求成功");
}

-(void)adDidReceiveLoadFailure:(NSString *)errorCode advertId:(NSString *)advertId message:(NSString *)errorMsg{
    NSLog(@"=============%@   %@",errorCode,errorMsg);
}

- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.rowHeight = 50;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_tableView registerClass:[TestCell class] forCellReuseIdentifier:@"Test"];
    }
    return _tableView;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.arrt.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    TestCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Test"];
    cell.title = self.arrt[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    BaseViewController *showADVC = nil;
    NativeViewController *nativeVC = nil;
    DrawNativeViewController *drawNativeVC = nil;
    switch (indexPath.row) {
        case 0:
        {
            showADVC = [[RewardVideoViewController alloc] init];
            showADVC.slotId = @"971D11E82E1009B5CAA2D00EFBC4E372";
        }
            break;
        case 1:
        {
            showADVC = [[InsertViewController alloc] init];
            showADVC.slotId = @"4FD8476AE54A3DBA39CCD635BBD48957";
        }
            break;
        case 2:
        {
             showADVC = [[BannerViewController alloc] init];
             showADVC.slotId = @"58A0BB27A707FD48ECACF89B0E8A9657";
        }
            break;
        case 3:
        {
             showADVC = [[SplashViewController alloc] init];
             showADVC.slotId = @"7B1DB0A0A7191FEFB4B0E59881A09041";
        }
            break;
        case 4:
        {
            showADVC = [[FullScreebViewController alloc] init];
            showADVC.slotId = @"1E2A37E7BD27790D9615323944FCE4DB";
        }
            break;
        case 5:
        {
            nativeVC = [NativeViewController new];
        }
            break;
        case 6:
        {
          drawNativeVC = [DrawNativeViewController new];
        }
            break;
        case 7:
        {
            ContentFullscreenViewController *contentVC = [ContentFullscreenViewController new];
            [self.navigationController pushViewController:contentVC animated:YES];
            break;
        }
        case 8:
        {
            ContentSmallViewController *smallVC = [ContentSmallViewController new];
            [self.navigationController pushViewController:smallVC animated:YES];
        }
            break;
        case 9:
        {
            NewsViewController *newsVC = [NewsViewController new];
            [self.navigationController pushViewController:newsVC animated:YES];
        }
            break;
        case 10:
        {
            ConstellatoryViewController *newsVC = [ConstellatoryViewController new];
            [self.navigationController pushViewController:newsVC animated:YES];
        }
            break;
        case 11:
        {
            LuckyDrawViewController *newsVC = [LuckyDrawViewController new];
            [self.navigationController pushViewController:newsVC animated:YES];
        }
            break;
        default:
            break;
    }
    if (showADVC) {
        [self.navigationController pushViewController:showADVC animated:YES];
    }
    if (nativeVC) {
        [self.navigationController pushViewController:nativeVC animated:YES];
    }
    if (drawNativeVC) {
        [self.navigationController pushViewController:drawNativeVC animated:NO];
    }
}

@end
