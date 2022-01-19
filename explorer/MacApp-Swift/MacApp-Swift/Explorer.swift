//
//  Explorer.swift
//  MacApp-Swift
//
//  Created by 聂高涛 on 2021/12/29.
//

import Cocoa



struct NXAnimal {
    var age : Int = 0
    var name : String = ""
    
    mutating func update(_ age:Int, _ name:String){
        self.age = age
        self.name = name
    }
}

//class NXPerson  {
//    var age : Int = 0
//    var name : String = ""
//
//    init(age:Int, name:String){
//        self.age = age
//        self.name = name
//    }
//    init(){
//        self.age = 0
//        self.name = ""
//    }
//}

//struct HeapObject {
//    var metadata : UnsafeRawPointer
//    var ref1: UInt32
//    var ref2: UInt32
//}
//
//struct Metadata{
//  var kind: Int
//  var superClass: Any.Type
//  var cacheData: (Int, Int)
//  var data: Int
//  var classFlags: Int32
//  var instanceAddressPoint: UInt32
//  var instanceSize: UInt32
//  var instanceAlignmentMask: UInt16
//  var reserved: UInt16
//  var classSize: UInt32
//  var classAddressPoint: UInt32
//  var typeDescriptor: UnsafeMutableRawPointer
//  var iVarDestroyer: UnsafeRawPointer
//}


class Explorer {
    static func main(){
        testMetadata()
    }
    
    static func testMetadata(){
        var animal = NXAnimal(age: 2, name: "Cat")
        animal.update(18, "Dog")
        
        
//        let person = NXPerson(age: 18, name: "Swifter")
//        var person2 = person;
//        person2.name = "iOSer"
//
//
//        let objRawPtr = Unmanaged.passUnretained(person2 as AnyObject).toOpaque()
//        let objcPtr = objRawPtr.bindMemory(to: HeapObject.self, capacity: 1)
//
//        let metadata = objcPtr.pointee.metadata.bindMemory(to: Metadata.self, capacity: MemoryLayout<Metadata>.stride).pointee
//        print(objcPtr.pointee)
//        print(metadata)
    }
    
    
}
