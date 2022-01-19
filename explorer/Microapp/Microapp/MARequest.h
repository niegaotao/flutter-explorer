//
//  MARequest.h
//  Microapp
//
//  Created by 聂高涛 on 2021/11/25.
//

#import <Foundation/Foundation.h>
#import <GCDWebServer/GCDWebDAVServer.h>


NS_ASSUME_NONNULL_BEGIN

@interface MARequest : NSObject
@property (nonatomic, strong) NSString *domain;
@property (nonatomic, strong) NSString *port;
@property (nonatomic, strong) NSString *username;
@property (nonatomic, strong) NSString *password;

+ (MARequest *)center;
- (NSString *)getURL:(NSString *)path;
- (NSString *)getAuthorization;

- (void)fetch:(NSString *)path depth:(NSInteger)depth propfind:(NSString *)propfind completion:(nullable void(^)(NSArray *paths))completion;
@end

NS_ASSUME_NONNULL_END
