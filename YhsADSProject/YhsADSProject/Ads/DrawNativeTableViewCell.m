//
//  DrawNativeTableViewCell.m
//  OSETDemo
//
//  Created by Shens on 2021/1/8.
//

#import "DrawNativeTableViewCell.h"

@implementation DrawNativeTableViewCell
- (void)refreshWithDrawAd:(OSETDrawView *)drawView{
    [self.contentView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    self.drawView = drawView;
    if([drawView isKindOfClass:[OSETDrawView class]]){
        [self.drawView unregisterView];
        [self.drawView registerContainer];
        [self.contentView addSubview:drawView];
        self.contentView.backgroundColor = [UIColor whiteColor];
    }else if([drawView isKindOfClass:[UIView class]]){
        [self addSubview:drawView];
    }
}

- (void)prepareForReuse {
    [super prepareForReuse];
    if([self.drawView isKindOfClass:[OSETDrawView class]]){
        [self.drawView unregisterView];
    }
//    [self.drawView unregisterView];
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}

@end
