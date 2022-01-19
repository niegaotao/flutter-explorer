//
//  MAListViewController.h
//  Microapp
//
//  Created by 聂高涛 on 2021/11/26.
//

#import "MATableViewController.h"
#import "MADAV.h"


NS_ASSUME_NONNULL_BEGIN

@interface MAListViewController : MATableViewController
@property (nonatomic, strong) MADAV *dav;
@end

NS_ASSUME_NONNULL_END
