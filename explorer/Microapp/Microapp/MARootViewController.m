//
//  ViewController.m
//  Microapp
//
//  Created by 聂高涛 on 2021/11/23.
//

#import "MARootViewController.h"
#import "MARequest.h"
#import <YYKit/UIImageView+YYWebImage.h>
#import <YYKit/NSString+YYAdd.h>
#import <YYKit/NSData+YYAdd.h>
#import <AVKit/AVKit.h>
#import "MAListViewController.h"


#import "MATester.h"
#import "NXBlock.h"
#import "NXRuntime.h"
#import "NXRunloop.h"

@interface MARootViewController ()
{
    NXRunloop *_runloop;
}
@end

@implementation MARootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"Microapp";
    self.view.backgroundColor = UIColor.whiteColor;

//    MATester *tester = [[MATester alloc] init];
//    [tester main];
    NXBlock *block = [[NXBlock alloc] init];
    [block main];
//    
//    NXRuntime *runtime = [[NXRuntime alloc] init];
//    [runtime main];
//
//    _runloop = [[NXRunloop alloc] init];
//    [_runloop main];
    
    
    UIButton  *v = [[UIButton alloc] initWithFrame:CGRectMake((UIScreen.mainScreen.bounds.size.width-200)/2.0, 400, 200, 60)];
    [v addTarget:self action:@selector(forward) forControlEvents:UIControlEventTouchUpInside];
    v.backgroundColor = UIColor.redColor;
    [self.view addSubview:v];
}

- (void)forward{
//    MAListViewController *vc = [[MAListViewController alloc] init];
//    vc.dav.path = @"/";
//    [self.navigationController pushViewController:vc animated:YES];
//    if (_runloop.mode == NSDefaultRunLoopMode){
//        _runloop.mode = NSRunLoopCommonModes;
//    }
//    else {
//        _runloop.mode = NSDefaultRunLoopMode;
//    }
}

@end


