//
//  NXAnimal.swift
//  iOSApp-Swift
//
//  Created by 聂高涛 on 2021/12/29.
//

import Darwin
import CoreGraphics

//struct NXAnimal {
//    var name = ""
//
//    //函数用mutating修饰
//    mutating func func1(_ name:String){
//        self.name = name;
//    }
//
//    //函数不用mutating修饰
//    func func2(_ name:String){
//        print("oldValue=\(self.name),newValue=\(name)")
//    }
//
//    func func3(_ name:String, _ animal:inout NXAnimal){
//        animal.name = name
//    }
//
//    static func func4(){
//
//    }
//}

struct NXAnimal {
  let id : Int
  var name : String
  init(_ id:Int, _ name:String){
    self.id = id
    self.name = name
  }
}
