//
//  OSETVoiceAd.h
//  YhsADSProject
//
//  Created by Shens on 2022/7/5.
//  Copyright © 2022 熊俊. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol OSETVoiceVerifyDelegate <NSObject>
@optional

-(void)OSETVoiceVerifyLoadFail:(NSError *)error;
@end
@interface OSETVoiceVerify : NSObject

@property (nonatomic,weak) id <OSETVoiceVerifyDelegate> delegate;
- (instancetype)initWithAppkey:(NSString *)appkey
                    withWindow:(UIWindow *)window
                 withAppUserId:(NSString *)appUserid;
-(void)showVoiceVerify;
-(void)removeVoiceVerify;
@end

NS_ASSUME_NONNULL_END
