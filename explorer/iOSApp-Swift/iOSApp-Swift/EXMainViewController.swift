//
//  EXMainViewController.swift
//  iOSApp-Swift
//
//  Created by 聂高涛 on 2021/12/26.
//

import UIKit

protocol MyProtocol {
    var x  : Int {get set}
    var y : Int {get set}
    var z : Int {get set}
    var t : Int {get set}
    var vc : EXMainViewController {get set}
    func test()
}

extension Myprotocol {
    func test() {
        print("Myprotocol")
    }
}

class MyStruct: MyProtocol {
    var x  = 10
    var y = 11
    var z = 12
    var t = 13
    var vc = EXMainViewController()
}

extension MyStruct {
    func test() {
        print("MyStruct")
    }
}

class EXMainViewController: NXViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.naviView.title = "EXMainViewController"
        
//        var struct1: MyProtocol = MyStruct()
//        struct1.vc.title = "1"
//
//        var struct2: MyProtocol = struct1
//        struct2.vc.title = "2"
        
//        var struct1: MyProtocol = MyStruct()
//        struct1.test()//MyStruct
        
        
        var struct2 : MyProtocol = MyStruct()
        struct2.test()//MyStruct
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if true {
            print("EXvalue.size=\(MemoryLayout<EXValue>.size), stride=\(MemoryLayout<EXValue>.stride)")
            var z11 = EXValue.c11(true)
            var z88 = EXValue.c(true)
            withUnsafePointer(to: &z11) { (p) in print("p:\(p)")}
            withUnsafePointer(to: &z88) { (p) in print("p:\(p)")}
        }
        
        if false {
            print("EXAssociation.size=\(MemoryLayout<EXAssociation>.size), stride=\(MemoryLayout<EXAssociation>.stride)")
            var zero1 = EXAssociation.zero1
//            var one1 = EXAssociation.one1(240)
//            var two1 = EXAssociation.two1(240, true)
            var three1 = EXAssociation.three1(240, true, 245)

            var zero2 = EXAssociation.zero2
//            var one2 = EXAssociation.one2(240)
//            var two2 = EXAssociation.two2(240, true)
            var three2 = EXAssociation.three2(240, true, 245)

            var zero3 = EXAssociation.zero3
//            var one3 = EXAssociation.one3(240)
//            var two3 = EXAssociation.two3(240, true)
//            var three3 = EXAssociation.three3(240, true, 245)

            withUnsafePointer(to: &zero1) { (p) in print("p:\(p)")}
//            withUnsafePointer(to: &one1) { (p) in print("p:\(p)")}
//            withUnsafePointer(to: &two1) { (p) in print("p:\(p)")}
            withUnsafePointer(to: &three1) { (p) in print("p:\(p)")}

            withUnsafePointer(to: &zero2) { (p) in print("p:\(p)")}
//            withUnsafePointer(to: &one2) { (p) in print("p:\(p)")}
//            withUnsafePointer(to: &two2) { (p) in print("p:\(p)")}
            withUnsafePointer(to: &three2) { (p) in print("p:\(p)")}

            withUnsafePointer(to: &zero3) { (p) in print("p:\(p)")}
//            withUnsafePointer(to: &one3) { (p) in print("p:\(p)")}
//            withUnsafePointer(to: &two3) { (p) in print("p:\(p)")}
//            withUnsafePointer(to: &three3) { (p) in print("p:\(p)")}
            
        }
        
        
        if false {
            print("EXWorkday.size=\(MemoryLayout<EXWorkday>.size), stride=\(MemoryLayout<EXWorkday>.stride)")
            var v1 = EXWorkday.workday(true)
            var v2 = EXWorkday.weekend(true)
            withUnsafePointer(to: &v1) { (p) in print("v1:\(p)")}
            withUnsafePointer(to: &v2) { (p) in print("v2:\(p)")}
        }
        
        
        if false {
            
            print("EXColor.size=\(MemoryLayout<EXColor>.size), stride=\(MemoryLayout<EXColor>.stride)")
            var v1 = EXColor.red
            var v2 = EXColor.green
            var v3 = EXColor.blue
            
            //print("\(EXColor.red.rawValue)\(EXColor.green.rawValue)\(EXColor.blue.rawValue)")
            
            withUnsafePointer(to: &v1) { p in
                print("p1:\(p)")
            }
            withUnsafePointer(to: &v2) { p in
                print("p2:\(p)")
            }
            withUnsafePointer(to: &v3) { p in
                print("p3:\(p)")
            }
            
        }
        
        
        
        
        
        
        if false {
            let nums : [Int] = [11, 22, 33, 44, 55]
            let stride = MemoryLayout<Int>.stride
            let ptr = UnsafeMutableRawPointer.allocate(byteCount: MemoryLayout<Int>.stride * nums.count, alignment: MemoryLayout<Int>.stride)

            for i in 0 ... nums.count-1 {
                //ptr.advanced(by: stride*i).storeBytes(of: nums[i], as: Int.self)
                ptr.storeBytes(of: nums[i], toByteOffset: stride*i, as: Int.self)
            }

            for i in 0 ... nums.count-1 {
                var value = 0;
                //value = ptr.advanced(by: stride*i).load(as: Int.self)
                value = ptr.load(fromByteOffset: stride*i, as: Int.self)
                print("idnex=\(i), value=\(value)")
            }
            //内存回收
            ptr.deallocate()
        }
        
        if false {
            
            struct MyPerson {
                var id = 0
                var name = ""
            }
            
            var ptr = UnsafeMutablePointer<MyPerson>.allocate(capacity: 3)
            ptr.advanced(by: 0).initialize(to: MyPerson(id: 1, name: "ABC"))
            ptr.advanced(by: 1).initialize(to: MyPerson(id: 2, name: "DEF"))
            ptr.advanced(by: 2).initialize(to: MyPerson(id: 3, name: "GHI"))
            
            ptr.advanced(by: 0).pointee = MyPerson(id: 1, name: "ZZZZ")
            
            print("\(ptr.advanced(by: 0).pointee)")
            print("\(ptr.advanced(by: 1).pointee)")
            print("\(ptr.advanced(by: 2).pointee)")

            ptr.deinitialize(count: 3)
            ptr.deallocate()
        }
        
        if false {
            Explorer.center.main()
        }
        
        //start()
        
        if false {
            
            func testPoint(_ p: UnsafePointer<Int>){
                print(p[0])
                print(p[1])
            }
            
            let tuple = (20, 40)
            withUnsafePointer(to: tuple) { ptr in
                testPoint(UnsafeRawPointer(ptr).assumingMemoryBound(to: Int.self))
            }
        }
        
        if false {
            
            func testPoint(_ p: UnsafePointer<Int>){
                print(p[0])
                print(p[1])
            }
            
            let tuple = (20, 40)
            withUnsafePointer(to: tuple) { ptr in
                testPoint(UnsafeRawPointer(ptr).bindMemory(to: Int.self, capacity: 1))
            }
        }
        
        if false {
            
            func testPoint(_ p: UnsafePointer<Int8>){
                print(p)
            }
            
            let uintPtr = UnsafePointer<UInt8>.init(bitPattern: 10)
            uintPtr?.withMemoryRebound(to: Int8.self, capacity: 1, { (intptr : UnsafePointer<Int8>) in
                testPoint(intptr)
            })
        }
        
        if false {
            var person : NXPerson? = NXPerson(0, "x")
            unowned let p = person
            TypeDescriptor.typeDescriptor(person!)

            person = nil
        }
        
        if false {
            var age : Int? = 1
            age = 20
            let closule = {[age] in
                print("age0=\(age)")
            }
            age = age! + 10
            closule();
            age = 40
            closule();
            age = nil
            
            closule();

            print("age0=\(age)")
        }
        
        if false {
            TypeMirror.start()
        }
    }
}

