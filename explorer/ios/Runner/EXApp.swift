//
//  EXApp.swift
//  Runner
//
//  Created by 聂高涛 on 2022/2/15.
//

import UIKit
import NXKit
import Photos

open class EXApp {
    static let naviController = NXNavigationController()
}

extension EXApp {
    open class Descriptor {
        static public var album :(title:String,subtitle:String, content:String) = ("权限不足","无法访问照片，请按以下提示设置","请在iPhone-设置(下滑找到)-人人相册-照片，设置为“读取和写入”后，即可使用、选择、保存照片啦～")
        static public var camera :(title:String,subtitle:String, content:String) = ("权限不足","无法访问相机，请按以下提示设置","请在iPhone-设置(下滑找到)-人人相册-相机，设置为打开后，即可使用相机拍摄照片和视频啦～")
        static public var apns :(title:String,subtitle:String, content:String) = ("","","")
        static public var network :(title:String,subtitle:String, content:String) = ("无法连接","网络错误,或未授权网络连接","如果网络不好请检查网络或稍后再试。如未授权网络连接请在人人相册-无线数据，设置为“WLAN与蜂窝移动网”后，再试试看哦")
        static public var microphone :(title:String,subtitle:String, content:String) = ("权限不足","无法使用麦克风，请按以下提示设置","请在iPhone-设置(下滑找到)-人人相册-麦克风，设置为打开后，即可使用麦克风录音啦～")
    }

    //获取授权/请求授权入口
    open class func authorization(_ category: NX.Authorize, _ queue:DispatchQueue, _ completion:((NX.AuthorizeState) -> ())?, _ alert: Bool = true){
        if category == NX.Authorize.album {
            self.albumAuthorization(queue, alert, completion)
        }
        else if category == NX.Authorize.camera {
            self.cameraAuthorization(queue, alert, completion)
        }
        else if category == NX.Authorize.microphone {
            //self.microphoneAuthorization(queue, alert, completion)
        }
        else if category == NX.Authorize.apns {
            self.apnsAuthorization(queue, alert, completion)
        }
        else if category == NX.Authorize.network {
            self.networkAuthorization(queue, alert,  completion)
        }
    }
    
    
    private class func albumAuthorization(_ queue:DispatchQueue, _ alert:Bool, _ completion:((NX.AuthorizeState) -> ())?){
        
        
        if #available(iOS 14.0, *) {
            let status = PHPhotoLibrary.authorizationStatus(for: .readWrite)
            
            if status == .authorized || status == .limited  {
                queue.async {
                    completion?(.authorized)
                }
            }
            else if status == .notDetermined {
                PHPhotoLibrary.requestAuthorization(for: .readWrite) { (substatus) in
                    if substatus == .authorized {
                        queue.async {
                            completion?(.authorized)
                        }
                    }
                    else {
                        queue.async {
                            completion?(.denied)
                        }
                        
                        if alert {
                            EXApp.authorizationViewDisplay(.album)
                        }
                    }
                }
            }
            else {
                queue.async {
                    completion?(.denied)
                }
                
                if alert {
                    EXApp.authorizationViewDisplay(.album)
                }
            }
        }
        else {
            let status = PHPhotoLibrary.authorizationStatus()
            if status == .authorized {
                queue.async {
                    completion?(.authorized)
                }
            }
            else if status == .notDetermined {
                PHPhotoLibrary.requestAuthorization { (substatus) in
                    if substatus == .authorized {
                        queue.async {
                            completion?(.authorized)
                        }
                    }
                    else{
                        queue.async {
                            completion?(.denied)
                        }
                        
                        if alert {
                            EXApp.authorizationViewDisplay(.album)
                        }
                    }
                }
            }
            else{
                queue.async  {
                    completion?(.denied)
                }
                if alert {
                    EXApp.authorizationViewDisplay(.album)
                }
            }
        }
    }
    
    private class func cameraAuthorization(_ queue:DispatchQueue, _ alert: Bool, _ completion:((NX.AuthorizeState) -> ())?){
        let status = AVCaptureDevice.authorizationStatus(for: .video)
        if status ==  .authorized{
            queue.async {
                completion?(.authorized)
            }
        }
        else if status == .notDetermined{
            AVCaptureDevice.requestAccess(for: .video) { (granted) in
                if granted {
                    queue.async {
                        completion?(.authorized)
                    }
                }
                else{
                    queue.async {
                        completion?(.denied)
                    }
                    EXApp.authorizationViewDisplay(.camera)
                }
            }
        }
        else{
            queue.async {
                completion?(.denied)
            }
            EXApp.authorizationViewDisplay(.camera)
        }
    }
    
