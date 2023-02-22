//
//  webViewController.m
//  YhsADSProject
//
//  Created by Shens on 21/9/2022.
//  Copyright © 2022 熊俊. All rights reserved.
//

#import "webViewController.h"
#import <WebKit/WebKit.h>
#import "H5ViewController.h"
@interface webViewController ()<WKNavigationDelegate,WKScriptMessageHandler>

@property (nonatomic,strong) WKWebView *webView;
@end

@implementation webViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton * btn = [[UIButton alloc]initWithFrame:CGRectMake(0, 100, 150, 60)];
    [btn setTitle:@"支付宝认证" forState:UIControlStateNormal];
    [btn setBackgroundColor:[UIColor redColor]];
    [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    
    
    UIButton * btn1 = [[UIButton alloc]initWithFrame:CGRectMake(0, 200, 150, 60)];
    [btn1 setTitle:@"腾讯云认证" forState:UIControlStateNormal];
    [btn1 setBackgroundColor:[UIColor redColor]];
    [btn1 addTarget:self action:@selector(btn1Click) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn1];
    
    
    
    
    UIButton * btn2 = [[UIButton alloc]initWithFrame:CGRectMake(0, 300, 150, 60)];
    [btn2 setTitle:@"微信认证" forState:UIControlStateNormal];
    [btn2 setBackgroundColor:[UIColor redColor]];
    [btn2 addTarget:self action:@selector(btn2Click) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn2];
    
    
    self.view.backgroundColor = [UIColor whiteColor];
    
//    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:urlString]]];
    // Do any additional setup after loading the view.
}
-(void)btnClick{
    [self testWithType:@"ZHIMACREDIT"];
}
-(void)btn1Click{
    [self testWithType:@"TENCENT"];
}
-(void)btn2Click{
    [self testWithType:@"WECHAT"];
}
-(void)testWithType:(NSString *)type{
//    idNo    String    是    body    身份证号（大陆二代身份证）
//    name    String    是    body    姓名
//    callbackUrl    String    是    body    认证成功后重定向地址，网页端接入可以直接传入网页地址，app接入传入app schema地址
//    notifyUrl    String    是    body    认证结束后异步通知接口,具体见异步通知说明
//    faceauthMode    String    否    body    ZHIMACREDIT 支付宝认证
//    TENCENT 腾讯云认证
//    WECHAT 微信认证（生成只有微信客户端可以打开的链接）
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"https://api.shuun.cn/cloudauth/fin"]];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    NSString *jsonString = @"";
    NSMutableDictionary * parameters = [[NSMutableDictionary alloc]init];
    [parameters setValue:@"" forKey:@"idNo"];
    [parameters setValue:@"" forKey:@"name"];
    [parameters setValue:@"OSETDemo://" forKey:@"callbackUrl"];
    [parameters setValue:@"/test/notify" forKey:@"notifyUrl"];
    [parameters setValue:type forKey:@"faceauthMode"];

    if (parameters && [parameters isKindOfClass:[NSDictionary class]]) {
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:parameters options:0 error:nil];
        jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    }
    [request setTimeoutInterval:5];
    request.HTTPMethod = @"POST";
    [request setValue:@"application/json; charset=UTF-8" forHTTPHeaderField:@"Content-Type"];
    [request setValue:@"204112926" forHTTPHeaderField:@"appKey"];
    [request setValue:@"APPCODE 63c40d82a34f44daac330067782b5212" forHTTPHeaderField:@"Authorization"];
    request.HTTPBody = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            if (data) {
                NSError *dataError;
                NSDictionary *responseObject = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&dataError];
                if (!dataError) {
                    if([responseObject[@"code"] isEqualToString:@"000000"]){
                        NSLog(@"获取认证成功 == %@",responseObject);
                        if ([type isEqualToString:@"ZHIMACREDIT"]) {
//                            alipayqr://platformapi/startapp?saId=10000007&qrcode=
                            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",responseObject[@"data"][@"originalUrl"]]]];
                        }else if ([type isEqualToString:@"TENCENT"]) {
                            H5ViewController * vc = [[H5ViewController alloc]init];
                            vc.webViewUrl =responseObject[@"data"][@"originalUrl"];
                            [self.navigationController pushViewController:vc animated:YES];
                        }else if ([type isEqualToString:@"WECHAT"]) {
                            NSLog(@"  WECHAT 微信认证（生成只有微信客户端可以打开的链接）");
//                            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"weixin://scanqrcode?qrcode=%@",responseObject[@"data"][@"originalUrl"]]] options:@{UIApplicationOpenURLOptionUniversalLinksOnly:@NO} completionHandler:^(BOOL success) {
//                                NSLog(@" 未知类型");
//                            }];
                        }else{
                        
                        }
                    }else{
                        NSLog(@"获取认证失败 == %@",responseObject);
                    }
                }else{
                }
            }else{}
        });
    }];
    [task resume];
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
