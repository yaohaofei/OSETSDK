//
//  ExampleViewController.m
//  FJSlidingController
//
//  Created by fujin on 15/12/17.
//  Copyright © 2015年 fujin. All rights reserved.
//

#import "ExampleViewController.h"
#import "HomeVideoViewController.h"
@interface ExampleViewController ()<FJSlidingControllerDataSource,FJSlidingControllerDelegate>
@property (nonatomic, strong)NSArray *titles;
@property (nonatomic, strong)NSArray *controllers;
@end

@implementation ExampleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.datasouce = self;
    self.delegate = self;
    
    HomeVideoViewController *v1 = [[HomeVideoViewController alloc]init];
    v1.view.backgroundColor = [UIColor grayColor];
    UIViewController *v2 = [[UIViewController alloc]init];
    v2.view.backgroundColor = [UIColor whiteColor];
    self.titles      = @[@"小视频",@"空白"];
    self.controllers = @[v1,v2];
    [self addChildViewController:v1];
    [self addChildViewController:v2];
    
    self.title = self.titles[0];
    [self reloadData];
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}
#pragma mark dataSouce
- (NSInteger)numberOfPageInFJSlidingController:(FJSlidingController *)fjSlidingController{
    return self.titles.count;
}
- (UIViewController *)fjSlidingController:(FJSlidingController *)fjSlidingController controllerAtIndex:(NSInteger)index{
    return self.controllers[index];
}
- (NSString *)fjSlidingController:(FJSlidingController *)fjSlidingController titleAtIndex:(NSInteger)index{
    return self.titles[index];
}
/*
- (UIColor *)titleNomalColorInFJSlidingController:(FJSlidingController *)fjSlidingController;
- (UIColor *)titleSelectedColorInFJSlidingController:(FJSlidingController *)fjSlidingController;
- (UIColor *)lineColorInFJSlidingController:(FJSlidingController *)fjSlidingController;
- (CGFloat)titleFontInFJSlidingController:(FJSlidingController *)fjSlidingController;
 */

#pragma mark delegate
- (void)fjSlidingController:(FJSlidingController *)fjSlidingController selectedIndex:(NSInteger)index{
    // presentIndex
    NSLog(@"%ld",index);
    self.navigationItem.title = [self.titles objectAtIndex:index];
}
- (void)fjSlidingController:(FJSlidingController *)fjSlidingController selectedController:(UIViewController *)controller{
    // presentController
}
- (void)fjSlidingController:(FJSlidingController *)fjSlidingController selectedTitle:(NSString *)title{
    // presentTitle
}
-(void)dealloc{
    NSLog(@"!dealloc!");
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
@end