//    private class func microphoneAuthorization(_ queue:DispatchQueue, _ alert: Bool, _ completion:((NX.AuthorizeState) -> ())?) {
//        let status = AVCaptureDevice.authorizationStatus(for: .audio)
//        if status ==  .authorized{
//            queue.async {
//                completion?(.authorized)
//            }
//        }
//        else if status == .notDetermined{
//            AVCaptureDevice.requestAccess(for: .audio) { (granted) in
//                if granted {
//                    queue.async {
//                        completion?(.authorized)
//                    }
//                }
//                else{
//                    queue.async {
//                        completion?(.denied)
//                    }
//                    EXApp.authorizationViewDisplay(.microphone)
//                }
//            }
//        }
//        else{
//            queue.async {
//                completion?(.denied)
//            }
//            EXApp.authorizationViewDisplay(.microphone)
//        }
//    }

    
    private class func apnsAuthorization(_ queue:DispatchQueue, _ alert: Bool, _ completion:((NX.AuthorizeState) -> ())?){
        if #available(iOS 10.0, *) {
            UNUserNotificationCenter.current().getNotificationSettings{(setting) in
                if setting.authorizationStatus == .authorized {
                    queue.async {
                        completion?(.authorized)
                    }
                }
                else if setting.authorizationStatus == .notDetermined {
                    queue.async {
                        completion?(.notDetermined)
                    }
                }
                else{
                    queue.async {
                        completion?(.denied)
                    }
                }
            }
        }
        else{
            if let setting = UIApplication.shared.currentUserNotificationSettings {
                if setting.types != [] {
                    queue.async {
                        completion?(.authorized)
                    }
                }
                else {
                    queue.async {
                        completion?(.denied)
                    }
                }
            }
            else{
                queue.async {
                    completion?(.denied)
                }
            }
        }
    }
    
    private class func networkAuthorization(_ queue:DispatchQueue, _ alert: Bool, _ completion:((NX.AuthorizeState) -> ())?) {
        queue.async {
            completion?(.authorized)
        }
    }
    
    open class func description(_ type: NX.Authorize) -> (title:String,subtitle:String,content:String){
        if type == NX.Authorize.album {
            return EXApp.Descriptor.album
        }
        else if type == NX.Authorize.camera{
            return EXApp.Descriptor.camera
        }
        else if type == NX.Authorize.apns {
            return EXApp.Descriptor.apns
        }
        else if type == NX.Authorize.network {
            return EXApp.Descriptor.network
        }
        else if type == NX.Authorize.microphone {
            return EXApp.Descriptor.microphone
        }
        return ("", "", "")
    }
    
    open class func authorizationViewDisplay(_ type: NX.Authorize, _ completion:((_ index:Int) -> ())? = nil){
        DispatchQueue.main.async {
            if type == .album || type == .camera || type == .contacts || type == .loaction || type == .microphone || type == .network {
                DispatchQueue.main.async {
                    let description = EXApp.description(type)

                    NXActionView.alert(title: description.title, subtitle: description.content, actions: ["我再想想", "前往设置"]) { (_, idx) in
                        if idx == 1 {
                            if let url = URL(string: UIApplication.openSettingsURLString) {
                                NX.open(url, [:], completion: nil)
                            }
                            completion?(1)
                        }
                    }
                }
            }
            else if type == .apns {
                //APNs特殊定制
            }
        }
    }
}
