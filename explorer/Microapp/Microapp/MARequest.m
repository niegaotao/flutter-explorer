//
//  MARequest.m
//  Microapp
//
//  Created by 聂高涛 on 2021/11/25.
//

#import "MARequest.h"
#import <YYKit/NSString+YYAdd.h>
#import <YYKit/NSData+YYAdd.h>

@interface MARequest ()
@property (nonatomic, strong) GCDWebDAVServer *server;
@end


@implementation MARequest
+ (MARequest *)center{
    static dispatch_once_t t;
    static MARequest *sharedInstance;
    dispatch_once(&t, ^{
        sharedInstance = [[MARequest alloc] init];
    });
    return sharedInstance;
}

- (instancetype)init {
    if(self = [super init]){
        self.domain = @"http://10.4.250.102";
        self.port = @"12345";
        self.username = @"admin";
        self.password = @"admin";
    }
    return self;
}

- (NSString *)getURL:(NSString *)path {
    return [NSString stringWithFormat:@"%@:%@%@", self.domain, self.port, [path stringByURLEncode]];
}

- (NSString *)getAuthorization{
    NSString *base = [NSString stringWithFormat:@"%@:%@", self.username, self.password];
    return [NSString stringWithFormat:@"Basic %@", [base base64EncodedString]];
}

- (void)fetch:(NSString *)path depth:(NSInteger)depth propfind:(NSString *)propfind completion:(nullable void(^)(NSArray *paths))completion {
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    request.cachePolicy = NSURLRequestReloadIgnoringLocalCacheData;
    request.URL = [NSURL URLWithString:path];
    request.timeoutInterval = 30;
    request.HTTPMethod = @"PROPFIND";
    //[request addValue:@"Basic realm=admin:admin" forHTTPHeaderField:@"WWW-Authenticate"];
    [request addValue:[MARequest.center getAuthorization] forHTTPHeaderField:@"Authorization"];

    NSString *xml = [NSString stringWithFormat:@"<?xml version=\"1.0\" encoding=\"utf-8\" ?>\n<D:propfind xmlns:D=\"DAV:\"><D:allprop/>%@</D:propfind>", propfind];

    if (depth > 1) {
        // http://tools.ietf.org/html/rfc2518#section-9.2
        [request setValue:@"infinity" forHTTPHeaderField:@"Depth"];
    }
    else {
        [request setValue:[NSString stringWithFormat:@"%d", depth] forHTTPHeaderField:@"Depth"];
    }
    [request setHTTPBody:[xml dataUsingEncoding:NSUTF8StringEncoding]];

    NSURLSessionDataTask *task = [[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        NSString *string = [data utf8String];
        NSLog(@"data:\n%@", string);
        NSLog(@"response:\n%@", response);
        NSLog(@"error:\n%@", error);

        if(string && string.length > 0) {
            NSString *letter = @"(?<=<D:href>).*?(?=</D:href>)";
            NSRegularExpression *ex = [[NSRegularExpression alloc] initWithPattern:letter options:0 error:NULL];
            NSArray *results = [ex matchesInString:string options:0 range:NSMakeRange(0, string.length)];
            
            NSMutableArray *paths = [NSMutableArray arrayWithCapacity:30];
            
            for(NSTextCheckingResult *result in results) {
                NSString *path = [string substringWithRange:result.range];
                path = [path stringByURLDecode];
                [paths addObject:path];
            }
            
            
            NSLog(@"paths:\n%@", paths);
            
            dispatch_async(dispatch_get_main_queue(), ^{
                if(completion){
                    completion(paths);
                }
            });
        }
    }];
    [task resume];
}



@end
