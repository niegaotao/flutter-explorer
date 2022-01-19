//
//  AppDelegate.swift
//  iOSApp-Swift
//
//  Created by 聂高涛 on 2021/12/26.
//



//UnsafeMutablePointer
//UnsafePointer
//UnsafeMutableRawPointer
//UnsafeRawPointer

import UIKit
@_exported import NXKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    open var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.rootViewController = NXNavigationController(rootViewController: EXMainViewController())
        self.window?.makeKeyAndVisible()
        
        return true
    }
}

