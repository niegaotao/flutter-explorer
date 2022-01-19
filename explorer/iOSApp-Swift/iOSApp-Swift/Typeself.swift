//
//  Typeself.swift
//  iOSApp-Swift
//
//  Created by 聂高涛 on 2022/1/10.
//

import UIKit

//self Self .type type(of:)一共四个


class Typeself {

    func a(){
        
        let t1 = Typeself()
        t1.self//实例自己

        let t2 = Typeself.self//元类
        
        print(self)//实例自己
    }
    
    static func b(){
        print(self)//类自身
    }
    
    static let age = 10
    //let __age = Self.age//类自己
}

//只能被class遵
protocol Myprotocol : AnyObject {
    
}

extension Typeself : Myprotocol {
    
}

var ary : [Any] = [1, "String", Typeself.self, Typeself()]//任务类型
var array : [AnyObject] = [Typeself()] //放obj类型
var arry2 :[AnyClass] = [Typeself.self]//class


var t1 = Typeself()
var t2 : AnyObject = t1.self
//var t3 : AnyClass = t1.Self
var t3 : AnyClass = Typeself.self//Typeself.Type
var t4 : AnyClass = type(of: t1)//type(of: 1)//动态类型//Self






