//
//  Raw.swift
//  iOSApp-Swift
//
//  Created by 聂高涛 on 2022/1/11.
//

import UIKit

class TypeMirror {

    static func start(){
        let c = Company()
        c.uuid = "0xiii"
        c.name = "如果有明天"
        c.address = "武汉江夏"
        print(c)
        TypeDescriptor.typeDescriptor(c)
        
//        if true {
//            let mirror = Mirror(reflecting: Company.self)
//            for pro in mirror.children {
//                print("label=\(pro.label),value=\(pro.value)")
//            }
//        }
        
        
        if true {
            
            print("mirror:\(c.toMap())")
        }
        
        
    }
}

protocol JSONMapper {
    func toMap() -> Any?
}

extension JSONMapper {
    func toMap() -> Any? {
        var result = [String:Any?]()

        let mirror = Mirror(reflecting: self)
        self.reflecting(mirror: mirror, result: &result)
        
        return result
    }
    
    func reflecting(mirror:Mirror?, result:inout [String:Any?], loop:Bool = true){
        if let mirror = mirror {
            if mirror.children.count > 0 {
                for child in mirror.children {
                    guard let key = child.label else {
                        continue;
                    }
                    if let realValue = (child.value as? JSONMapper)?.toMap() {
                        result[key] = realValue
                    }
                    else {
                        result[key] = nil
                    }
                }
            }
        }
        if loop == true, let superMirror = mirror?.superclassMirror {
            self.reflecting(mirror: superMirror, result: &result)
        }
    }
}

extension Int : JSONMapper {
    func toMap() -> Any? {
        return self
    }
}

extension String : JSONMapper {
    func toMap() -> Any? {
        return self
    }
}

class Entity: JSONMapper {
    var uuid = ""
}

class Company : Entity, CustomReflectable {
    var name = ""
    var address = ""
    
    var customMirror: Mirror {
        return Mirror.init(self, children: ["uuid":self.uuid, "name":self.name, "address":self.address], displayStyle: .class)
    }
}




