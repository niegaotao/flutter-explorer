//
//  Enums.swift
//  iOSApp-Swift
//
//  Created by 聂高涛 on 2022/1/19.
//

import UIKit

class Enums: NSObject {

}


enum EXColor {
    case red// = 1.0
    case green// = 2.0
    case blue// = 3.0
}

enum EXShape {
    case unknown
    case circle(radius: CGFloat)
    case rect(width:CGFloat, height:CGFloat)
}

enum EXWorkday {
    case workday(Bool)
    case weekend(Bool)
}

enum EXAssociation {
    case zero1
//    case one1(UInt)
//    case two1(UInt, Bool)
    case three1(UInt, Bool, UInt)

    case zero2
//    case one2(UInt)
//    case two2(UInt, Bool)
    case three2(UInt, Bool, UInt)
    
    case zero3
//    case one3(UInt)
//    case two3(UInt, Bool)
//    case three3(UInt, Bool, UInt)
}

//占用60个二进制位
struct EX60BitValue {
    var bool1 : Bool = true
    var bool2 : Bool = true
    var bool3 : Bool = true
    var bool4 : Bool = true
}

enum EXValue {
    case c11(Bool)
    case c12(Bool)
    case c13(Bool)
    case c14(Bool)
    case c15(Bool)
    case c16(Bool)
    case c17(Bool)
    case c18(Bool)
    
    case c21(Bool)
    case c22(Bool)
    case c23(Bool)
    case c24(Bool)
    case c25(Bool)
    case c26(Bool)
    case c27(Bool)
    case c28(Bool)
    
    
    case c31(Bool)
    case c32(Bool)
    case c33(Bool)
    case c34(Bool)
    case c35(Bool)
    case c36(Bool)
    case c37(Bool)
    case c38(Bool)
    
    case c41(Bool)
    case c42(Bool)
    case c43(Bool)
    case c44(Bool)
    case c45(Bool)
    case c46(Bool)
    case c47(Bool)
    case c48(Bool)
    
    case c51(Bool)
    case c52(Bool)
    case c53(Bool)
    case c54(Bool)
    case c55(Bool)
    case c56(Bool)
    case c57(Bool)
    case c58(Bool)
    
    case c61(Bool)
    case c62(Bool)
    case c63(Bool)
    case c64(Bool)
    case c65(Bool)
    case c66(Bool)
    case c67(Bool)
    case c68(Bool)
    
    
    case c71(Bool)
    case c72(Bool)
    case c73(Bool)
    case c74(Bool)
    case c75(Bool)
    case c76(Bool)
    case c77(Bool)
    case c78(Bool)
    
    case c81(Bool)
    case c82(Bool)
    case c83(Bool)
    case c84(Bool)
    case c85(Bool)
    case c86(Bool)
    case c87(Bool)
    case c88(Bool)
    
    case c(Bool)

}
