//
//  JCAlertView.m
//  Demo
//
//  Created by Henry on 2019/7/30.
//  Copyright © 2019 Henry. All rights reserved.
//

#import "JCAlertView.h"

#import "Masonry.h"

@interface JCAlertView ()
{
    UIView *contentView;
}

@end

@implementation JCAlertView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.frame = [UIScreen mainScreen].bounds;
        [self setupSubviews];
    }
    return self;
}

- (void)setupSubviews
{
    UIButton *bgButton = [UIButton buttonWithType:UIButtonTypeCustom];
    bgButton.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.1];
    [bgButton addTarget:self action:@selector(bgButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:bgButton];
    [bgButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
    
    contentView = [[UIView alloc] init];
    contentView.backgroundColor = [UIColor whiteColor];
    contentView.layer.cornerRadius = 10;
    [self addSubview:contentView];
    [contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(200);
        make.height.mas_equalTo(200);
        make.center.equalTo(self);
    }];
    
    UILabel *titleLabel = [UILabel new];
    titleLabel.text = @"警告";
    titleLabel.font = [UIFont boldSystemFontOfSize:20];
    [contentView addSubview:titleLabel];
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(20);
        make.centerX.equalTo(self->contentView);
    }];
    
    UILabel *contentLabel = [UILabel new];
    contentLabel.text = @"网络出错，请重试";
    contentLabel.font = [UIFont systemFontOfSize:15];
    [contentView addSubview:contentLabel];
    [contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(titleLabel.mas_bottom).offset(20);
        make.centerX.equalTo(self->contentView);
    }];
    
    UIButton *button = [[UIButton alloc] init];
    [button setTitle:@"确定" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button setBackgroundColor:[UIColor orangeColor]];
    [button.layer setCornerRadius:5];
    [button addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside];
    [contentView addSubview:button];
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(20);
        make.right.mas_equalTo(-20);
        make.bottom.mas_equalTo(-20);
        make.height.mas_equalTo(40);
    }];
}

- (void)buttonAction
{
    [self removeFromSuperview];
}

- (void)bgButtonAction
{
    [self removeFromSuperview];
}

- (void)show
{
    [[UIApplication sharedApplication].keyWindow addSubview:self];
}

- (void)dealloc
{
    NSLog(@"%s", __func__);
}

//- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
//{
//    if (CGRectContainsPoint(contentView.frame, point)) {
//        return self;
//    }
//    return [super hitTest:point withEvent:event];
//}

- (BOOL)pointInside:(CGPoint)point withEvent:(nullable UIEvent *)event
{
    if (CGRectContainsPoint(contentView.frame, point)) {
        return YES;
    }
    [self buttonAction];
    return NO;
}

@end
