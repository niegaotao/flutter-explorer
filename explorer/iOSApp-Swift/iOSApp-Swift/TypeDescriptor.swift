//
//  TypeDescriptor.swift
//  iOSApp-Swift
//
//  Created by 聂高涛 on 2022/1/11.
//

import UIKit

class TypeDescriptor {
    static func typeDescriptor(_ objc:AnyObject, raw:Bool = true, heap:Bool = true, metadata:Bool = true){
        let rawPtr = Unmanaged.passUnretained(objc).toOpaque()
        let heapPtr = rawPtr.bindMemory(to: HeapObject.self, capacity: 1)
        let metadataPtr = heapPtr.pointee.metadata.bindMemory(to: TargetClassMetadata.self, capacity: MemoryLayout<TargetClassMetadata>.stride)
        
        if(raw){
            print("rawPtr:\(rawPtr)")
        }
        if(heap){
            print(heapPtr.pointee)
        }
        if(metadata){
            print(metadataPtr.pointee)
        }
    }
}

struct HeapObject {
    var metadata : UnsafeRawPointer
    var refCounts: UInt64
}

struct TargetRelativeDirectPointer<Pointee> {
    var offset : Int32
    mutating func getmeasureRealitiveOffset() -> UnsafeMutablePointer<Pointee>{
        let offset = self.offset
        return withUnsafePointer(to: &self){ p in
            return UnsafeMutablePointer(mutating: UnsafeRawPointer(p).advanced(by: numericCast(offset)).assumingMemoryBound(to: Pointee.self))
        }
    }
}

//==========================================================
struct TargetClassMetadata {
  var kind: Int
  var superClass: Any.Type
  var cacheData: (Int, Int)
  var data: Int
  var classFlags: Int32
  var instanceAddressPoint: UInt32
  var instanceSize: UInt32
  var instanceAlignmentMask: UInt16
  var reserved: UInt16
  var classSize: UInt32
  var classAddressPoint: UInt32
  var typeDescriptor: UnsafeMutableRawPointer
  var iVarDestroyer: UnsafeRawPointer
}


//类、结构体、枚举的描述
struct TargetClassDescriptor {
    var flags: Int32
    var parent: Int32
    var name: TargetRelativeDirectPointer<CChar>
    var accessFunctionPointer: TargetRelativeDirectPointer<UnsafeRawPointer>
    var fieldDescriptor: TargetRelativeDirectPointer<FieldDescriptor> //成员属性信息
    var superClassType: TargetRelativeDirectPointer<CChar>
    var metadataNegativeSizeInWords: Int32
    var metadataPositiveSizeInWords: Int32
    var numImmediateMembers: Int32
    var numFields: Int32
    var fieldOffsetVectorOffset: Int32//每一个属性距离当前实例对象内存地址的偏移量
    var Offset: Int32
    var size: Int32
    //V-Table//函数列表
}

struct FieldDescriptor {
    var ManagedTypeName : TargetRelativeDirectPointer<CChar>
    var superClass : TargetRelativeDirectPointer<CChar>
    var kind: UInt16
    var fieldRecordSize : UInt16
    var numFields : Int32
    var fields:FieldRecordBuffer<FieldRecord>
}

struct FieldRecordBuffer<Element> {
    var element : Element
    mutating func buffer(n:Int) -> UnsafeBufferPointer<Element>{
        return withUnsafePointer(to: &self){
            let ptr = $0.withMemoryRebound(to: Element.self, capacity: 1){ start in
                return start
            }
            return UnsafeBufferPointer(start: ptr, count: n)
        }
    }
    
    mutating func index(of i:Int) -> UnsafeMutablePointer<Element> {
        return withUnsafePointer(to: &self){
            return UnsafeMutablePointer(mutating: UnsafeRawPointer($0).assumingMemoryBound(to: Element.self).advanced(by: i))
        }
    }
}

struct FieldRecord {
    var fieldRecordFlags : Int32
    var ManagedTypeName: TargetRelativeDirectPointer<CChar>
    var fieldName:TargetRelativeDirectPointer<UInt8>
}




//===================================================
struct TargetStructMetadata {
  
}

struct TargetStructDescripror {
  
}

//===================================================
struct TargetEnumMetadata {
    var kind:Int
    var typeDescriptor : UnsafeMutablePointer<TargetEnumDescripror>
}

struct TargetEnumDescripror {
    var flags: Int32
    var parent: Int32
    var name: TargetRelativeDirectPointer<CChar>
    var accessFunctionPointer: TargetRelativeDirectPointer<UnsafeRawPointer>
    var fieldDescriptor: TargetRelativeDirectPointer<FieldDescriptor> //成员属性信息
    var numPayloadCasesAndPayloadSizeOffset : UInt32
    var numEmptyCases:UInt32
}


