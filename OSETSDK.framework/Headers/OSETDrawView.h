//
//  OSETDrawView.h
//  OSETDemo
//
//  Created by Shens on 2021/1/15.
//

#import <UIKit/UIKit.h>
#import <KSAdSDK/KSDrawAd.h>
NS_ASSUME_NONNULL_BEGIN

@interface OSETDrawView : UIView

@property(nonatomic,strong)KSDrawAd * drawAd;

-(id)initWithDrawAd:(KSDrawAd*)drawAd WithView:(UIView *)view;
- (void)registerContainer;
- (void)unregisterView;

@end

NS_ASSUME_NONNULL_END
