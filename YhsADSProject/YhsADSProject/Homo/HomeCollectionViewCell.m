//
//  HomeCollectionViewCell.m
//  YhsADSProject
//
//  Created by Shens on 2021/3/22.
//  Copyright © 2021 熊俊. All rights reserved.
//

#import "HomeCollectionViewCell.h"
@interface HomeCollectionViewCell()

@end
@implementation HomeCollectionViewCell

- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        [self createUI];
    }
    return self;
}
-(void)createUI{
    
    self.bgView = [[UIView alloc]initWithFrame:CGRectMake(15, 5, self.frame.size.width - 20, self.frame.size.height - 15)];
    [self.contentView addSubview:self.bgView];
    CALayer *subLayer=[CALayer layer];
    CGRect fixframe = self.bgView.bounds;
    subLayer.frame= fixframe;
    subLayer.cornerRadius=8;
    subLayer.masksToBounds=NO;
    subLayer.shadowColor = [UIColor blackColor].CGColor;//shadowColor阴影颜色
    subLayer.shadowOffset = CGSizeMake(1,2);//shadowOffset阴影偏移,x向右偏移3，y向下偏移2，默认(0, -3),这个跟shadowRadius配合使用
    subLayer.shadowOpacity = 0.8;//阴影透明度，默认0
    subLayer.shadowRadius = 10;//阴影半径，默认3
    [self.bgView.layer insertSublayer:subLayer below:self.bgView.layer];
    self.bgLayer = subLayer;
    
    
    self.imageView = [[UIImageView alloc]initWithFrame:CGRectMake(30, 20, 22, 23)];
    self.imageView.contentMode = UIViewContentModeScaleAspectFit;
    [self.contentView addSubview:self.imageView];
    self.title = [[UILabel alloc]initWithFrame:CGRectMake(48, 20, 100, 24)];
    self.title.textColor = [UIColor whiteColor];
    self.title.font = [UIFont systemFontOfSize:16];
    [self.contentView addSubview:self.title];
}

-(void)fillCellWithIndexPath:(NSIndexPath*)indexPath withDataDict:(NSDictionary *)dict{
    int i = indexPath.row % 2;
    if (i==0) {
        self.bgView.frame = CGRectMake(15,5, self.frame.size.width - 20, self.frame.size.height - 15);
        self.title.frame =CGRectMake(58, 21, 100, 24);
        self.imageView.frame =CGRectMake(30, 21, 22, 23);
    }else{
        self.bgView.frame = CGRectMake(5,5, self.frame.size.width - 20, self.frame.size.height - 15);
        self.title.frame =CGRectMake(48, 21, 100, 24);
        self.imageView.frame =CGRectMake(20, 21, 22, 23);
    }
    self.bgLayer.backgroundColor =  [self colorWithHexString:dict[@"color"]].CGColor;
    self.bgLayer.shadowColor =[self colorWithHexString:dict[@"color"]].CGColor;//shadowColor阴影颜色
    self.title.text = dict[@"title"];
    self.imageView.image = [UIImage imageNamed:dict[@"imageName"]];
}

- (UIColor *) colorWithHexString: (NSString *)color
{
    NSString *cString = [[color stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
 
    // String should be 6 or 8 characters
    if ([cString length] < 6) {
        return [UIColor clearColor];
    }
    // 判断前缀
    if ([cString hasPrefix:@"0X"])
        cString = [cString substringFromIndex:2];
    if ([cString hasPrefix:@"#"])
        cString = [cString substringFromIndex:1];
    if ([cString length] != 6)
        return [UIColor clearColor];
    // 从六位数值中找到RGB对应的位数并转换
    NSRange range;
    range.location = 0;
    range.length = 2;
    //R、G、B
    NSString *rString = [cString substringWithRange:range];
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
 
    return [UIColor colorWithRed:((float) r / 255.0f) green:((float) g / 255.0f) blue:((float) b / 255.0f) alpha:1.0f];
}
@end
