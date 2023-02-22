//
//  OSETLogManager.h
//  AliyunLogDemo
//
//  Created by Shens on 14/10/2022.
//

#import <Foundation/Foundation.h>
NS_ASSUME_NONNULL_BEGIN

@interface OSETLogManager : NSObject

+ (instancetype)shareInstance;
-(void)sendLogWithDict:(NSDictionary *)dict;
-(void)sendLog:(NSString *)log;
@end

NS_ASSUME_NONNULL_END
