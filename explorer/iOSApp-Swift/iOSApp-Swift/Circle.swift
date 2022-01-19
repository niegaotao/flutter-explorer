//
//  NXAnimal.swift
//  iOSApp-Swift
//
//  Created by 聂高涛 on 2021/12/29.
//

import Darwin
import Foundation
//enum BBBBB {
//    case i
//    case d
//    static var x = 0
//}


class Circle {
    static let key = NSObject()
    
    lazy var index = {
        return 1
    }()
    
    var radius : Double {
        willSet{
            print("Circle.radius.willSet:newValue = \(newValue)")
        }
        didSet{
            print("Circle.radius.didSet:oldValue = \(oldValue)")
        }
    }
    
    var area : Double {
        get{
            return Double.pi * pow(radius, 2)
        }
        set{
            self.radius = sqrt(newValue / Double.pi)
        }
    }
    
    init(radius:Double){
        self.radius = radius
        print("init")
    }
}


class Subcircle : Circle {
    override var radius: Double {
        willSet{
            print("Subcircle.radius.willSet:newValue = \(newValue)")
        }
        didSet{
            print("Subcircle.radius.didSet:oldValue = \(oldValue)")
        }
    }
}

