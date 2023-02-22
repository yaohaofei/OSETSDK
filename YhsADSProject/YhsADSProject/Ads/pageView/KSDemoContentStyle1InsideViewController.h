//
//  KSDemoContentStyle1InsideViewController.h
//  KSAdSDKGitDemo
//
//  Created by zangmina on 2020/1/21.
//  Copyright © 2020 xuzhijun. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface KSDemoContentStyle1InsideViewController : UIViewController

- (instancetype)initWithTopOffset:(CGFloat)topOffset;

@property (nonatomic, assign) BOOL openEmbedAds;

- (void)refreshVideo;

@end

NS_ASSUME_NONNULL_END
