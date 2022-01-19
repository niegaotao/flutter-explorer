//
//  MVAudioCenter.m
//  Microapp
//
//  Created by 聂高涛 on 2021/11/26.
//

#import "MVAudioCenter.h"
#import "MARequest.h"
#import <AVKit/AVKit.h>

@interface MVAudioCenter ()
@property (nonatomic, strong) AVPlayerItem *item;
@property (nonatomic, strong) AVPlayer *player;
@property (nonatomic, strong) id observer;
@property (nonatomic, strong) NSArray *containers;
@property (nonatomic, strong) MADAV *dav;

@end

@implementation MVAudioCenter
+ (MVAudioCenter *)center{
    static dispatch_once_t t;
    static MVAudioCenter *sharedInstance;
    dispatch_once(&t, ^{
        sharedInstance = [[MVAudioCenter alloc] init];
    });
    return sharedInstance;
}

- (void)start:(MADAV *)dav containers:(NSArray *)containers {
    self.containers = containers;
    [self start:dav];
}

- (void)start:(MADAV *)dav {
    
    [self remove];
    
    //音频播放
    self.dav = dav;
    NSMutableDictionary *videoHeader = [NSMutableDictionary dictionaryWithCapacity:2];
    [videoHeader setObject:[MARequest.center getAuthorization] forKey:@"Authorization"];
    NSString *video = [[MARequest center] getURL:dav.path];
    
    AVURLAsset *asset = [AVURLAsset URLAssetWithURL:[NSURL URLWithString:video] options:@{@"AVURLAssetHTTPHeaderFieldsKey":videoHeader}];
    self.item = [AVPlayerItem playerItemWithAsset:asset];
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(playerDidFinishPlaying) name:AVPlayerItemDidPlayToEndTimeNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(playerFailedToPlayToEnd) name:AVPlayerItemFailedToPlayToEndTimeNotification object:nil];
    
    __weak MVAudioCenter *weakself = self;
    self.player = [AVPlayer playerWithPlayerItem:self.item];
    [self.player addPeriodicTimeObserverForInterval:CMTimeMake(1, 1) queue:dispatch_get_main_queue() usingBlock:^(CMTime time) {
        [weakself updateTime];
    }];

    [self.player play];
    
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 2 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
//        NSInteger duration = self.item.duration.value/MAX(1, self.item.duration.timescale);
//        CMTime current = self.item.currentTime;
//        [self.player seekToTime:CMTimeMake((duration - 60)*current.timescale, current.timescale) completionHandler:nil];
//    });
    
}

- (void)remove {
    if(self.item != nil){
        [[NSNotificationCenter defaultCenter] removeObserver:self name:AVPlayerItemDidPlayToEndTimeNotification object:nil];
        [[NSNotificationCenter defaultCenter] removeObserver:self name:AVPlayerItemFailedToPlayToEndTimeNotification object:nil];
    }
    self.item = nil;
    
    if(self.observer != nil){
        [self.player removeTimeObserver:self.observer];
    }
    self.observer = nil;
}



- (void)stop {
    [self.player pause];
}

- (void)updateTime {
    NSLog(@"updateTime:%ld,%ld", self.item.currentTime.value/MAX(self.item.currentTime.timescale,1), self.item.duration.value/MAX(self.item.duration.timescale,1));
}

- (void)playerDidFinishPlaying{
    NSLog(@"playerDidFinishPlaying");
    NSInteger index = [self.containers indexOfObject:self.dav];
    if(index >= 0 && index < self.containers.count - 2){
        index = index + 1;
        MADAV *__dav = self.containers[index];
        [self start:__dav];
    }
}

- (void)playerFailedToPlayToEnd{
    NSLog(@"playerFailedToPlayToEnd");
}

@end
