//
//  KSDemoPageViewController.m
//  KSAdSDKGitDemo
//
//  Created by zangmina on 2020/1/21.
//  Copyright © 2020 xuzhijun. All rights reserved.
//

#import "KSDemoPageViewController.h"

#import <Masonry.h>

@interface KSDemoPageViewController ()

@property (nonatomic, assign) BOOL isFrist;
@property (nonatomic, strong) UILabel *lab;

@end

@implementation KSDemoPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _isFrist = false;
    self.view.backgroundColor = [UIColor whiteColor];
    
    _lab = [[UILabel alloc]init];
    [self.view addSubview:_lab];
    [_lab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
    }];
}

-(void)viewWillAppear:(BOOL)animated{
    
    if(!_isFrist){
        //第一次进入,自动加载数据
        _lab.text=_tag;
        _isFrist=true;
    }else{
        //不是第一次进入,不加载数据
//        NSLog(@"第二次进入--%@",_tag);
    }
}

- (BOOL)shouldAutorotate {
    return NO;
}

@end
