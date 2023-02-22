//
//  OSETIntegralWallViewController.m
//  YhsADSProject
//
//  Created by Shens on 2021/3/16.
//  Copyright © 2021 熊俊. All rights reserved.
//

#import "OSETIntegralWallViewController.h"
#import "OSETGsouTaskViewController.h"
#import <OSETSDK/OSETSDK.h>
#import <IBXSDK/IBXSDK.h>
#import <AdSupport/AdSupport.h>
#import "H5ViewController.h"

//.获取屏幕宽度与高度
#define OSET_SCREEN_WIDTH   [UIScreen mainScreen].bounds.size.width
#define OSET_SCREENH_HEIGHT [UIScreen mainScreen].bounds.size.height
//根据设计稿尺寸的 快捷系数
#define OSET_SSSW(R) (R)*(OSET_SCREEN_WIDTH)/375.0
#define OSET_SSSH(R) (R)*(OSET_SCREEN_WIDTH)/375.0


@interface OSETIntegralWallViewController ()<OSETBannerAdDelegate,IBXSDKDelegate,OSETInterstitialAdDelegate,OSETNativeAdDelegate,UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) OSETBannerAd *bannerAd;
@property (nonatomic,strong) OSETInterstitialAd *interstitialAd;
@property (nonatomic,strong) OSETNativeAd *nativeAd;
@property (nonatomic,strong) UIView *nativeView;
@property (nonatomic,assign) CGFloat nativeH;
@property (nonatomic,strong) UITableView *tableView;

@property (nonatomic,strong) NSMutableArray *dataSource;


@property (nonatomic,strong)UIButton * dayTask;
@property (nonatomic,strong)UIButton * gsouTask;

@property (nonatomic,strong) UIView * loadingView;
@property (nonatomic,strong) UILabel * loadingLabel;

@end

@implementation OSETIntegralWallViewController
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:NO];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"抽好礼";
    self.view.backgroundColor = [UIColor whiteColor];
    self.nativeH = 0;
    self.extendedLayoutIncludesOpaqueBars = YES;

    /*
     *  此页面 仅供演示参考 实际对接 可根据需求自行开发 id仅为测试使用
     */
    self.appUserId =@"123";
    self.appKey = @"542792870";
    self.IBXappKey = @"142793166";
    self.secretKey = @"291d28a7be9de4ef";
    self.bannerSlotId= @"58A0BB27A707FD48ECACF89B0E8A9657";
    self.interstitialSlotId= @"4FD8476AE54A3DBA39CCD635BBD48957";
    self.nativeSlotId= @"0BA47216E326C31D9DD2D2923D62D9BC";
    
    if (self.bannerSlotId && self.bannerSlotId.length > 0) {
        self.bannerAd = [[OSETBannerAd alloc] initWithSlotId:self.bannerSlotId rootViewController:self containView:self.view rect:CGRectMake(0, self.view.frame.size.height - [UIScreen mainScreen].bounds.size.width*90/600, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.width*90/600)];
        self.bannerAd.delegate = self;
        [self.bannerAd loadAdDataAndShow];
        
    }
    
    if (self.interstitialSlotId && self.interstitialSlotId.length > 0) {
        self.interstitialAd = [[OSETInterstitialAd alloc] initWithSlotId:self.interstitialSlotId];
        self.interstitialAd.delegate = self;
        [self.interstitialAd loadAdData];
    }
    
    if (self.nativeSlotId && self.nativeSlotId.length > 0) {
        self.nativeAd = [[OSETNativeAd alloc] initWithSlotId:self.nativeSlotId size:CGSizeMake(self.view.bounds.size.width - 40, 0) rootViewController:self isDrawNative:NO];
        self.nativeAd.delegate = self;
        [self.nativeAd loadAdData:1];
    }
    
    [self setupUI];
    // Do any additional setup after loading the view.
}
- (void)setupUI{
    [self.view addSubview:self.tableView];
}

- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, self.navigationController.navigationBar.frame.size.height + [[UIApplication sharedApplication] statusBarFrame].size.height, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height-self.navigationController.navigationBar.frame.size.height -  [[UIApplication sharedApplication] statusBarFrame].size.height) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"NativeExpressCell"];
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"NativeExpressImageCell"];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.backgroundColor = [UIColor whiteColor];
    }
    return _tableView;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.dataSource.count +3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row < self.dataSource.count) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"NativeExpressCell"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        UIView * view =self.dataSource[indexPath.row];
        CGRect frame = view.frame;
        view.frame = CGRectMake(20, 20, frame.size.width, frame.size.height);
        [cell.contentView addSubview:view];
        cell.backgroundColor = [UIColor whiteColor];
        return cell;
    }else{
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"NativeExpressImageCell"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        UIImageView * imageV= [[UIImageView alloc]initWithFrame:CGRectMake(20, 10, self.view.bounds.size.width - 40, (self.view.bounds.size.width - 40) * 10/33)];
        [cell.contentView addSubview:imageV];
        if (indexPath.row == self.dataSource.count) {
            imageV.image = [UIImage imageNamed:@"OSETSDK_DayTask000"];
        }else if (indexPath.row == self.dataSource.count+1) {
            imageV.image = [UIImage imageNamed:@"OSETSDK_GsouTask"];
        }else{
            imageV.image = [UIImage imageNamed:@"OSETSDK_Task.jpg"];
        }
        cell.backgroundColor = [UIColor whiteColor];
        return cell;
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row < self.dataSource.count) {
        if (self.dataSource.count) {
            UIView *view = self.dataSource[indexPath.row];
            return view.frame.size.height+30;
        }
    }else{
        return (self.view.bounds.size.width - 40) * 10/33 + 20;
    }
    return 0;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == self.dataSource.count) {
        [self dayTaskClick];
    }else if(indexPath.row == self.dataSource.count +1) {
        [self gsouTaskClick];
    }else if(indexPath.row == self.dataSource.count +2) {
        H5ViewController * vc =[[H5ViewController alloc]init];
        vc.webViewUrl = @"http://www.duomoburl.com/ios";
        [self.navigationController pushViewController:vc animated:YES];
    }
}
-(void)dayTaskClick{
    [IBXSDKConfig setupAppKey:self.IBXappKey secretKey:self.secretKey targetId:self.appUserId notifyUrl:@"not_notifyUrl"];
    [IBXSDK loadWithRootViewController:self delegate:self];
}
-(void)gsouTaskClick{
    OSETGsouTaskViewController * vc = [[OSETGsouTaskViewController alloc]init];
    vc.appKey = self.appKey;
    vc.appUserId = self.appUserId;
    [self.navigationController pushViewController:vc animated:YES];
}
-(UIImage *)getImageWithName:(NSString *)imageName{
  UIImage *image = nil;
  NSString *bundlePath = [[NSBundle mainBundle] pathForResource:@"OSETSDK" ofType:@"bundle"];
  NSBundle *bundle = [NSBundle bundleWithPath:bundlePath];
  if (!bundle) {
    NSLog(@"请检查OSETSDK.bundle是否导入");
    return image;
  }
  NSString *path = [bundle pathForResource:imageName ofType:@".png"];
  if (path) {
    image = [UIImage imageWithContentsOfFile:path];
  }
  return image;
}
-(void)showErrorView{
    [self.loadingView setHidden:NO];
    __weak typeof(self)weakSelf = self;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [weakSelf.loadingView setHidden:YES];
    });
}
-(UIView *)loadingView{
    if (!_loadingView) {
        _loadingView = [[UIView alloc]initWithFrame:CGRectMake((OSET_SCREEN_WIDTH - OSET_SSSW(280))/2, OSET_SCREENH_HEIGHT/3.0*2, OSET_SSSW(280), OSET_SSSH(40))];
        [_loadingView setBackgroundColor:[UIColor colorWithWhite:0 alpha:0.80]];
        self.loadingLabel= [[UILabel alloc]initWithFrame:_loadingView.bounds];
        self.loadingLabel.textAlignment = NSTextAlignmentCenter;
        self.loadingLabel.text = @"获取IDFA失败,请检查设置->隐私->追踪";
        self.loadingLabel.font = [UIFont systemFontOfSize:14];
        self.loadingLabel.textColor = [UIColor whiteColor];
        [_loadingView addSubview:self.loadingLabel];
        _loadingView.layer.cornerRadius = OSET_SSSW(10);
        [self.view addSubview:_loadingView];
    }
    return  _loadingView;
}

