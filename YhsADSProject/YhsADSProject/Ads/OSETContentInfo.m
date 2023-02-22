//
//  OSETContentInfo.m
//  YhsADSProject
//
//  Created by Shens on 2021/4/1.
//  Copyright © 2021 熊俊. All rights reserved.
//

#import "OSETContentInfo.h"
#import <KSAdSDK/KSAdSDK.h>
@interface OSETContentInfo()
@property(nonatomic,strong)OSETContentInfo * info;
@end

@implementation OSETContentInfo

-(id)initWithContent:(id)content{
    self = [super init];
    if (self) {
        self.info = content;
    }
    return self;
}



@end
