//
//  WeChatReadViewController.m
//  YhsADSProject
//
//  Created by Shens on 2021/3/25.
//  Copyright © 2021 熊俊. All rights reserved.
//

#import "WeChatReadViewController.h"

@interface WeChatReadViewController ()

@end

@implementation WeChatReadViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"微信阅读";
    
    
    /*
     ******************************************************************
     **********************    具体对接请联系商务    **********************
     ******************************************************************
     
     
     //需要接入 微信的SDK 并申请app的 微信appid 调用接口获取小程序路径 然后通过微信SDK跳转小程序
    微信SDK接入 寄调起小程序 请参考微信官方文档：
     https://developers.weixin.qq.com/doc/oplatform/Mobile_App/Launching_a_Mini_Program/iOS_Development_example.html
     */
    self.view.backgroundColor = [UIColor whiteColor];
    UILabel * label  = [[UILabel alloc]initWithFrame:CGRectMake(20, 100, self.view.bounds.size.width - 40, 250)];
    label.numberOfLines = 0;
    label.text = @"需要接入 微信的SDK 并申请app的 微信appid 调用接口获取小程序路径 然后通过微信SDK跳转小程序  \n微信SDK接入 寄调起小程序 请参考微信官方文档：\n\n https://developers.weixin.qq.com/doc/oplatform/Mobile_App/Launching_a_Mini_Program/iOS_Development_example.html";
    [self.view addSubview:label];
    

    
    
    // Do any additional setup after loading the view.
}
//----------------------------------------------------------------------        获取阅读小程序信息       -----------------------------
/*
 简要描述
 获取阅读小程序信息
 请求URL
 https:api.zzqb8.com/api/task/accountsv2
 https://api.gezs.cc/agent
 请求方式
 GET / POST
 参数
 参数名    必选    类型    说明
 channelId    是    string(32)    渠道ID
 userId    是    string(32)    第三方唯一用户ID（第三方判定给予奖励）
 securityStr    是    string(32)    加密串，根据‘开发前准备’通用加密算法得出，此处由channelId、userId、appSecret 字段生成
 
 加密示例
 1.参数
   'channelId'='22cc',
   'userId'='1788',
   'appSecret'='cec65d45h4d5gg',
 2.取值
   '22cc','1788','cec65d45h4d5gg'
 3.值的字符串升序排序
   '1788','22cc','cec65d45h4d5gg'
 4.得出加密前字符串
   '178822cccec65d45h4d5gg'
 5.md5加密字符串:md5（'178822cccec65d45h4d5gg'）
   得出加密串：'f03f26937a5d24cfaed25420d08cfb73'
 
 返回示例

  {
     "code": 200,
     "data": [
         {
           "xcxId": "xcx_test", (小程序id)
           "xcxUrl": "pages/index/index" (小程序打开地址)
        },
        {
           "xcxId": "xcx_test_1",
           "xcxUrl": "pages/index/index"
        }
    ],
    "msg": "获取成功"
 }
 错误示例

 {
     "code": 1301,
     "msg": "参数异常"
 }
 注意

 接口可能同时返回多个可用小程序信息，建议默认选择第一个使用（data.0），多个小程序主要用于某个小程序线上异常后，可自行切换下一个
 返回参数说明

 参数名    类型    说明
 code    int    200获取成功；1301参数异常；1305签名错误；1304系统异常，请重试
 
 
 **/



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
