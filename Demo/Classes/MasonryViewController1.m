//
//  MasonryViewController1.m
//  Demo
//
//  Created by Henry on 2019/7/29.
//  Copyright © 2019 Henry. All rights reserved.
//

#import "MasonryViewController1.h"

#import "Masonry.h"

@interface MasonryViewController1 ()

@property (nonatomic, strong) UILabel *label1;

@property (nonatomic, strong) UILabel *label2;

@property (nonatomic, strong) UILabel *label3;

@end

@implementation MasonryViewController1

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIBarButtonItem *buttonItem = [[UIBarButtonItem alloc] initWithTitle:@"切换" style:UIBarButtonItemStylePlain target:self action:@selector(dosomething)];
    self.navigationItem.rightBarButtonItem = buttonItem;
    
    [self.view addSubview:self.label1];
    [self.view addSubview:self.label2];
    [self.view addSubview:self.label3];
    
    [self.label1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view);
        make.top.mas_equalTo(0);
    }];
    
    UIView *gap1 = [UIView new];
    UIView *gap2 = [UIView new];
    [self.view addSubview:gap1];
    [self.view addSubview:gap2];
    
    [gap1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.label1.mas_right);
        make.top.height.equalTo(self.label1);
        make.width.equalTo(gap2);
    }];
    
    [self.label2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(gap1.mas_right);
        make.top.height.equalTo(self.label1);
    }];
    
    [gap2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.label2.mas_right);
        make.top.height.equalTo(self.label1);
    }];
    
    [self.label3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(gap2.mas_right);
        make.top.height.equalTo(self.label1);
        make.right.equalTo(self.view);
    }];
    
    [self dosomething];
}

- (void)dosomething
{
    self.label1.text = [self randomString];
    
    self.label2.text = [self randomString];

    self.label3.text = [self randomString];
}

- (NSString *)randomString
{
    NSString *chars = @"ABCDEFGHIJKLMN";

    uint32_t len = arc4random_uniform((uint32_t)chars.length);
    len = MAX(len, 2);
    
    return [chars substringToIndex:len];
}

- (UILabel *)label1
{
    if (!_label1) {
        _label1 = [[UILabel alloc] init];
    }
    return _label1;
}

- (UILabel *)label2
{
    if (!_label2) {
        _label2 = [[UILabel alloc] init];
    }
    return _label2;
}

- (UILabel *)label3
{
    if (!_label3) {
        _label3 = [[UILabel alloc] init];
    }
    return _label3;
}

@end
