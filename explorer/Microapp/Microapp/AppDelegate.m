//
//  AppDelegate.m
//  Microapp
//
//  Created by 聂高涛 on 2021/11/23.
//

#import "AppDelegate.h"

#import "MARootViewController.h"
#import "MACollection.h"
#import <YYKit/YYThreadSafeArray.h>
#import <AVKit/AVKit.h>



@interface AppDelegate ()
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    MARootViewController *vc = [[MARootViewController alloc] init];
    
    self.window.rootViewController = [[UINavigationController alloc] initWithRootViewController:vc];
    self.window.backgroundColor = UIColor.whiteColor;
    [self.window makeKeyAndVisible];
    
    return YES;
}
@end
