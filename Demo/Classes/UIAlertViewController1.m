//
//  UIAlertViewController1.m
//  Demo
//
//  Created by Henry on 2019/7/30.
//  Copyright © 2019 Henry. All rights reserved.
//

#import "UIAlertViewController1.h"
#import "JCAlertView.h"
#import "Masonry.h"
@interface UIAlertViewController1 ()

@property (nonatomic, strong) UILabel *timeLabel;

@end

@implementation UIAlertViewController1

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIBarButtonItem *buttonItem = [[UIBarButtonItem alloc] initWithTitle:@"弹窗" style:UIBarButtonItemStylePlain target:self action:@selector(dosomething)];
    self.navigationItem.rightBarButtonItem = buttonItem;
    
    UIButton *bgButton = [UIButton buttonWithType:UIButtonTypeCustom];
    bgButton.backgroundColor = [UIColor grayColor];
    [bgButton setTitle:@"显示时间" forState:UIControlStateNormal];
    [bgButton addTarget:self action:@selector(bgButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:bgButton];
    [bgButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.view);
        make.left.right.equalTo(self.view);
        make.height.equalTo(@(50));
    }];
    
    [self.view addSubview:self.timeLabel];
    [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.equalTo(self.view);
    }];
    
}

- (void)dosomething
{
    JCAlertView *alertView = [JCAlertView new];
    [alertView show];
}

- (void)bgButtonAction
{
    NSDateFormatter *formatter = [NSDateFormatter new];
    formatter.dateFormat = @"yyyy-MM-dd HH:mm:ss SSS";
    self.timeLabel.text = [formatter stringFromDate:[NSDate date]];
}

- (UILabel *)timeLabel
{
    if (!_timeLabel) {
        _timeLabel = [[UILabel alloc] init];
    }
    return _timeLabel;
}

@end
