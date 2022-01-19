//
//  AppDelegate.m
//  iOSApp-Objective-C
//
//  Created by 聂高涛 on 2021/12/28.
//

#import "AppDelegate.h"
#import "EXMainViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:UIScreen.mainScreen.bounds];
    self.window.backgroundColor = UIColor.whiteColor;
    self.window.rootViewController = [[UINavigationController alloc] initWithRootViewController:[[EXMainViewController alloc] init]];
    [self.window makeKeyAndVisible];
    return YES;
    
}
@end
