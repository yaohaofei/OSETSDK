//
//  KSDemoContentStyle4ViewController.m
//  KSAdSDKGitDemo
//
//  Created by zangmina on 2020/1/21.
//  Copyright © 2020 xuzhijun. All rights reserved.
//

#import "KSDemoContentStyle4ViewController.h"

#import <Masonry.h>
#import "KSDemoTabScrollView.h"
#import "KSDemoTabContentView.h"
#import "KSDemoPageViewController.h"
#import "KSDemoContentStyle1InsideViewController.h"
#import "ViewController.h"

#define KSAd_iPhoneX \
    ({ BOOL isPhoneX = NO; \
       if (@available(iOS 11.0, *)) { \
           isPhoneX = [[UIApplication sharedApplication] delegate].window.safeAreaInsets.bottom > 0.0; \
       } \
       (isPhoneX); })

@interface KSDemoContentStyle4ViewController ()

@property (nonatomic, strong) KSDemoTabScrollView *tabScrollView;
@property (nonatomic, strong) KSDemoTabContentView *tabContent;
@property (nonatomic, strong) NSMutableArray *tabs;
@property (nonatomic, strong) NSMutableArray *contents;
@property (nonatomic, strong) UIButton *backButton;
@property (nonatomic, assign) NSInteger currentIndex;
@property (nonatomic, strong) KSDemoContentStyle1InsideViewController *videoVC;

@end

@implementation KSDemoContentStyle4ViewController

- (void)dealloc {
    NSLog(@"dealloc");
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    self.currentIndex = 0;

    self.edgesForExtendedLayout = UIRectEdgeAll; //系统默认值,系统布局需要从状态栏开始
//    self.navigationController.navigationBar.translucent = NO;  //ios6之前默认为no,ios6之后默认为ysa,NO的时候,,布局就会自动从状态栏下方开始,我们布局直接从状态栏开始,无下移ß下64
    //创建模拟数据
    _tabs = [[NSMutableArray alloc] initWithCapacity:20];
    _contents = [[NSMutableArray alloc] initWithCapacity:20];

    for (int i = 0; i < 6; i++) {
        NSString *titleStr = [NSString stringWithFormat:@"tab%i", i];

        if (i == 2) {
            titleStr = @"视频";
        }
        UILabel *tab =  [[UILabel alloc] init];
        tab.textAlignment = NSTextAlignmentCenter;
        tab.text = titleStr;
        tab.textColor = [UIColor blackColor];

        [_tabs addObject:tab];

        if (i == 2) {
            KSDemoContentStyle1InsideViewController *vc = [[KSDemoContentStyle1InsideViewController alloc] init];
            vc.openEmbedAds = self.openEmbedAds;
            self.videoVC = vc;
            [_contents addObject:vc];
        } else {
            KSDemoPageViewController *con = [KSDemoPageViewController new];
            con.view.backgroundColor = [UIColor whiteColor];
            con.tag = titleStr;
            [_contents addObject:con];
        }
    }

    _tabScrollView = [[KSDemoTabScrollView alloc] initWithFrame:CGRectZero];
    [self.view addSubview:_tabScrollView];
    [_tabScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@50);
        make.left.equalTo(self.view);
        make.right.equalTo(self.view);
        make.top.equalTo(@(KSAd_iPhoneX ? 44 : 20));
    }];

    typeof(self) __weak weakSelf = self;
    [_tabScrollView configParameter:horizontal
                            viewArr:_tabs
                           tabWidth:80
                          tabHeight:50
                              index:0
                              block:^(NSInteger index) {
        if (self.currentIndex != index) {
            self.currentIndex = index;
            [weakSelf.tabContent updateTab:index];
        } else {
            if (index == 2) {
                [self.videoVC refreshVideo];
            }
        }
    }];

    _tabContent = [[KSDemoTabContentView alloc] initWithFrame:CGRectZero];
    [self.view addSubview:_tabContent];
    [_tabContent mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view);
        make.right.equalTo(self.view);
        make.top.equalTo(_tabScrollView.mas_bottom);
        make.bottom.equalTo(self.view);
    }];

    [_tabContent configParam:_contents Index:0 block:^(NSInteger index) {
        self.currentIndex = index;
        [weakSelf.tabScrollView updateTagLine:index];
    }];

    UILongPressGestureRecognizer *longPressGestureRecognizer = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPressGestureRecognizerAction:)];

    [self.view addGestureRecognizer:longPressGestureRecognizer];

//    [self.view addSubview:self.backButton];
//    [self.backButton mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(@34);
//        make.left.equalTo(@10);
//        make.width.height.equalTo(@(44));
//    }];
}

- (BOOL)shouldAutorotate {
    return NO;
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController.navigationBar setHidden:YES];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.navigationController.navigationBar setHidden:NO];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - setters and getters
- (UIButton *)backButton {
    if (_backButton == nil) {
        _backButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_backButton setImage:[UIImage imageNamed:@"icon_ksad_demo_back"] forState:UIControlStateNormal];
        [_backButton addTarget:self action:@selector(backButtonTouchUpInside:) forControlEvents:UIControlEventTouchUpInside];
        [_backButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _backButton.contentMode = UIViewContentModeCenter;
    }
    return _backButton;
}

- (void)backButtonTouchUpInside:(UIButton *)button {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)longPressGestureRecognizerAction:(UIGestureRecognizer *)gesture {
    if (gesture.state == UIGestureRecognizerStateBegan) {
        [self.navigationController popViewControllerAnimated:YES];
    }
}

@end
