//
//  MATableViewController.h
//  Microapp
//
//  Created by 聂高涛 on 2021/11/26.
//

#import "MAViewController.h"
#import "MACollection.h"

NS_ASSUME_NONNULL_BEGIN

@interface MATableViewController : MAViewController<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) MACollection *collection;
@end

NS_ASSUME_NONNULL_END
