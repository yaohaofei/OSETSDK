//
//  H5ViewController.m
//  YhsADSProject
//
//  Created by Shens on 22/9/2022.
//  Copyright © 2022 熊俊. All rights reserved.
//

#import "H5ViewController.h"
#import <WebKit/WebKit.h>
@interface H5ViewController ()<WKNavigationDelegate,WKScriptMessageHandler>
@property (nonatomic,strong) WKWebView *webView;

@end

@implementation H5ViewController
-(WKWebView *)webView{
    if (!_webView) {
        _webView = [[WKWebView alloc] initWithFrame:self.view.bounds];
        _webView.frame = CGRectMake(0,0, self.view.frame.size.width, self.view.frame.size.height);
        _webView.navigationDelegate = self;
        _webView.backgroundColor = [UIColor whiteColor];
        [self.view addSubview:_webView];
    }
    return _webView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.webViewUrl]]];

    // Do any additional setup after loading the view.
}
- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation {
    NSString *injectionJSString = @"var script = document.createElement('meta');"
    "script.name = 'viewport';"
    "script.content=\"width=device-width, user-scalable=no\";"
    "document.getElementsByTagName('head')[0].appendChild(script);";
    [webView evaluateJavaScript:injectionJSString completionHandler:nil];
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
