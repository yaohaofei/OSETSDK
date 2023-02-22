//
//  DrawNativeTableViewCell.h
//  OSETDemo
//
//  Created by Shens on 2021/1/8.
//

#import <UIKit/UIKit.h>
#import <OSETSDK/OSETDrawView.h>
NS_ASSUME_NONNULL_BEGIN

@interface DrawNativeTableViewCell : UITableViewCell
@property(nonatomic,strong)OSETDrawView * drawView;
- (void)refreshWithDrawAd:(OSETDrawView *)drawView;


@end

NS_ASSUME_NONNULL_END
