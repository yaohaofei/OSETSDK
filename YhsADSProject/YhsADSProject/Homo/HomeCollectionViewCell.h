//
//  HomeCollectionViewCell.h
//  YhsADSProject
//
//  Created by Shens on 2021/3/22.
//  Copyright © 2021 熊俊. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface HomeCollectionViewCell : UICollectionViewCell
@property(nonatomic,strong)UIImageView * imageView;
@property(nonatomic,strong)UILabel * title;
@property(nonatomic,strong)UIView * bgView;
@property(nonatomic,strong)CALayer * bgLayer;

-(void)fillCellWithIndexPath:(NSIndexPath*)indexPath withDataDict:(NSDictionary *)dict;

@end

NS_ASSUME_NONNULL_END
