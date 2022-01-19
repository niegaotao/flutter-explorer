//
//  NXViewController.m
//  iOSApp-Objective-C
//
//  Created by 聂高涛 on 2022/1/18.
//

#import "NXViewController.h"

@interface NXViewController ()

@end

@implementation NXViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.contentView = [[UIView alloc] initWithFrame:CGRectMake(0, 88, self.view.bounds.size.width, self.view.bounds.size.height - 88)];
    self.contentView.backgroundColor = UIColor.whiteColor;
    [self.view addSubview:self.contentView];
}


@end
