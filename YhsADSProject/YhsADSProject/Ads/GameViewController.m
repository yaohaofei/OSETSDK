

#import "GameViewController.h"

//#import <Leto/Leto.h>

typedef void(^FuncBlock)(void);
NSString * const title = @"title";
NSString * const func = @"func";

@interface GameViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) NSArray *funcArray;
@property (nonatomic, weak) UITableView *listView;
@end

@implementation GameViewController

- (NSArray *)funcArray
{
    if (!_funcArray) {
        __weak typeof(self) weakSelf = self;
        _funcArray = [NSArray arrayWithObjects:
                      @{title:@"更多游戏",
                        func:^{
            //更多游戏(此接口需要LetoUI.framework的支持)
            [MGCMiniGameApi mgc_moreGameWithVc:weakSelf.navigationController];
        },
                        },
                      @{
                        title:@"同步账号",
                        func:^{
            //同步账号
            
            [MGCMiniGameApi mgc_syncInfo:^NSDictionary<NSString *,NSString *> *{
                return @{mgc_sync_mobile_key:@"13831382856",//手机号
                         mgc_sync_nickname_key:@"三岁男孩",//昵称
                         mgc_sync_portrait_key:@"https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=2175843469,2158546651&fm=26&gp=0.jpg",//头像
                         mgc_sync_userid_key:@"123",//用户id
                         mgc_sync_loginsign_key:@"1",//1是正式账号 2是游客账号
                         
                         };
            } result:^(BOOL isSuccess, NSString *message, NSString *mgc_userId) {
                NSLog(@"%@",message);
            }];
        }
                        },
                      @{
                         title:@"通过appId小游戏",
                        func:^{
            //根据appId,启动小游戏
            [MGCMiniGameApi mgc_jumpMiniGameWithAppId:@"363911" vc:weakSelf.navigationController sceneType:MgcMiniGameSceneType_UnKnown];
        }
                        },
                      @{
                        title:@"获取最近玩过的小游戏的列表",
                        func:^{
            //获取最近玩过的小游戏列表
            NSArray *recentArr = [MGCMiniGameApi mgc_getRecentApps];
            NSLog(@"recentArr = %@",recentArr);
        }
                        },
                      @{
                        title:@"获取收藏的小游戏列表",
                        func:^{
            //获取收藏的小游戏列表
            NSArray *favoritesArr = [MGCMiniGameApi mgc_getFavorites];
            NSLog(@"favoritesArr = %@",favoritesArr);

            
        }
                        },
                      @{
                        title:@"获取framework版本",
                        func:^{
            //获取framework版本
            NSLog(@"fameworkVersion = %@",[MGCMiniGameApi mgc_frameworkVersion]);
        
            
        }
                        },
                      @{
                        title:@"获取sdk版本",
                        func:^{
            NSLog(@"sdk version = %@",[MGCMiniGameApi mgc_version]);
            
        }
                        },
                      @{
                          title:@"通过url进入游戏中心",
                          func:^{
            [MGCMiniGameApi mgc_openUrl:[NSURL URLWithString:@"mgcgame://mgc.com/gamecenter"] vc:weakSelf];
        }
                          
                      },
                        @{
                            
                            title:@"通过url进入游戏",
                            func:^{
            NSString *url = @"mgcgame://mgc.com/game?id=363911";
            [MGCMiniGameApi mgc_openUrl:[NSURL URLWithString:url] vc:weakSelf];

                      }
                                        
                                    },
                      nil];
//        _funcArray = @[];
    }
    return _funcArray;
}

- (UITableView *)listView
{
    if (!_listView) {
        CGFloat screenW = [UIScreen mainScreen].bounds.size.width;
        CGFloat screenH = [UIScreen mainScreen].bounds.size.height;
        UITableView *listView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, screenW, screenH) style:UITableViewStylePlain];
        listView.backgroundColor = [UIColor whiteColor];
        listView.delegate = self;
        listView.dataSource = self;
        listView.tableFooterView = [UIView new];
        [self.view addSubview:listView];
        _listView = listView;
    }
    return _listView;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.title = @"游戏试玩";
    MgcCustomLogin login = ^(UIViewController *curVC, MgcCustomLoginCall call){
        //执行自定义的登录
        //将登录的结果返回sdk
        call(YES,^NSDictionary<NSString*,NSString*>*{
            //需要同步的信息
            return @{
                     mgc_sync_userid_key:@"123",//用户id
                     mgc_sync_portrait_key:@"https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=2175843469,2158546651&fm=26&gp=0.jpg",
                     mgc_sync_nickname_key:@"昵称",//昵称
                     mgc_sync_loginsign_key:@"1",//1是正式账号，2是游客账号
                     };
        },^(BOOL isSyncSuccess,NSString *msg,NSString *mgc_userId){
            NSLog(@"isSyncSuccess = %d, msg = %@",isSyncSuccess,msg);
        });
    };
    NSDictionary *dic = @{
                          mgc_app_id_key:@"364362",//364362,364326
                          mgc_register_login_key:login,//注册自定义登录
                          };
    [MGCMiniGameApi mgc_initSdkWithInfo:dic];
    [self listView];

}


#pragma mark UITableViewDelegate,UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.funcArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"abc"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"abc"];
//        cell.backgroundColor = [UIColor whiteColor];
    }
    NSDictionary *dic = self.funcArray[indexPath.row];
    cell.textLabel.text = dic[title];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
#warning 注意在使用其他API时,要先对SDK进行初始化，参考在viewDidLoad中的代码
    NSDictionary *dic = self.funcArray[indexPath.row];
    FuncBlock funcBlock = dic[func];
    if (funcBlock) {
        funcBlock();
    }
    
}


@end
