//
//  main.m
//  iOSApp-Objective-C
//
//  Created by 聂高涛 on 2021/12/28.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"




int main(int argc, char * argv[]) {
    NSString * appDelegateClassName;
    @autoreleasepool {
        appDelegateClassName = NSStringFromClass([AppDelegate class]);
    }
    return UIApplicationMain(argc, argv, nil, appDelegateClassName);
}
