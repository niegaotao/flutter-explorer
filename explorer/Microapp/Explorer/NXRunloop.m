//
//  NXRunloop.m
//  Microapp
//
//  Created by 聂高涛 on 2021/12/14.
//
#import <CoreFoundation/CFRunLoop.h>

#import "NXRunloop.h"


@implementation NXRunloop
- (void)main{
    self.mode = NSRunLoopCommonModes;
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSTimer *timer1 = [NSTimer timerWithTimeInterval:2 repeats:true block:^(NSTimer * _Nonnull timer) {
            NSLog(@"timer-1");
        }];
        NSTimer *timer2 = [NSTimer timerWithTimeInterval:2 repeats:true block:^(NSTimer * _Nonnull timer) {
            NSLog(@"timer-2");
        }];
        
        [[NSRunLoop currentRunLoop] addTimer:timer1 forMode:NSDefaultRunLoopMode];
        [[NSRunLoop currentRunLoop] addTimer:timer2 forMode:NSRunLoopCommonModes];
        while (1) {
            [[NSRunLoop currentRunLoop] runMode:self.mode beforeDate:[NSDate distantFuture]];
        }
        
        //CFRunLoopRef runloop = [[NSRunLoop currentRunLoop] getCFRunLoop];
//        CFRunLoopRun()
        
    });
}
@end
