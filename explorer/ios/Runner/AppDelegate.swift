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
                NXAsset.album(minOfAssets: 1, maxOfAssets: 18, image: (0, 18, true), video: (0, 18, true), isMixable: true, isAutoclosed: true, mediaType: .unknown, selectedIdentifiers: [], outputResize: CGSize(width: 1920, height: 1920), outputResizeBy: "area", outputUIImage: true, clips: [], videoClipsAllowed: false, videoClipsDuration: 15, videoFileExtensions: [".mov", ".mp4"], footer: (false, false, true), navigation: .present, naviController: EXApp.naviController, openAllowed: true, closeAllowed: true, isAnimated: true) { action, value in
                }
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
