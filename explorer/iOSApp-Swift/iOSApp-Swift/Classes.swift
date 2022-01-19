//
//  Classes.swift
//  iOSApp-Swift
//
//  Created by 聂高涛 on 2021/12/29.
//

import Foundation
//sil_vtable NXPerson {
//  #NXPerson.age!getter: (NXPerson) -> () -> Int : @$s8NXPersonAAC3ageSivg    // NXPerson.age.getter
//  #NXPerson.age!setter: (NXPerson) -> (Int) -> () : @$s8NXPersonAAC3ageSivs    // NXPerson.age.setter
//  #NXPerson.age!modify: (NXPerson) -> () -> () : @$s8NXPersonAAC3ageSivM    // NXPerson.age.modify
//  #NXPerson.name!getter: (NXPerson) -> () -> String : @$s8NXPersonAAC4nameSSvg    // NXPerson.name.getter
//  #NXPerson.name!setter: (NXPerson) -> (String) -> () : @$s8NXPersonAAC4nameSSvs    // NXPerson.name.setter
//  #NXPerson.name!modify: (NXPerson) -> () -> () : @$s8NXPersonAAC4nameSSvM    // NXPerson.name.modify
//  #NXPerson.main: (NXPerson) -> () -> () : @$s8NXPersonAAC4mainyyF    // NXPerson.main()
//  #NXPerson.func3: (NXPerson) -> () -> () : @$s8NXPersonAAC5func3yyF    // NXPerson.func3()
//  #NXPerson.init!allocator: (NXPerson.Type) -> () -> NXPerson : @$s8NXPersonAACABycfC    // NXPerson.__allocating_init()
//  #NXPerson.deinit!deallocator: @$s8NXPersonAACfD    // NXPerson.__deallocating_deinit
//}
    
    
//class NXPerson  {
//    func func1(){}
//    final func func2(){}
//    dynamic func func3(){}
//    @objc func func4(){}
//    @objc dynamic func func5(){}
//    static func func6(){}
//}
//
//extension NXPerson {
//    func func11(){}
//    final func func12(){}
//    dynamic func func13(){}
//    @objc func func14(){}
//    @objc dynamic func func15(){}
//    static func func16(){}
//}
//
//class NXTeacher : NXPerson {
//    func func21(){}
//    final func func22(){}
//    dynamic func func23(){}
//    @objc func func24(){}
//    @objc dynamic func func25(){}
//    static func func26(){}
//}
//
//extension NXTeacher {
//    func func31(){}
//    final func func32(){}
//    dynamic func func33(){}
//    @objc func func34(){}
//    @objc dynamic func func35(){}
//    static func func36(){}
//}

class NXPerson {
  let id : Int
  var name : String
  init(_ id:Int, _ name:String){
    self.id = id
    self.name = name
  }
}

class NXSubject {
    var name = ""
    unowned var person : NXPerson? = nil
}
