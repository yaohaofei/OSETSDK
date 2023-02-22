//
//  OSETContentInfo.h
//  YhsADSProject
//
//  Created by Shens on 2021/4/1.
//  Copyright © 2021 熊俊. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef NS_ENUM(NSUInteger, OSETContentType) {
    OSETContentTypeUnknown,         //未知，正常不会出现
    OSETContentTypeNormal,          //普通信息流
    OSETContentTypeAd,              //SDK内部广告
    OSETContentTypeEmbeded = 100    //外部广告
};
NS_ASSUME_NONNULL_BEGIN

@interface OSETContentInfo : NSObject
////内容标识
//- (NSString *)publicContentId;
////内容类型
//- (KSCUContentType)publicContentType;
////视频时长. 毫秒
//- (NSTimeInterval)publicVideoDuration;
//内容标识
- (NSString *)publicContentId;
//内容类型
- (OSETContentType)publicContentType;
////视频时长. 毫秒
- (NSTimeInterval)publicVideoDuration;

-(id)initWithContent:(id)content;

@end

NS_ASSUME_NONNULL_END