#pragma mark  OSETBannerAdDelegate

- (void)bannerDidReceiveSuccess:(id)bannerView slotId:(NSString *)slotId{
}
/// banner加载失败
- (void)bannerLoadToFailed:(id)bannerView error:(NSError *)error{
    NSLog(@"========banner加载失败%@",error);
}
- (void)bannerDidClose:(id)bannerView{
    UIView *view = (UIView *)bannerView;
    [view removeFromSuperview];
}
#pragma mark  IBXSDKDelegate
/**
 加载成功
 */
- (void)ibx_didLoad{
//    NSLog(@"ibx_didLoad");
//    if (self.delegate && [self.delegate respondsToSelector:@selector(OSETDidLoad)]) {
//        [self.delegate OSETDidLoad];
//    }
}

/**
加载失败
*/
- (void)ibx_didLoadFail:(NSError *)error{
    NSLog(@"ibx_didLoadFail error = %@",error);
    NSString * idfa =[[[ASIdentifierManager sharedManager] advertisingIdentifier] UUIDString];
    if (idfa.length == 0 || [idfa isEqualToString:@"00000000-0000-0000-0000-000000000000"]) {
        [self showErrorView];
    }
}
/**
关闭
*/
- (void)ibx_didClose{

}

/**
 事件触发
 */
- (void)ibx_didTriggerEvent:(IBXSDKEvent *)event{


}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (void)interstitialDidReceiveSuccess:(nonnull id)interstitialAd slotId:(nonnull NSString *)slotId {
    [self.interstitialAd showFromRootViewController:self];
}

- (void)interstitialLoadToFailed:(nonnull id)interstitialAd error:(nonnull NSError *)error {
    NSLog(@"加载失败%@",error);
}

- (void)interstitialDidClick:(nonnull id)interstitialAd {
}

- (void)interstitialDidClose:(nonnull id)interstitialAd {
}

- (void)nativeExpressAdLoadSuccess:(NSArray *)nativeExpressViews{
    [self.dataSource addObjectsFromArray:nativeExpressViews];
    [self.tableView reloadData];
}

- (void)nativeExpressAdRenderSuccess:(id)nativeExpressView{
    if (nativeExpressView){
        [self.tableView reloadData];
    }else{
        //要不就是nativeView为空 ,要不就是高度为0,不显示到tableView
    }
}

- (void)nativeExpressAdFailedToLoad:(nonnull id)nativeExpressAd error:(nonnull NSError *)error {
    NSLog(@"nativeExpressAdFailedToLoad%@",error);
}


- (void)nativeExpressAdFailedToRender:(nonnull id)nativeExpressView {
    NSLog(@"渲染失败");
}

- (void)nativeExpressAdDidClick:(nonnull id)nativeExpressView {
}

- (void)nativeExpressAdDidClose:(nonnull id)nativeExpressView {
    if ([self.dataSource containsObject:nativeExpressView]) {
        [self.dataSource removeObject:nativeExpressView];
        [self.tableView reloadData];
    }
}

- (NSMutableArray *)dataSource{
    if (!_dataSource) {
        _dataSource = [NSMutableArray new];
    }
    return _dataSource;
}

@end

