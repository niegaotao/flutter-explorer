//
//  NXProxy.m
//  iOSApp-Objective-C
//
//  Created by 聂高涛 on 2022/1/18.
//

#import "NXProxy.h"

//@implementation NXTimer
//- (id)initWithFireDate:(NSDate *)date interval:(NSTimeInterval)ti target:(id)t selector:(SEL)s userInfo:(id)ui repeats:(BOOL)rep{
//    if(self = [super initWithFireDate:date interval:ti target:t selector:s userInfo:ui repeats:rep]){
//        
//    }
//    return self;
//}
//
//- (void)dealloc {
//    NSLog(@"%s", __func__);
//}
//@end

@implementation NXTimerProxy
- (instancetype)initWithTarget:(NSObject *)target{
    if(self = [super init]){
        self.target = target;
    }
    return self;
}

- (id)forwardingTargetForSelector:(SEL)aSelector {
    NSLog(@"%s-%@", __func__, self.target);
    if(self.target != nil){
        return self.target;
    }
    [self.timer invalidate];
    return nil;
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
    return [NSMethodSignature signatureWithObjCTypes:"v@:"];
}

- (void)forwardInvocation:(NSInvocation *)anInvocation {
    NSLog(@"%s", __func__);
}

- (void)dealloc {
    [self.timer invalidate];
    NSLog(@"%s", __func__);
}
@end
