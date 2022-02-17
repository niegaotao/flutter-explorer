//
//  EXAppViewController.swift
//  FlutterApp
//
//  Created by 聂高涛 on 2021/11/26.
//

import UIKit
@_exported import Flutter


class EXAppViewController: NXViewController {
    let engine = FlutterEngine(name: "explorer")
    
    var flutter : FlutterViewController? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    
        self.engine.run()
        
        self.flutter = FlutterViewController(engine: self.engine, nibName: nil, bundle: nil)
        
        self.naviView.title = "EXAppViewController"
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let __flutter = self.flutter {
            let mc = FlutterMethodChannel(name: "explorer", binaryMessenger: __flutter.binaryMessenger)
            mc.setMethodCallHandler { method, result in
                if(method.method == "exit"){
                    NX.print(method.method)
                    
                    self.flutter?.dismiss(animated: true, completion: nil)
                }
            }
            self.present(__flutter, animated: true, completion: nil)
            
//            let channel = FlutterBasicMessageChannel(name: "explorer", binaryMessenger: __flutter.binaryMessenger)
//            channel.setMessageHandler { value, reply in
//                //收到来自flutter的消息
//            }
//            channel.sendMessage("----")//发送给flutter的消息
            
        }
        
        
    }
}

