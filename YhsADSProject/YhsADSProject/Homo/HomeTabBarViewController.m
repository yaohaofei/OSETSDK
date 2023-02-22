//
//  HomeTabBarViewController.m
//  YhsADSProject
//
//  Created by Shens on 2021/3/22.
//  Copyright © 2021 熊俊. All rights reserved.
//

#import "HomeTabBarViewController.h"
#import "HomeViewController.h"
#import "HomeVideoViewController.h"
#import "ExampleViewController.h"
@interface HomeTabBarViewController ()

@end

@implementation HomeTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    HomeViewController *home = [[HomeViewController alloc] init];
    UINavigationController *homeNav = [[UINavigationController alloc]
                                                         initWithRootViewController:home];
    UITabBarItem * firstTabbarItme = [[UITabBarItem alloc]initWithTitle:@"首页" image:[UIImage imageNamed:@"shouye"] tag:0];
    firstTabbarItme.selectedImage = [[UIImage imageNamed:@"shouyeSelect"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    homeNav.tabBarItem = firstTabbarItme;

    ExampleViewController *videoVC = [[ExampleViewController alloc] init];
    UINavigationController *videoNav = [[UINavigationController alloc]
                                       initWithRootViewController:videoVC];
    UITabBarItem * videoTabbarItme = [[UITabBarItem alloc]initWithTitle:@"小视频" image:[UIImage imageNamed:@"xiaoshipin"] tag:1];
    videoTabbarItme.selectedImage = [[UIImage imageNamed:@"xiaoshipinSelect"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    videoNav.tabBarItem = videoTabbarItme;
    
    [self setViewControllers:@[homeNav,videoNav]];
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor blackColor],NSForegroundColorAttributeName, nil]forState:UIControlStateSelected];

    [[UITabBar appearance] setBackgroundColor:[UIColor whiteColor]];
    // 添加阴影 去除黑线
//    self.tabBar.backgroundColor = [UIColor whiteColor];
//    [[UITabBar appearance] setShadowImage:[UIImage new]];
//    [[UITabBar appearance] setBackgroundImage:[[UIImage alloc]init]];
    
    // Do any additional setup after loading the view.
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
