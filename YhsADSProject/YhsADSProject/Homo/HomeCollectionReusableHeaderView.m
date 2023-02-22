//
//  HomeCollectionReusableHeaderView.m
//  YhsADSProject
//
//  Created by Shens on 2021/3/22.
//  Copyright © 2021 熊俊. All rights reserved.
//

#import "HomeCollectionReusableHeaderView.h"

@implementation HomeCollectionReusableHeaderView

-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        UIView * view= [[UIView alloc]initWithFrame:CGRectMake(15, 28, 3.5, 18)];
        view.backgroundColor = [UIColor colorWithRed:0/255.0 green:183/255.0 blue:103/255.0 alpha:1.0];
        [self addSubview:view];
        self.titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(25, 22, 200, 28)];
        self.titleLabel.font = [UIFont systemFontOfSize:18];
        [self addSubview:self.titleLabel];
    }
    return self;
}
@end
