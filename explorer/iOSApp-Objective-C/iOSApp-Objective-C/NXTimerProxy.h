//
//  NXProxy.h
//  iOSApp-Objective-C
//
//  Created by 聂高涛 on 2022/1/18.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

//@interface NXTimer : NSTimer
//
//@end

@interface NXTimerProxy : NSObject
@property (nonatomic, weak) NSObject *target;
@property (nonatomic, strong) NSTimer *timer;
- (instancetype)initWithTarget:(NSObject *)target;
@end

NS_ASSUME_NONNULL_END
