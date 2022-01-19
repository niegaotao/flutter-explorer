//
//  MAVideoViewController.m
//  Microapp
//
//  Created by 聂高涛 on 2021/11/26.
//

#import "MAVideoViewController.h"
#import "MARequest.h"
#import <AVKit/AVKit.h>

@interface MAVideoViewController ()

@end

@implementation MAVideoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = self.dav.name;
    
    [self setupSubviews];
    
    //视频播放
    NSMutableDictionary *videoHeader = [NSMutableDictionary dictionaryWithCapacity:2];
    [videoHeader setObject:[MARequest.center getAuthorization] forKey:@"Authorization"];
    NSString *video = [[MARequest center] getURL:self.dav.path];
    
    AVURLAsset *asset = [AVURLAsset URLAssetWithURL:[NSURL URLWithString:video] options:@{@"AVURLAssetHTTPHeaderFieldsKey":videoHeader}];
    AVPlayerItem *item = [AVPlayerItem playerItemWithAsset:asset];
    AVPlayer *player = [AVPlayer playerWithPlayerItem:item];
    
    AVPlayerLayer *layer = [AVPlayerLayer playerLayerWithPlayer:player];
    layer.backgroundColor = [UIColor redColor].CGColor;
    layer.frame = CGRectMake(0, 0, UIScreen.mainScreen.bounds.size.width, UIScreen.mainScreen.bounds.size.width * 9/ 16.0);
    [self.contentView.layer addSublayer:layer];
    [player play];
}

@end
