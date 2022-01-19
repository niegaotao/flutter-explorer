import MachO

func start(){
    class LGTeacher{
        var age: Int = 18
        var name: String = "Kody"
    }

    var size: UInt = 0
    //__swift5_types section 的pFile
    var ptr = getsectdata("__TEXT", "__swift5_types", &size)
    //print(ptr)
    //获取当前程序运行地址 0x0000000100000000
    var mhHeaderPtr = _dyld_get_image_header(0)
    var setCommond64Ptr = getsegbyname("__LINKEDIT")
    var linkBaseAddress: UInt64 = 0
    if let vmaddr = setCommond64Ptr?.pointee.vmaddr, let fileOff = setCommond64Ptr?.pointee.fileoff{
        linkBaseAddress = vmaddr - fileOff
    }

    var offset: UInt64 = 0
    if let unwrappedPtr = ptr{
        let intRepresentation = UInt64(bitPattern: Int64(Int(bitPattern: unwrappedPtr)))
        offset = intRepresentation - linkBaseAddress
    }

    //DataLo的内存地址
    let mhHeaderPtr_IntRepresentation = UInt64(bitPattern: Int64(Int(bitPattern: mhHeaderPtr)))

    var dataLoAddress = mhHeaderPtr_IntRepresentation + offset
    //print(UnsafePointer<UInt32>.init(bitPattern: Int(exactly: dataLoAddress) ?? 0)?.pointee)

    var dataLoAddressPtr = withUnsafePointer(to: &dataLoAddress){return $0}
    //print(dataLoAddressPtr)

    var dataLoContent = UnsafePointer<UInt32>.init(bitPattern: Int(exactly: dataLoAddress) ?? 0)?.pointee

    let typeDescOffset = UInt64(dataLoContent!) + offset - linkBaseAddress

    var typeDescAddress = typeDescOffset + mhHeaderPtr_IntRepresentation

    //print(typeDescAddress)
    struct TargetClassDescriptor{
        var flags: UInt32
        var parent: UInt32
        var name: Int32
        var accessFunctionPointer: Int32
        var fieldDescriptor: Int32
        var superClassType: Int32
        var metadataNegativeSizeInWords: UInt32
        var metadataPositiveSizeInWords: UInt32
        var numImmediateMembers: UInt32
        var numFields: UInt32
        var fieldOffsetVectorOffset: UInt32
        var Offset: UInt32
        var size: UInt32
    }

    let classDescriptor = UnsafePointer<TargetClassDescriptor>.init(bitPattern: Int(exactly: typeDescAddress) ?? 0)?.pointee


    if let name = classDescriptor?.name{
        let nameOffset = Int64(name) + Int64(typeDescOffset) + 8
        print(nameOffset)
        let nameAddress = nameOffset + Int64(mhHeaderPtr_IntRepresentation)
        print(nameAddress)
        if let cChar = UnsafePointer<CChar>.init(bitPattern: Int(nameAddress)){
            print(String(cString: cChar))
        }
    }


    let filedDescriptorRelaticveAddress = typeDescOffset + 16 + mhHeaderPtr_IntRepresentation
    //print(filedDescriptorAddress)

    struct FieldDescriptor  {
        var mangledTypeName: Int32
        var superclass: Int32
        var Kind: UInt16
        var fieldRecordSize: UInt16
        var numFields: UInt32
    //    var fieldRecords: [FieldRecord]
    }

    struct FieldRecord{
        var Flags: UInt32
        var mangledTypeName: Int32
        var fieldName: UInt32
    }

    //print(filedDescriptorAddress)
    //let fieldDescriptor = UnsafePointer<FieldDescriptor>.init(bitPattern: Int(exactly: filedDescriptorAddress) ?? 0)?.pointee
    //print("end"

    let fieldDescriptorOffset = UnsafePointer<UInt32>.init(bitPattern: Int(exactly: filedDescriptorRelaticveAddress) ?? 0)?.pointee
    //print(fieldDescriptorOffset)
    let fieldDescriptorAddress = filedDescriptorRelaticveAddress + UInt64(fieldDescriptorOffset!)

    let fieldDescriptor = UnsafePointer<FieldDescriptor>.init(bitPattern: Int(exactly: fieldDescriptorAddress) ?? 0)?.pointee


    for i in 0..<fieldDescriptor!.numFields{
        let stride: UInt64 = UInt64(i * 12)
        let fieldRecordAddress = fieldDescriptorAddress + stride + 16
    //    print(fieldRecordRelactiveAddress)
    //    let fieldRecord = UnsafePointer<FieldRecord>.init(bitPattern: Int(exactly: fieldRecordAddress) ?? 0)?.pointee
    //    print(fieldRecord)
        let fieldNameRelactiveAddress = UInt64(2 * 4) + fieldRecordAddress - linkBaseAddress + mhHeaderPtr_IntRepresentation
        let offset = UnsafePointer<UInt32>.init(bitPattern: Int(exactly: fieldNameRelactiveAddress) ?? 0)?.pointee
    //    print(offset)
        let fieldNameAddress = fieldNameRelactiveAddress + UInt64(offset!) - linkBaseAddress
        if let cChar = UnsafePointer<CChar>.init(bitPattern: Int(fieldNameAddress)){
            print(String(cString: cChar))
        }
    }
}













