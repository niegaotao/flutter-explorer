import UIKit
@_exported import Flutter
@_exported import NXKit

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    let rootViewController = FlutterViewController()
    
    let picker = UIImagePickerController()
    var mc : FlutterMethodChannel? = nil
    override func application( _ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        print("application(_:,didFinishLaunchingWithOptions:)")

        GeneratedPluginRegistrant.register(with: self)
        
//        self.window = UIWindow(frame: UIScreen.main.bounds)
//        self.window?.rootViewController = EXApp.naviController
//        self.window?.backgroundColor = UIColor.white
//        self.window?.makeKeyAndVisible()
//
//        EXApp.naviController.pushViewController(rootViewController, animated: false)
        
        
        let vc = self.window?.rootViewController as! FlutterViewController
        self.mc = FlutterMethodChannel.init(name:"pages/owner", binaryMessenger:vc as! FlutterBinaryMessenger)
        self.mc?.setMethodCallHandler({[weak self] (call, result) in
            guard let self = self else {
                return
            }
            NX.print(call.method)
            if call.method == "choosePicture" {
                self.picker.delegate = self
                self.picker.sourceType = .photoLibrary
                vc.present(self.picker, animated:true)
            }
            else if call.method == "UIImagePickerController" {
                self.picker.delegate = self
                self.picker.sourceType = .photoLibrary
                vc.present(self.picker, animated:true)
            }
            else if call.method == "NXAssetsViewController" {
                NXActionView.alert(title: "温馨提示", subtitle: "暂时没有实现吗", actions: ["好的"], completion: nil)
            }
        });
        
        
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
    
    public func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        print("imagePickerController(:,didFinishPickingMediaWithInfo:)")
        if #available(iOS 11.0, *) {
            if let imageURL = info[UIImagePickerController.InfoKey.imageURL]  as? URL{
                self.mc?.invokeMethod("image", arguments:imageURL.absoluteString);
            }
        } else {
            // Fallback on earlier versions
        }
        
        picker.dismiss(animated: true, completion: nil)
    }
    
    public func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        print("imagePickerControllerDidCancel(:)")
        picker.dismiss(animated: true, completion: nil)
    }
}
