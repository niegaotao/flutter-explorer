//
//  EXDetailViewController.m
//  iOSApp-Objective-C
//
//  Created by 聂高涛 on 2022/1/18.
//

#import "EXDetailViewController.h"
#import "NXProxy.h"
#import "EXExtendViewController.h"
#import <YYKit/YYTimer.h>

@interface EXDetailViewController ()
@property (nonatomic, strong) NXTimerProxy *proxy;
@property (nonatomic, strong) YYTimer *timer;
@end

@implementation EXDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"EXDetailViewController";
//    self.proxy = [[NXTimerProxy alloc] initWithTarget:self];
//    self.proxy.timer = [NSTimer scheduledTimerWithTimeInterval:1.5 target:self.proxy selector:@selector(test) userInfo:nil repeats:YES];
//    self.timer = [YYTimer timerWithTimeInterval:1.5 target:self selector:@selector(test) repeats:YES];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    EXExtendViewController *vc = [[EXExtendViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    NSLog(@"%s", __func__);
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    NSLog(@"%s", __func__);
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    NSLog(@"%s", __func__);
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    NSLog(@"%s", __func__);
}

- (void)didMoveToParentViewController:(UIViewController *)parent {
    [super didMoveToParentViewController:parent];
    NSLog(@"%s-%@", __func__, parent);
    if(parent){
        //push
        //[self.timer invalidate];
    }
    else {
        //pop
        //[self.timer invalidate];
    }
}

- (void)test{
    NSLog(@"%s", __func__);
}

- (void)dealloc {
    [self.proxy.timer invalidate];
    NSLog(@"%s", __func__);
}


@end
