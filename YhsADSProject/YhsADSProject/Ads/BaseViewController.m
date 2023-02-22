//
//  BaseViewController.m
//  YhsADSProject
//
//  Created by 熊俊 on 2019/11/8.
//  Copyright © 2019 熊俊. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()<UITextFieldDelegate>

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI];
    // Do any additional setup after loading the view.
}

- (void)setupUI{
    self.view.backgroundColor = [UIColor whiteColor];
    UIView *view = [UIView new];
    view.frame = CGRectMake(0, 300, [UIScreen mainScreen].bounds.size.width,30);
    
    
    
    self.adLab.frame = CGRectMake(0, 0, 100, 30);
    self.textField.frame = CGRectMake(100, 0, [UIScreen mainScreen].bounds.size.width-100-5, 30);
    [view addSubview:self.adLab];
    [view addSubview:self.textField];
    
    self.textField.placeholder = self.slotId;
    
    [self.view addSubview:view];
    
    
    [self.view addSubview:self.showBtn];
    self.showBtn.frame = CGRectMake([UIScreen mainScreen].bounds.size.width/2-50, [UIScreen mainScreen].bounds.size.height-300, 100, 30);
}

- (void)showAd{
    
}

-(UILabel *)adLab{
    if (!_adLab) {
        _adLab = [UILabel new];
        _adLab.textColor = [UIColor blackColor];
        _adLab.textAlignment = NSTextAlignmentCenter;
        _adLab.font = [UIFont systemFontOfSize:15];
        _adLab.text = @"广告位ID";
    }
    return _adLab;
}

- (UITextField *)textField{
    if (!_textField) {
        _textField = [[UITextField alloc] init];
        _textField.font = [UIFont systemFontOfSize:15];
        _textField.delegate = self;
        _textField.layer.borderColor = [UIColor blackColor].CGColor;
        _textField.textColor = [UIColor blackColor];
        _textField.layer.borderWidth = 0.5;
        _textField.placeholder = @"45656158648";
    }
    return _textField;
}

- (UIButton *)showBtn{
    if (!_showBtn) {
        _showBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_showBtn setTitle:@"Show" forState:UIControlStateNormal];
        [_showBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_showBtn setBackgroundColor:[UIColor blueColor]];
        [_showBtn addTarget:self action:@selector(showAd) forControlEvents:UIControlEventTouchUpInside];
        _showBtn.layer.cornerRadius = 4;
    }
    return _showBtn;
}

- (void)textFieldDidEndEditing:(UITextField *)textField{
    NSString *newText = [textField.text stringByReplacingOccurrencesOfString:@" " withString:@""];
    if (newText.length == 0) {
        self.slotId = textField.placeholder;
    }else{
        self.slotId = newText;
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
