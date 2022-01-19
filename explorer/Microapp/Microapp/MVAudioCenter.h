//
//  MVAudioCenter.h
//  Microapp
//
//  Created by 聂高涛 on 2021/11/26.
//

#import <Foundation/Foundation.h>
#import "MADAV.h"

NS_ASSUME_NONNULL_BEGIN

@interface MVAudioCenter : NSObject
+ (MVAudioCenter *)center;
- (void)start:(MADAV *)dav containers:(NSArray *)containers;
- (void)start:(MADAV *)dav;
@end

NS_ASSUME_NONNULL_END
