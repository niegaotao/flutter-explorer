//
//  MAAudioViewController.m
//  Microapp
//
//  Created by 聂高涛 on 2021/11/26.
//

#import "MAAudioViewController.h"
#import "MVAudioCenter.h"

@interface MAAudioViewController ()

@end

@implementation MAAudioViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = self.dav.name;
    
    [self setupSubviews];
    
    [[MVAudioCenter center] start:self.dav containers:self.elements];
}

@end
