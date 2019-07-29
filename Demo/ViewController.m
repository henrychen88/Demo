//
//  ViewController.m
//  Demo
//
//  Created by Henry on 2019/7/29.
//  Copyright © 2019 Henry. All rights reserved.
//

#import "ViewController.h"

#import "Masonry.h"

@interface ListItem : NSObject

@property (nonatomic, copy) NSString *displayName;

@property (nonatomic, copy) NSString *className;

- (instancetype)initWithDisplayName:(NSString *)displayName
                          className:(NSString *)classsName;

@end

@implementation ListItem

- (instancetype)initWithDisplayName:(NSString *)displayName className:(NSString *)classsName
{
    if (self = [super init]) {
        _displayName = displayName;
        _className = classsName;
    }
    return self;
}

@end

@interface ViewController () <
    UITableViewDelegate,
    UITableViewDataSource
    >

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSArray<ListItem *> *lists;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"示例";
    
    self.lists = @[[[ListItem alloc] initWithDisplayName:@"控件间距相等" className:@"MasonryViewController1"],
                   [[ListItem alloc] initWithDisplayName:@"弹窗1" className:@"UIAlertViewController1"]];
    
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}

- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] init];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"identifier"];
    }
    return _tableView;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.lists.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"identifier" forIndexPath:indexPath];
    
    cell.textLabel.text = self.lists[indexPath.row].displayName;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    ListItem *item = self.lists[indexPath.row];\
    Class class = NSClassFromString(item.className);
    UIViewController *controller = [[class alloc] init];
    controller.title = item.displayName;
    controller.view.backgroundColor = [UIColor whiteColor];
    [self.navigationController pushViewController:controller animated:YES];
}

@end
