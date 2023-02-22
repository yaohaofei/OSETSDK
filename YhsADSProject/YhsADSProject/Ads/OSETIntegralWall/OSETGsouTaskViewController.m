//
//  OSETGsouTaskViewController.m
//  YhsADSProject
//
//  Created by Shens on 2021/3/16.
//  Copyright © 2021 熊俊. All rights reserved.
//

#import "OSETGsouTaskViewController.h"
#import <WebKit/WebKit.h>
//#import "OSETHeader.h"

@interface OSETGsouTaskViewController ()
@property (nonatomic,strong) WKWebView *webView;
@end

@implementation OSETGsouTaskViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"极速任务";
//    self.extendedLayoutIncludesOpaqueBars = YES;
    NSString * device = @"ios";//因为测试ID用的是安卓 所以 device设置为android 正式对接 请联系商务获取
    if ([self.appKey isEqualToString:@"142792798"]) {
        device = @"android";
    }
    NSString * urlString =[NSString stringWithFormat:@"http://prod.rrhn.com/#/?appKey=%@&mediumUid=%@&device=%@&deviceInfo=%@",self.appKey,self.appUserId,device,@""];
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:urlString]]];
    [self addNavgationLeftButton];
    [self.webView evaluateJavaScript:@"document.title" completionHandler:^(id object, NSError * error) {
        NSString * title = object;
        if (title.length>0) {
            self.navigationItem.title = object;
        }
    }];
    // Do any additional setup after loading the view.
}

- (void)addNavgationLeftButton{
    UIImage *image = [self getImageWithName:@"OSETSDK_back@3x"];
    image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    self.navigationItem.leftBarButtonItem=[[UIBarButtonItem alloc]initWithImage:image style:UIBarButtonItemStylePlain target:self action:@selector(leftItemAction)];
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
-(WKWebView *)webView{
    if (!_webView) {
        _webView = [[WKWebView alloc] initWithFrame:CGRectMake(0,  [[UIApplication sharedApplication] statusBarFrame].size.height , self.view.bounds.size.width, self.view.bounds.size.height -  [[UIApplication sharedApplication] statusBarFrame].size.height )];
//        _webView.frame = CGRectMake(0,[[UIApplication sharedApplication] statusBarFrame].size.height, self.view.frame.size.width, self.view.frame.size.height -[[UIApplication sharedApplication] statusBarFrame].size.height);
        [self.view addSubview:_webView];
    }
    return _webView;
}

// 加载完毕
- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation {
    NSString *injectionJSString = @"var script = document.createElement('meta');"
    "script.name = 'viewport';"
    "script.content=\"width=device-width, user-scalable=no\";"
    "document.getElementsByTagName('head')[0].appendChild(script);";
    [webView evaluateJavaScript:injectionJSString completionHandler:nil];
}
-(void)leftItemAction{
    if([self.webView canGoBack]){
        [self.webView goBack];
    }else{
        [self.navigationController popViewControllerAnimated:YES];
    }
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
