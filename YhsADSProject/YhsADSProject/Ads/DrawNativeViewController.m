//
//  DrawNativeViewController.m
//  YhsADSProject
//
//  Created by 熊俊 on 2019/12/23.
//  Copyright © 2019 熊俊. All rights reserved.
//

#import "DrawNativeViewController.h"
#import "DrawNativeTableViewCell.h"
#import <OSETSDK/OSETSDK.h>

@interface DrawNativeViewController ()<OSETNativeAdDelegate,UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) OSETNativeAd *draw_nativeAd;
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) UIScrollView *scrollView;
@property (nonatomic,strong) NSMutableArray *dataSource;
@end

@implementation DrawNativeViewController

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
    [self.navigationController setNavigationBarHidden:YES animated:NO];

}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.navigationController.navigationBar.hidden = NO;
    [self.navigationController setNavigationBarHidden:NO animated:NO];

}

/// 隐藏 状态栏
- (BOOL)prefersStatusBarHidden {
    return YES;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self request];
    [self setupUI];
    self.scrollView.backgroundColor = [UIColor blackColor];
    
    
    self.edgesForExtendedLayout = UIRectEdgeTop;
    self.automaticallyAdjustsScrollViewInsets = NO;
    if (@available(iOS 11.0, *)) {
        self.tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }

    UIButton * btn = [[UIButton alloc]initWithFrame:CGRectMake(0, 50,100, 50)];
    [btn setTitle:@"<返回" forState:UIControlStateNormal];
    [btn setBackgroundColor:[UIColor colorWithRed:0.3 green:0.3 blue:0.3 alpha:1]];
    [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    // Do any additional setup after loading the view.
}
-(void)btnClick{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)request{
    self.draw_nativeAd = [[OSETNativeAd alloc] initWithSlotId:@"459E3B8C2D70BA764D787CA9912CA834" size:CGSizeMake([UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) rootViewController:self isDrawNative:YES];
    self.draw_nativeAd.delegate = self;
    [self.draw_nativeAd loadAdData:2];
}

- (void)setupUI{
    [self.view addSubview:self.tableView];
}
- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) style:UITableViewStylePlain];
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.showsHorizontalScrollIndicator = NO;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.pagingEnabled = TRUE;
        _tableView.backgroundColor = [UIColor whiteColor];
    }
    return _tableView;
}
#pragma mark --------- tableViewDalegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
};
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataSource.count;
}
-(CGFloat)tableView:(UITableView*)tableView heightForRowAtIndexPath:(NSIndexPath*)indexPath{
    
    return [UIScreen mainScreen].bounds.size.height;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identify = @"DrawNativeTableViewCell";
    DrawNativeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identify];
    if (!cell) {
        cell = [[DrawNativeTableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identify];
    }
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    [cell refreshWithDrawAd:self.dataSource[indexPath.row]];
    return cell;
}
#pragma mark OSETNativeAdDelegate
- (void)nativeExpressAdLoadSuccess:(NSArray *)nativeExpressViews{
    [self.dataSource addObjectsFromArray:nativeExpressViews];
    [self.tableView reloadData];
}

- (void)nativeExpressAdRenderSuccess:(id)nativeExpressView{
    NSLog(@"渲染成功");
}

- (void)nativeExpressAdFailedToRender:(nonnull id)nativeExpressView {
    NSLog(@"渲染失败");
}

- (void)nativeExpressAdFailedToLoad:(nonnull id)nativeExpressAd error:(nonnull NSError *)error {
    NSLog(@"加载失败%@",error);
}

- (void)nativeExpressAdDidClick:(nonnull id)nativeExpressView {
    NSLog(@"点击");
}

- (void)nativeExpressAdDidClose:(nonnull id)nativeExpressView {
    NSLog(@"关闭");
}
///视频完成播放
- (void)nativeExpressAdViewPlayerDidPlayFinish:(id)nativeExpressAd{
    NSLog(@"视频完成播放");
}
///视频开始播放
- (void)nativeExpressAdVideoDidStart:(id)nativeExpressAd{
    NSLog(@"视频开始播放");

}
///视频暂停播放
- (void)nativeExpressAdVideoDidPause:(id)nativeExpressAd{
    NSLog(@"视频暂停播放");

    
}
- (NSMutableArray *)dataSource{
    if (!_dataSource) {
        _dataSource = [NSMutableArray new];
    }
    return _dataSource;
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
