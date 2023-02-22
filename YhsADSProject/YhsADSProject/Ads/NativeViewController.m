//
//  NativeViewController.m
//  YhsADSProject
//
//  Created by 熊俊 on 2019/11/26.
//  Copyright © 2019 熊俊. All rights reserved.
//

#import "NativeViewController.h"
#import <OSETSDK/OSETSDK.h>
#import "DemoCollectionViewCell.h"

@interface NativeViewController ()<OSETNativeAdDelegate,UITableViewDelegate,UITableViewDataSource,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (nonatomic,strong) OSETNativeAd *nativeAd;

@property (nonatomic,strong) UITableView *tableView;
@property(nonatomic,strong)UICollectionView * collectionView;

@property (nonatomic,strong) NSMutableArray *dataSource;

@end

@implementation NativeViewController

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Native";
    [self request];
//    [self setupUI];
    
    [self.view addSubview:self.collectionView];
    [self.collectionView registerClass:[DemoCollectionViewCell class] forCellWithReuseIdentifier:@"testCell1111"];
    
    // Do any additional setup after loading the view.
}

- (void)request{
    self.nativeAd = [[OSETNativeAd alloc] initWithSlotId:@"BFA1BB3E710FE97BB40D1838E49571FB" size:CGSizeMake([UIScreen mainScreen].bounds.size.width, 0) rootViewController:self isDrawNative:NO];
    self.nativeAd.delegate = self;
    [self.nativeAd loadAdData:3];
}

- (void)setupUI{
    [self.view addSubview:self.tableView];
}

- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height-88) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"NativeExpressCell"];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _tableView;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"NativeExpressCell"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    [cell.contentView addSubview:self.dataSource[indexPath.row]];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.dataSource.count) {
        UIView *view = self.dataSource[indexPath.row];
        return view.frame.size.height;
    }
    return 30;
}

- (void)nativeExpressAdLoadSuccess:(NSArray *)nativeExpressViews{
    [self.dataSource addObjectsFromArray:nativeExpressViews];
    [self.collectionView reloadData];
}

- (void)nativeExpressAdRenderSuccess:(id)nativeExpressView{
    NSLog(@"nativeExpressView====%@",nativeExpressView);
    if (nativeExpressView){
        [self.collectionView reloadData];
    }else{
        //要不就是nativeView为空 ,要不就是高度为0,不显示到tableView
    }
}

- (void)nativeExpressAdFailedToLoad:(nonnull id)nativeExpressAd error:(nonnull NSError *)error {
    NSLog(@"----------%@",error);
}


- (void)nativeExpressAdFailedToRender:(nonnull id)nativeExpressView {
    NSLog(@"渲染失败");
}

- (void)nativeExpressAdDidClick:(nonnull id)nativeExpressView {
    NSLog(@"点击");
}

- (void)nativeExpressAdDidClose:(nonnull id)nativeExpressView {
    if ([self.dataSource containsObject:nativeExpressView]) {
        [self.dataSource removeObject:nativeExpressView];
        [self.collectionView reloadData];
    }
}
-(void)dealloc{
}
- (NSMutableArray *)dataSource{
    if (!_dataSource) {
        _dataSource = [NSMutableArray new];
    }
    return _dataSource;
}
-(__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"collectionView");
    DemoCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"testCell1111" forIndexPath:indexPath];
    //@"CF5845F9972D5AB3642E6C8695A59B09"
    [cell.contentView addSubview:self.dataSource[indexPath.row]];
   return cell;

}
#pragma mark   - - - - - - - - - - - - - - - - - - 懒加载

-(UICollectionView *)collectionView{

   if (!_collectionView) {
       UICollectionViewFlowLayout * layout = [[UICollectionViewFlowLayout alloc]init];
       _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0,  [UIScreen mainScreen].bounds.size.width,[UIScreen mainScreen].bounds.size.height) collectionViewLayout:layout];
       _collectionView.delegate = self;
       _collectionView.dataSource = self;
       _collectionView.backgroundColor = [UIColor grayColor];
       _collectionView.showsVerticalScrollIndicator = NO;
   }

   return   _collectionView;

}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
   return  1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
   return  self.dataSource.count;
}
//设置头部

-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
   return  [UICollectionReusableView new];

}

-(CGSize)collectionView:(UICollectionView*)collectionView layout:(UICollectionViewLayout*)collectionViewLayoutre ferenceSizeForHeaderInSection:(NSInteger)section{

   if(section ==0) {
       return CGSizeMake([UIScreen mainScreen].bounds.size.width,0);
   }else{

       return CGSizeMake( [UIScreen mainScreen].bounds.size.width,45);
   }

}

-(CGSize)collectionView:(UICollectionView*)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section{
   return CGSizeMake(0,0);
}
-(CGSize)collectionView:(UICollectionView*)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath*)indexPath{
    UIView *view = self.dataSource[indexPath.row];
    NSLog(@"view.frame.size.height == %f",view.frame.size.height);
   return  CGSizeMake( [UIScreen mainScreen].bounds.size.width,view.frame.size.height);
}

-(UIEdgeInsets)collectionView:(UICollectionView*)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
   return  UIEdgeInsetsMake(0, 0, 0, 0);
}
-(CGFloat)collectionView:(UICollectionView*)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
   return 8;
}
-(CGFloat)collectionView:(UICollectionView*)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
   return 0;
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
