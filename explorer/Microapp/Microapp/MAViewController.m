//
//  MAViewController.m
//  Microapp
//
//  Created by 聂高涛 on 2021/11/26.
//

#import "MAViewController.h"

@interface MAViewController ()

@end

@implementation MAViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)setupSubviews{
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.contentView = [[UIView alloc] initWithFrame:CGRectMake(0, 88, self.view.bounds.size.width, self.view.bounds.size.height-88)];
    self.contentView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.contentView];
}

- (void)updateSubviews:(NSString *)operation value:(id)value{
    
}

@end
