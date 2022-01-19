//
//  MATableViewController.m
//  Microapp
//
//  Created by 聂高涛 on 2021/11/26.
//

#import "MATableViewController.h"

@interface MATableViewController ()

@end

@implementation MATableViewController

- (instancetype)init {
    if(self = [super init]){
        self.collection = [[MACollection alloc] init];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)setupSubviews {
    [super setupSubviews];
    
    self.tableView = [[UITableView alloc] initWithFrame:self.contentView.bounds style:UITableViewStyleGrouped];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 1, 0.1)];
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 1, 0.1)];
    [self.contentView addSubview:self.tableView];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    MAElement *element = [self.collection elementAtIndexPath:indexPath];
    return element.ctxs.height;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.collection.elements.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    id __collection = [self.collection elementAtIndex:section];
    if(__collection && [__collection isKindOfClass:[MACollection class]]){
        return [(MACollection *)__collection elements].count;
    }
    return 0;
}
@end
